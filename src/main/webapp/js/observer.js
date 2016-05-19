var isArray=function(value){
    if(Array.isArray){
        return Array.isArray(value);
    }else{
        return Object.prototype.toString.call(value)==='[object Array]';
    }
}
var isObject=function(value){
    return value !== null&&!isArray(value) && typeof value === 'object';
}

var observer = angular.module('observer', ['pascalprecht.translate', 'toaster', 'checklist-model', 'angucomplete-alt']);
observer.config(['$translateProvider', function ($translateProvider) {
		$translateProvider.useUrlLoader('REST/rest_service/getLanguages/');
		$translateProvider.preferredLanguage('en');
}]);

observer.factory("poollingFactory", function ($timeout) {
    var timeIntervalInSec = 60;
    function callFnOnInterval(fn, timeInterval) {
        var promise = $timeout(fn, 1000 * timeIntervalInSec);  
        return promise.then(function(){
            callFnOnInterval(fn, timeInterval);
        });
    };
    return {
        callFnOnInterval: callFnOnInterval
    };
});

observer.factory("repo", function () {
    function callServer(scope, http, toaster) {
    	if (!jQuery.isEmptyObject(scope.currentForm)) {
    		var toSend = angular.copy(scope.currentForm);
    		for (var i = 0; i < toSend.outSection.length; i++) {
    			for (var j = 0; j < toSend.outSection[i].outField.length; j++) {
    				var field = toSend.outSection[i].outField[j];
    				if (field.type == 'autocomplete') {
    					var sub = toSend.outSection[i].outField[j].value;
    					if (isObject(sub)) {
    						var val = sub.originalObject.key;
    						if (val == undefined || val == null) {
    							toSend.outSection[i].outField[j].value = null;
    						} else {
    							toSend.outSection[i].outField[j].value = val;
    						}
    					}
    					delete toSend.outSection[i].outField[j]['placeholder'];
    				}
    			}
    		}
	    	http({
				method: 'POST',
				url: 'REST/rest_service/updateForm/',
				data: toSend
			}).then(function successCallback(response) {
				//console.debug("Autosave");
				toaster.pop('success', "Autosave", "Data successfully saved");
			}, function errorCallback(response) {
				toaster.pop('error', "Autosave", "Cannot save data");
			});
    	}
    }
    return {
        callServer: callServer
    };
});

observer.directive('ngConfirmDeleteClick', [
	function(){
    	return {
        	priority: -1,
        	restrict: 'A',
        	link: function(scope, element, attrs){
        	element.bind('click', function(e){
            	var message = attrs.ngConfirmClick;
                	if(message && !confirm(message)){
                    	e.stopImmediatePropagation();
                    	e.preventDefault();
                	}
       	});
    	}
	}}]);

observer.controller('main-controller', ['$scope', '$translate', '$http', 'repo', 'poollingFactory', 'toaster', function ($scope, $translate, $http, repo, poollingFactory, toaster) {
	
	poollingFactory.callFnOnInterval(function () {
        $scope.calledServer = repo.callServer($scope, $http, toaster);
    });
	
	$scope.formHead = true;
	$scope.temporary = {};
	
	$scope.frontEndLang = 'EN';
	
	
	$scope.username = undefined;
	$scope.userLogged = false;
	
	$scope.menuVisible = true;
	$scope.insertNewFormVisible = false;
	$scope.formVisible = false;
	$scope.sectionVisible = false;
	
	$scope.formName = undefined;
	
	$scope.forms = [];
	
	$scope.currentForm = {};
	$scope.currentSection = {};
	
	$scope.saveShow = false;
	
	$scope.countries = [];
	
	$scope.selectedCountry = undefined;
	
	$scope.tmpCheckBoxes = {};
	
	$scope.init = function() {
		$http({
			method: 'GET',
			url: 'REST/rest_service/amILogged/'
		}).then(function successCallback(response) {
			if (response.data.LOGGED == 'TRUE') {
				$scope.userLogged = true;
				$scope.username = response.data.NAME;
				$translate.use(response.data.LANG);
			} else { 
				$scope.userLogged = false;
			}
			$http({
				method: 'GET',
				url: 'REST/rest_service/getForms/'
			}).then(function successCallback(response) {
				for (var form in response.data.formList) {
					$scope.forms.push(response.data.formList[form]);
				}
			}, function errorCallback(response) {
				toaster.pop('error', "Error", "Cannot get form list");
			});
		}, function errorCallback(response) {
			toaster.pop('error', "Error", "Cannot call the server");
		});
	};
	
	$scope.swapPage = function(page) {
		$('html, body').scrollTop(0);
		if (page == 'menu') {
			$scope.currentForm = {};
			$scope.menuVisible = true;
			$scope.insertNewFormVisible = false;
			$scope.formVisible = false;
			$scope.sectionVisible = false;
			$scope.saveShow = false;
			$http({
				method: 'GET',
				url: 'REST/rest_service/getForms/'
			}).then(function successCallback(response) {
				$scope.forms = [];
				for (var form in response.data.formList) {
					$scope.forms.push(response.data.formList[form]);
				}
			}, function errorCallback(response) {
				toaster.pop('error', "Error", "Cannot get form list");
			});
		} else if (page == 'new_form') {
			$scope.menuVisible = false;
			$scope.insertNewFormVisible = true;
			$scope.formVisible = false;
			$scope.sectionVisible = false;
			$scope.saveShow = false;
			if ($scope.countries.length == 0) {
				$http({
					method: 'GET',
					url: 'REST/rest_service/getCountries/'
				}).then(function successCallback(response) {
					for (var i = 0; i < response.data.length; i++) {
						$scope.countries.push({'text' : response.data[i].nameEn, 'key': response.data[i].id});
					}
				}, function errorCallback(response) {
					toaster.pop('error', "Error", "Cannot get countries list");
				});
			}
		} else if (page == 'form') {
			$scope.menuVisible = false;
			$scope.insertNewFormVisible = false;
			$scope.formVisible = true;
			$scope.sectionVisible = false;
			$scope.saveShow = true;
		} else if (page == 'formsection') {
			$scope.menuVisible = false;
			$scope.insertNewFormVisible = false;
			$scope.formVisible = false;
			$scope.sectionVisible = true;
			$scope.saveShow = true;
		}
	} 
	
	$scope.swapLang = function(lang) {
		//console.debug(lang);
		$translate.use(lang);
		$scope.frontEndLang = lang
		$http({
			method: 'GET',
			url: 'REST/rest_service/updateUserLang/' + lang
		}).then(function successCallback(response) {
			
		}, function errorCallback(response) {
			toaster.pop('error', "Error", "Cannot Calling Server. Error {6}");
		});
	};
	
	$scope.insertName = function() {
		$http({
			  method: 'POST',
			  url: 'REST/rest_service/insertUser/',
			  data: {'name' : $scope.username, 'lang' : $scope.frontEndLang}
			}).then(function successCallback(response) {
				$scope.userLogged = true;
			}, function errorCallback(response) {
				toaster.pop('error', "Error", "Cannot Call Server. Error {5}");
			});
	};
	
	$scope.insertNewForm = function() {
		$http({
			  method: 'POST',
			  url: 'REST/rest_service/insertForm/',
			  data: {'name' : $scope.formName, 'country' : $scope.selectedCountry}
			}).then(function successCallback(response) {
				console.debug(response.data);
				$scope.currentForm = response.data;
				$scope.swapPage('form');
				$scope.selectedCountry = undefined;
			}, function errorCallback(response) {
				toaster.pop('error', "Error", "Cannot Call Server. Error {2}");
			});
	}
	
	$scope.deleteForm = function(id) {
		var translate = $translate.instant('CONFIRMDELETE');
		if (confirm(translate)) {
			$http({
				  method: 'GET',
				  url: 'REST/rest_service/deleteForm/' + id,
				}).then(function successCallback(response) {
					console.debug(response.data);
					for (var i = 0; i < $scope.forms.length; i++) {
						if ($scope.forms[i].ID == id) {
							$scope.forms.splice(i, 1);
							break;
						}
					}
					toaster.pop('success', "Delete", "Form has been deleted");
				}, function errorCallback(response) {
					toaster.pop('error', "Error", "Cannot Delete form. Error {500}");
				});
		}
	}
	
	$scope.getFormSection = function(selectedSection) {
		//console.debug(selectedSection);
		for (var i = 0; i < $scope.currentForm.outSection.length; i++) {
			if ($scope.currentForm.outSection[i].name == selectedSection) {
				$scope.currentSection = $scope.currentForm.outSection[i];
				$scope.swapPage('formsection');
				break;
			}
		}
	}
	
	$scope.save = function() {
		var toSend = angular.copy($scope.currentForm);
		for (var i = 0; i < toSend.outSection.length; i++) {
			for (var j = 0; j < toSend.outSection[i].outField.length; j++) {
				var field = toSend.outSection[i].outField[j];
				if (field.type == 'autocomplete') {
					var sub = toSend.outSection[i].outField[j].value;
					if (isObject(sub)) {
						var val = sub.originalObject.key;
						if (val == undefined || val == null) {
							toSend.outSection[i].outField[j].value = null;
						} else {
							toSend.outSection[i].outField[j].value = val;
						}
					}
					delete toSend.outSection[i].outField[j]['placeholder'];
				}
			}
		}
		$http({
			method: 'POST',
			url: 'REST/rest_service/updateForm/',
			data: toSend
		}).then(function successCallback(response) {
			toaster.pop('success', "Save", "Data successfully saved");
		}, function errorCallback(response) {
			toaster.pop('error', "Save", "Cannot save data");
		});
	}
	
	$scope.getForm = function(Id) {
		console.debug(Id);
		$http({
			  method: 'GET',
			  url: 'REST/rest_service/getForm/' + Id
			}).then(function successCallback(response) {
				console.debug(response.data);
				for (var i = 0; i < response.data.outSection.length; i++) {
					for (var j = 0; j < response.data.outSection[i].outField.length; j++) {
						if (response.data.outSection[i].outField[j].type == 'date') {
							if (response.data.outSection[i].outField[j].value != null) {
								response.data.outSection[i].outField[j].value = new Date(response.data.outSection[i].outField[j].value);
							}
						}
						else if (response.data.outSection[i].outField[j].type == 'autocomplete') {
							var value = response.data.outSection[i].outField[j].value;
							for (var x = 0; x < response.data.outSection[i].outField[j].outControlledList.length; x++) {
								var cL = response.data.outSection[i].outField[j].outControlledList[x];
								if (cL.key == value) {
									response.data.outSection[i].outField[j].placeholder = cL.value;
									break;
								}
							}
							/*var gguid = guid();
							response.data.outSection[i].outField[j].guid = gguid;
							$scope.temporary[gguid] = {};
							$scope.temporary[gguid]['data'] = []
							for (var x = 0; x < response.data.outSection[i].outField[j].outControlledList.length; x++) {
								$scope.temporary[gguid].data.push({label:response.data.outSection[i].outField[j].outControlledList[x].value,value:response.data.outSection[i].outField[j].outControlledList[x].key})
							}
							$scope.temporary[gguid].autocomplete_options = {
									suggest: function(term) { 
										var q = term.toLowerCase().trim();
										var results = [];
										for (var i = 0; i < $scope.temporary[gguid]['data'].length && results.length < 10; i++) {
											var opt = $scope.temporary[gguid]['data'][i];
											if (opt.label.toLowerCase().indexOf(q) === 0)
										        results.push({ label: opt.label, value: opt.value });
										}
										return results; 
									}
							};*/
						}
					}
				}
				$scope.currentForm = response.data;
				$scope.swapPage('form');
				toaster.pop('success', "Load", "Form data loaded");
			}, function errorCallback(response) {
			    toaster.pop('error', "Load", "Cannot get form data");
			});
	}
	
	$scope.checkBoxSwitch = function(oCl, cbName, oValue, tmpValue) {
		console.debug(oCl);
		console.debug(cbName);
		console.debug(oValue);
		console.debug(tmpValue);
	}
	
	}]);

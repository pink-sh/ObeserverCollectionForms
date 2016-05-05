CREATE TABLE SYSTEM (VERSION VARCHAR(15));
CREATE TABLE O_WORK (ID INT PRIMARY KEY, NAME VARCHAR(12));
CREATE TABLE LABELS (NAME VARCHAR(255), VAL VARCHAR(255), LANG VARCHAR(255));
CREATE TABLE LANGUAGES (NAME VARCHAR(255), CODE VARCHAR(2));
CREATE TABLE USERLOGGED (NAME VARCHAR(255), LANG VARCHAR(2));
CREATE TABLE FORMS (ID INTEGER IDENTITY PRIMARY KEY, NAME VARCHAR(255), ENTERDATE DATE, MODIFYDATE DATE, COUNTRY VARCHAR(3));
CREATE TABLE FORMSECTIONS (ID INTEGER IDENTITY PRIMARY KEY, NAME VARCHAR(255));
CREATE TABLE FORMFIELDS (ID INTEGER IDENTITY PRIMARY KEY, SECTION INTEGER, NAME VARCHAR(255), LABEL VARCHAR(255), FTYPE VARCHAR(30), CONTROLLEDLIST VARCHAR(100), MANDATORY BOOLEAN DEFAULT FALSE NOT NULL);
CREATE TABLE CONTROLLEDLIST (CL_NAME VARCHAR(255), CL_KEY VARCHAR(100), CL_VALUE VARCHAR(100));
CREATE TABLE DATA (FORM INTEGER, SECTION INTEGER, FIELD INTEGER, INSERTEDVALUE LONGVARCHAR);
CREATE TABLE COUNTRIES (ID INTEGER IDENTITY PRIMARY KEY, NAME_EN VARCHAR(255), NAME_FR VARCHAR(255), NAME_ES VARCHAR(255), NAME_RU VARCHAR(255), NAME_AR VARCHAR(255), NAME_ZH VARCHAR(255), ISO2 VARCHAR(2), ISO3 VARCHAR(3))
CREATE TABLE GEARTYPES  (ID INTEGER IDENTITY PRIMARY KEY, CODE VARCHAR(4), NAME_EN VARCHAR(255), NAME_FR VARCHAR(255), NAME_ES VARCHAR(255) );
CREATE TABLE YESNO  (ID INTEGER IDENTITY PRIMARY KEY, CODE VARCHAR(4), NAME_EN VARCHAR(255), NAME_FR VARCHAR(255), NAME_ES VARCHAR(255) );
CREATE TABLE CHECKBOXTEST  (ID INTEGER IDENTITY PRIMARY KEY, CODE VARCHAR(4), NAME_EN VARCHAR(255), NAME_FR VARCHAR(255), NAME_ES VARCHAR(255) );

INSERT INTO SYSTEM (VERSION) VALUES ('0.5.0');

INSERT INTO CONTROLLEDLIST (CL_NAME, CL_KEY, CL_VALUE) VALUES ('COUNTRIES', 'ISO3', 'NAME_EN');
INSERT INTO CONTROLLEDLIST (CL_NAME, CL_KEY, CL_VALUE) VALUES ('GEARTYPES', 'CODE', 'NAME_EN');
INSERT INTO CONTROLLEDLIST (CL_NAME, CL_KEY, CL_VALUE) VALUES ('YESNO', 'CODE', 'NAME_EN');
INSERT INTO CONTROLLEDLIST (CL_NAME, CL_KEY, CL_VALUE) VALUES ('CHECKBOXTEST', 'CODE', 'NAME_EN');

INSERT INTO FORMSECTIONS (NAME) VALUES ('Form 1 - GEN');
INSERT INTO FORMSECTIONS (NAME) VALUES ('Form 2 - LL');
INSERT INTO FORMSECTIONS (NAME) VALUES ('Form 2 - GIL');
INSERT INTO FORMSECTIONS (NAME) VALUES ('Form 2 - PS');
INSERT INTO FORMSECTIONS (NAME) VALUES ('Form 2 - PL');
INSERT INTO FORMSECTIONS (NAME) VALUES ('Form 3 - GEN');
INSERT INTO FORMSECTIONS (NAME) VALUES ('Form 4 - LL');
INSERT INTO FORMSECTIONS (NAME) VALUES ('Form 4 - GIL');
INSERT INTO FORMSECTIONS (NAME) VALUES ('Form 4 - PS');
INSERT INTO FORMSECTIONS (NAME) VALUES ('Form 4 - PL');
INSERT INTO FORMSECTIONS (NAME) VALUES ('Form 5 - GEN');
INSERT INTO FORMSECTIONS (NAME) VALUES ('Form 6 - GEN');

INSERT INTO FORMFIELDS (SECTION, NAME, LABEL, FTYPE, CONTROLLEDLIST) VALUES (0, 'Test01', 'LABEL01', 'text', NULL);
INSERT INTO FORMFIELDS (SECTION, NAME, LABEL, FTYPE, CONTROLLEDLIST) VALUES (0, 'Test02', 'COUNTRY', 'dropdown', 'COUNTRIES');
INSERT INTO FORMFIELDS (SECTION, NAME, LABEL, FTYPE, CONTROLLEDLIST) VALUES (0, 'Test03', 'RADIOTEST', 'radio', 'YESNO');
INSERT INTO FORMFIELDS (SECTION, NAME, LABEL, FTYPE, CONTROLLEDLIST) VALUES (0, 'TestCheckBox', 'CHECKBOXTEST', 'checkbox', 'CHECKBOXTEST');
INSERT INTO FORMFIELDS (SECTION, NAME, LABEL, FTYPE, CONTROLLEDLIST, MANDATORY) VALUES (0, 'TestMultiple', 'COUNTRY', 'multiple', 'COUNTRIES', TRUE);
INSERT INTO FORMFIELDS (SECTION, NAME, LABEL, FTYPE, CONTROLLEDLIST) VALUES (1, 'Test04', 'LABEL03', 'text', NULL);
INSERT INTO FORMFIELDS (SECTION, NAME, LABEL, FTYPE, CONTROLLEDLIST, MANDATORY) VALUES (1, 'Test05', 'GEARTYPES', 'dropdown', 'GEARTYPES', TRUE);
INSERT INTO FORMFIELDS (SECTION, NAME, LABEL, FTYPE, CONTROLLEDLIST, MANDATORY) VALUES (2, 'Test06', 'LABEL04', 'text', NULL, TRUE);
INSERT INTO FORMFIELDS (SECTION, NAME, LABEL, FTYPE, CONTROLLEDLIST) VALUES (3, 'Test07', 'LABEL05', 'text', NULL);
INSERT INTO FORMFIELDS (SECTION, NAME, LABEL, FTYPE, CONTROLLEDLIST) VALUES (4, 'Test08', 'LABEL06', 'text', NULL);
INSERT INTO FORMFIELDS (SECTION, NAME, LABEL, FTYPE, CONTROLLEDLIST) VALUES (5, 'Test09', 'LABEL07', 'text', NULL);
INSERT INTO FORMFIELDS (SECTION, NAME, LABEL, FTYPE, CONTROLLEDLIST) VALUES (6, 'Test10', 'LABEL08', 'text', NULL);
INSERT INTO FORMFIELDS (SECTION, NAME, LABEL, FTYPE, CONTROLLEDLIST) VALUES (7, 'Test11', 'LABEL09', 'text', NULL);
INSERT INTO FORMFIELDS (SECTION, NAME, LABEL, FTYPE, CONTROLLEDLIST) VALUES (8, 'Test12', 'LABEL10', 'text', NULL);
INSERT INTO FORMFIELDS (SECTION, NAME, LABEL, FTYPE, CONTROLLEDLIST) VALUES (9, 'Test13', 'LABEL11', 'text', NULL);
INSERT INTO FORMFIELDS (SECTION, NAME, LABEL, FTYPE, CONTROLLEDLIST) VALUES (10, 'Test14', 'LABEL12', 'text', NULL);
INSERT INTO FORMFIELDS (SECTION, NAME, LABEL, FTYPE, CONTROLLEDLIST) VALUES (11, 'Test15', 'LABEL13', 'text', NULL);

INSERT INTO LANGUAGES VALUES ('English', 'EN');
INSERT INTO LANGUAGES VALUES ('French', 'FR');

INSERT INTO LABELS VALUES ('INSERT_NAME', 'Insert your name', 'EN');
INSERT INTO LABELS VALUES ('INSERT_NAME', 'Insérez votre nom', 'FR');
INSERT INTO LABELS VALUES ('COPYRIGHT', 'Copyright', 'EN');
INSERT INTO LABELS VALUES ('COPYRIGHT', U&'droits d\0027auteur', 'FR');
INSERT INTO LABELS VALUES ('ENGLISH', 'English', 'EN');
INSERT INTO LABELS VALUES ('ENGLISH', 'Anglais', 'FR');
INSERT INTO LABELS VALUES ('FRENCH', 'French', 'EN');
INSERT INTO LABELS VALUES ('FRENCH', 'Français', 'FR');
INSERT INTO LABELS VALUES ('TITLE', 'Observer Collection Form', 'EN');
INSERT INTO LABELS VALUES ('TITLE', 'Observer Formulaire de collecte', 'FR');
INSERT INTO LABELS VALUES ('SUBMIT', 'Submit', 'EN');
INSERT INTO LABELS VALUES ('SUBMIT', 'Soumettre', 'FR');
INSERT INTO LABELS VALUES ('WELCOME', 'Welcome', 'EN');
INSERT INTO LABELS VALUES ('WELCOME', 'Bienvenue', 'FR');
INSERT INTO LABELS VALUES ('STARTNEWFORM', 'Start a new form', 'EN');
INSERT INTO LABELS VALUES ('STARTNEWFORM', 'Démarrer une nouvelle forme', 'FR');
INSERT INTO LABELS VALUES ('GOTOMAINMENU', 'Main Menu', 'EN');
INSERT INTO LABELS VALUES ('GOTOMAINMENU', 'Menu principal', 'FR');
INSERT INTO LABELS VALUES ('INSERTFORMNAME', 'Insert the form name', 'EN');
INSERT INTO LABELS VALUES ('INSERTFORMNAME', 'Insérez le nom du formulaire', 'FR');
INSERT INTO LABELS VALUES ('SELECTAFORM', 'Inserted Forms', 'EN');
INSERT INTO LABELS VALUES ('SELECTAFORM', 'Formulaires inséré', 'FR');
INSERT INTO LABELS VALUES ('BACKTOSECTIONLIST', 'Back to sections', 'EN');
INSERT INTO LABELS VALUES ('BACKTOSECTIONLIST', 'Retour aux articles', 'FR');
INSERT INTO LABELS VALUES ('SELECTONE', '-- Select one --', 'EN');
INSERT INTO LABELS VALUES ('SELECTONE', '-- Sélectionnez un --', 'FR');
INSERT INTO LABELS VALUES ('EXPORT', 'Export to XML', 'EN');
INSERT INTO LABELS VALUES ('EXPORT', 'Exporter vers XML', 'FR');
INSERT INTO LABELS VALUES ('INSERTEDON', 'Inserted On', 'EN');
INSERT INTO LABELS VALUES ('INSERTEDON', 'Insérée le', 'FR');
INSERT INTO LABELS VALUES ('INSERTEDONCOLUMN', 'Inserted On:', 'EN');
INSERT INTO LABELS VALUES ('INSERTEDONCOLUMN', 'Insérée le:', 'FR');
INSERT INTO LABELS VALUES ('MODIFIEDON', 'Modified On', 'EN');
INSERT INTO LABELS VALUES ('MODIFIEDON', 'Modifié le', 'FR');
INSERT INTO LABELS VALUES ('SAVEFORM', 'Save Form', 'EN');
INSERT INTO LABELS VALUES ('SAVEFORM', 'Enregistrer le formulaire', 'FR');
INSERT INTO LABELS VALUES ('FORCOUNTRY', 'For Country', 'EN');
INSERT INTO LABELS VALUES ('FORCOUNTRY', 'Pour Pays', 'FR');
INSERT INTO LABELS VALUES ('COUNTRY', 'Country', 'EN');
INSERT INTO LABELS VALUES ('COUNTRY', 'Pays', 'FR');
INSERT INTO LABELS VALUES ('GEARTYPES', 'Gear type', 'EN');
INSERT INTO LABELS VALUES ('GEARTYPES', U&'Type d\0027engin', 'FR');
INSERT INTO LABELS VALUES ('COUNTRYCOLUMN', 'Country:', 'EN');
INSERT INTO LABELS VALUES ('COUNTRYCOLUMN', 'Pays:', 'FR');
INSERT INTO LABELS VALUES ('DELETEFORM', 'Delete Form', 'EN');
INSERT INTO LABELS VALUES ('DELETEFORM', 'Supprimer le formulaire', 'FR');
INSERT INTO LABELS VALUES ('CONFIRMDELETE', 'Are you sure to delete this form?', 'EN');
INSERT INTO LABELS VALUES ('CONFIRMDELETE', 'Êtes-vous sûr de vouloir supprimer cette forme?', 'FR');
INSERT INTO LABELS VALUES ('LABEL01', 'Label01', 'EN');
INSERT INTO LABELS VALUES ('LABEL01', 'Label01', 'FR');
INSERT INTO LABELS VALUES ('LABEL02', 'Label02', 'EN');
INSERT INTO LABELS VALUES ('LABEL02', 'Label02', 'FR');
INSERT INTO LABELS VALUES ('LABEL03', 'Label03', 'EN');
INSERT INTO LABELS VALUES ('LABEL03', 'Label03', 'FR');
INSERT INTO LABELS VALUES ('LABEL04', 'Label04', 'EN');
INSERT INTO LABELS VALUES ('LABEL04', 'Label04', 'FR');
INSERT INTO LABELS VALUES ('LABEL05', 'Label05', 'EN');
INSERT INTO LABELS VALUES ('LABEL05', 'Label05', 'FR');
INSERT INTO LABELS VALUES ('LABEL06', 'Label06', 'EN');
INSERT INTO LABELS VALUES ('LABEL06', 'Label06', 'FR');
INSERT INTO LABELS VALUES ('LABEL07', 'Label07', 'EN');
INSERT INTO LABELS VALUES ('LABEL07', 'Label07', 'FR');
INSERT INTO LABELS VALUES ('LABEL08', 'Label08', 'EN');
INSERT INTO LABELS VALUES ('LABEL08', 'Label08', 'FR');
INSERT INTO LABELS VALUES ('LABEL09', 'Label09', 'EN');
INSERT INTO LABELS VALUES ('LABEL09', 'Label09', 'FR');
INSERT INTO LABELS VALUES ('LABEL10', 'Label10', 'EN');
INSERT INTO LABELS VALUES ('LABEL10', 'Label10', 'FR');
INSERT INTO LABELS VALUES ('LABEL11', 'Label11', 'EN');
INSERT INTO LABELS VALUES ('LABEL11', 'Label11', 'FR');
INSERT INTO LABELS VALUES ('LABEL12', 'Label12', 'EN');
INSERT INTO LABELS VALUES ('LABEL12', 'Label12', 'FR');
INSERT INTO LABELS VALUES ('LABEL13', 'Label13', 'EN');
INSERT INTO LABELS VALUES ('LABEL14', 'Label13', 'FR');
INSERT INTO LABELS VALUES ('RADIOTEST', 'Radio Test', 'EN');
INSERT INTO LABELS VALUES ('RADIOTEST', 'Radio Test[FR]', 'FR');
INSERT INTO LABELS VALUES ('CHECKBOXTEST', 'CheckBox Test', 'EN');
INSERT INTO LABELS VALUES ('CHECKBOXTEST', 'CheckBox Test[FR]', 'FR');

INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Eritrea', 'Érythrée', 'Eritrea', 'Эритрея', 'إريتريا', '厄立特里亚', 'ER', 'ERI')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('European Union (Member Organization)', 'Union européenne (Organisation Membre)', '', '', '', '', 'EU', 'EUR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Palau', 'Palaos', 'Palau', 'Палау', 'بالاو', '帕劳', 'PW', 'PLW')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Albania', 'Albanie', 'Albania', 'Албания', 'ألبانيا', '阿尔巴尼亚', 'AL', 'ALB')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Algeria', 'Algérie', 'Argelia', 'Алжир', 'الجزائر', '阿尔及利亚', 'DZ', 'DZA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Argentina', 'Argentine', 'Argentina', 'Аргентина', 'الأرجنتين', '阿根廷', 'AR', 'ARG')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Austria', 'Autriche', 'Austria', 'Австрия', 'النمسا', '奥地利', 'AT', 'AUT')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Bahrain', 'Bahreïn', 'Bahrein', 'Бахрейн', 'البحرين', '巴 林', 'BH', 'BHR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Barbados', 'Barbade', 'Barbados', 'Барбадос', 'بربادوس', '巴巴多斯', 'BB', 'BRB')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Belgium', 'Belgique', 'Bélgica', 'Бельгия', 'بلجيكا', '比利时', 'BE', 'BEL')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Benin', 'Bénin', 'Benin', 'Бенин', 'بنن', '贝 宁', 'BJ', 'BEN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Bhutan', 'Bhoutan', 'Bhután', 'Бутан', 'بوتان', '不 丹', 'BT', 'BTN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Bulgaria', 'Bulgarie', 'Bulgaria', 'Болгария', 'بلغاريا', '保加利亚', 'BG', 'BGR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Burundi', 'Burundi', 'Burundi', 'Бурунди', 'بوروندي', '布隆迪', 'BI', 'BDI')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Cameroon', 'Cameroun', 'Camerún', 'Камерун', 'الكاميرون', '喀麦隆', 'CM', 'CMR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Cabo Verde', 'Cabo Verde', 'Cabo Verde', 'Кабо-Верде', 'كابو فيردي', '佛得角', 'CV', 'CPV')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Chad', 'Tchad', 'Chad', 'Чад', 'تشاد', '乍 得', 'TD', 'TCD')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Chile', 'Chili', 'Chile', 'Чили', 'شيلى', '智 利', 'CL', 'CHL')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Colombia', 'Colombie', 'Colombia', 'Колумбия', 'كولومبيا', '哥伦比亚', 'CO', 'COL')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Costa Rica', 'Costa Rica', 'Costa Rica', 'Коста-Рика', 'كوستاريكا', '哥斯达黎加', 'CR', 'CRI')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Cuba', 'Cuba', 'Cuba', 'Куба', 'كوبا', '古 巴', 'CU', 'CUB')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Denmark', 'Danemark', 'Dinamarca', 'Дания', 'الدانمرك', '丹 麦', 'DK', 'DNK')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Dominica', 'Dominique', 'Dominica', 'Доминика', 'دومينيكا', '多米尼克', 'DM', 'DMA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Ecuador', 'Équateur', 'Ecuador', 'Эквадор', 'إكوادور', '厄瓜多尔', 'EC', 'ECU')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('El Salvador', 'El Salvador', 'El Salvador', 'Сальвадор', 'السلفادور', '萨尔瓦多', 'SV', 'SLV')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Ethiopia', 'Éthiopie', 'Etiopía', 'Эфиопия', 'إثيوبيا', '埃塞俄比亚', 'ET', 'ETH')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Finland', 'Finlande', 'Finlandia', 'Финляндия', 'فنلندا', '芬 兰', 'FI', 'FIN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Gabon', 'Gabon', 'Gabón', 'Габон', 'غابون', '加 蓬', 'GA', 'GAB')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Germany', 'Allemagne', 'Alemania', 'Германия', 'ألمانيا', '德 国', 'DE', 'DEU')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Ghana', 'Ghana', 'Ghana', 'Гана', 'غانا', '加 纳', 'GH', 'GHA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Grenada', 'Grenade', 'Granada', 'Гренада', 'غرينادا', '格林纳达', 'GD', 'GRD')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Guinea', 'Guinée', 'Guinea', 'Гвинея', 'غينيا', '几内亚', 'GN', 'GIN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Guyana', 'Guyana', 'Guyana', 'Гайана', 'غيانا', '圭亚那', 'GY', 'GUY')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Haiti', 'Haïti', 'Haití', 'Гаити', 'هايتي', '海 地', 'HT', 'HTI')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Iceland', 'Islande', 'Islandia', 'Исландия', 'آيسلندا', '冰 岛', 'IS', 'ISL')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Iraq', 'Iraq', 'Iraq', 'Ирак', 'العراق', '伊拉克', 'IQ', 'IRQ')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Ireland', 'Irlande', 'Irlanda', 'Ирландия', 'آيرلندا', '爱尔兰', 'IE', 'IRL')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Israel', 'Israël', 'Israel', 'Израиль', 'إسرائيل', '以色列', 'IL', 'ISR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Jamaica', 'Jamaïque', 'Jamaica', 'Ямайка', 'جامايكا', '牙买加', 'JM', 'JAM')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Japan', 'Japon', 'Japón', 'Япония', 'اليابان', '日 本', 'JP', 'JPN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Kenya', 'Kenya', 'Kenya', 'Кения', 'كينيا', '肯尼亚', 'KE', 'KEN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Lebanon', 'Liban', 'Líbano', 'Ливан', 'لبنان', '黎巴嫩', 'LB', 'LBN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Lesotho', 'Lesotho', 'Lesotho', 'Лесото', 'ليسوتو', '莱索托', 'LS', 'LSO')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Liberia', 'Libéria', 'Liberia', 'Либерия', 'ليبريا', '利比里亚', 'LR', 'LBR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Luxembourg', 'Luxembourg', 'Luxemburgo', 'Люксембург', 'لكسمبرغ', '卢森堡', 'LU', 'LUX')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Malawi', 'Malawi', 'Malawi', 'Малави', 'ملاوي', '马拉维', 'MW', 'MWI')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Maldives', 'Maldives', 'Maldivas', 'Мальдивы', 'ملديف', '马尔代夫', 'MV', 'MDV')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Malta', 'Malte', 'Malta', 'Мальта', 'مالطة', '马耳他', 'MT', 'MLT')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Mauritius', 'Maurice', 'Mauricio', 'Маврикий', 'موريشيوس', '毛里求斯', 'MU', 'MUS')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Mongolia', 'Mongolie', 'Mongolia', 'Монголия', 'منغوليا', '蒙 古', 'MN', 'MNG')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Mozambique', 'Mozambique', 'Mozambique', 'Мозамбик', 'موزامبيق', '莫桑比克', 'MZ', 'MOZ')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Namibia', 'Namibie', 'Namibia', 'Намибия', 'ناميبيا', '纳米比亚', 'NA', 'NAM')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Netherlands', 'Pays-Bas', 'Países Bajos', 'Нидерланды', 'هولندا', '荷 兰', 'NL', 'NLD')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Nicaragua', 'Nicaragua', 'Nicaragua', 'Никарагуа', 'نيكاراغوا', '尼加拉瓜', 'NI', 'NIC')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Nigeria', 'Nigéria', 'Nigeria', 'Нигерия', 'نيجيريا', '尼日利亚', 'NG', 'NGA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Oman', 'Oman', 'Omán', 'Оман', 'عمان', '阿 曼', 'OM', 'OMN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Republic of Korea', 'République de Corée', 'República de Corea', 'Республика Корея', 'جمهورية كوريا', '大韩民国', 'KR', 'KOR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Marshall Islands', 'Îles Marshall', 'Islas Marshall', 'Маршалловы Острова', 'جزر مارشال', '马绍尔群岛', 'MH', 'MHL')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Latvia', 'Lettonie', 'Letonia', 'Латвия', 'لاتفيا', '拉脱维亚', 'LV', 'LVA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Estonia', 'Estonie', 'Estonia', 'Эстония', 'إستونيا', '爱沙尼亚', 'EE', 'EST')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Andorra', 'Andorre', 'Andorra', 'Андорра', 'أندورا', '安道尔', 'AD', 'AND')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Kiribati', 'Kiribati', 'Kiribati', 'Кирибати', 'كيريباس', '基里巴斯', 'KI', 'KIR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Monaco', 'Monaco', 'Mónaco', 'Монако', 'موناكو', '摩纳哥', 'MC', 'MCO')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Niue', 'Nioué', 'Niue', 'Ниуэ', 'نيوى', '纽 埃', 'NU', 'NIU')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Azerbaijan', 'Azerbaïdjan', 'Azerbaiyán', 'Азербайджан', 'أذربيجان', '阿塞拜疆', 'AZ', 'AZE')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Croatia', 'Croatie', 'Croacia', 'Хорватия', 'كرواتيا', '克罗地亚', 'HR', 'HRV')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Georgia', 'Géorgie', 'Georgia', 'Грузия', 'جورجيا', '格鲁吉亚', 'GE', 'GEO')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Brazil', 'Brésil', 'Brasil', 'Бразилия', 'البرازيل', '巴 西', 'BR', 'BRA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Montenegro', 'Monténégro', 'Montenegro', 'Черногория', 'الجبل الأسود', '黑山', 'ME', 'MNE')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Panama', 'Panama', 'Panamá', 'Панама', 'بناما', '巴拿馬', 'PA', 'PAN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Faroe Islands (Associate Member)', 'Îles Féroé (Membre associé)', 'Islas Feroe (Miembro Asociado)', 'Фарерские Острова (ассоциированный член)', 'جزر فيرويه', '法罗群岛 (准成员)', 'FO', 'FRO')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Afghanistan', 'Afghanistan', 'Afganistán', 'Афганистан', 'أفغانستان', '阿富汗', 'AF', 'AFG')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Angola', 'Angola', 'Angola', 'Ангола', 'أنغولا', '安哥拉', 'AO', 'AGO')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Antigua and Barbuda', 'Antigua-et-Barbuda', 'Antigua y Barbuda', 'Антигуа и Барбуда', 'أنتيغوا وبربودا', '安提瓜和巴布达', 'AG', 'ATG')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Australia', 'Australie', 'Australia', 'Австралия', 'أستراليا', '澳大利亚', 'AU', 'AUS')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Bahamas', 'Bahamas', 'Bahamas', 'Багамские Острова', 'جزر البهاما', '巴哈马', 'BS', 'BHS')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Bangladesh', 'Bangladesh', 'Bangladesh', 'Бангладеш', 'بنغلاديش', '孟加拉国', 'BD', 'BGD')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Belize', 'Belize', 'Belice', 'Белиз', 'بليز', '伯利兹', 'BZ', 'BLZ')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Bolivia (Plurinational State of)', 'Bolivie (État plurinational de)', 'Bolivia (Estado Plurinacional de)', 'Боливия (Многонациональное Государство)', 'بوليفيا - دولة .. المتعددة القوميات', '玻利维亚（多民族国）', 'BO', 'BOL')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Burkina Faso', 'Burkina Faso', 'Burkina Faso', 'Буркина-Фасо', 'بوركينا فاسو', '布基纳法索', 'BF', 'BFA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Cambodia', 'Cambodge', 'Camboya', 'Камбоджа', 'كمبوديا', '柬埔寨', 'KH', 'KHM')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Canada', 'Canada', 'Canadá', 'Канада', 'كندا', '加拿大', 'CA', 'CAN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Central African Republic', 'République centrafricaine', 'República Centroafricana', 'Центральноафриканская Республика', 'جمهورية أفريقيا الوسطى', '中非共和国', 'CF', 'CAF')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('China', 'Chine', 'China', 'Китай', 'الصين', '中 国', 'CN', 'CHN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Comoros', 'Comores', 'Comoras', 'Коморские Острова', 'جزر القمر', '科摩罗', 'KM', 'COM')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Cook Islands', 'Îles Cook', 'Islas Cook', 'Острова Кука', 'جزر كوك', '库克群岛', 'CK', 'COK')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES (U&'Côte d\0027Ivoire', U&'Côte d\0027Ivoire', U&'Côte d\0027Ivoire', 'Кот-д`Ивуар', 'كوت ديفوار', '科特迪瓦', 'CI', 'CIV')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Cyprus', 'Chypre', 'Chipre', 'Кипр', 'قبرص', '塞浦路斯', 'CY', 'CYP')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Djibouti', 'Djibouti', 'Djibouti', 'Джибути', 'جيبوتي', '吉布提', 'DJ', 'DJI')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Dominican Republic', 'République dominicaine', 'República Dominicana', 'Доминиканская Республика', 'الجمهورية الدومينيكية', '多米尼加共和国', 'DO', 'DOM')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Egypt', 'Égypte', 'Egipto', 'Египет', 'مصر', '埃 及', 'EG', 'EG')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Equatorial Guinea', 'Guinée équatoriale', 'Guinea Ecuatorial', 'Экваториальная Гвинея', 'غينيا الاستوائية', '赤道几内亚', 'GQ', 'GNQ')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Fiji', 'Fidji', 'Fiji', 'Фиджи', 'فيجي', '斐济', 'FJ', 'FJI')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('France', 'France', 'Francia', 'Франция', 'فرنسا', '法  国', 'FR', 'FRA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Gambia', 'Gambie', 'Gambia', 'Гамбия', 'غامبيا', '冈比亚', 'GM', 'GMB')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Greece', 'Grèce', 'Grecia', 'Греция', 'اليونان', '希 腊', 'GR', 'GRC')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Guatemala', 'Guatemala', 'Guatemala', 'Гватемала', 'غواتيمالا', '危地马拉', 'GT', 'GTM')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Guinea-Bissau', 'Guinée-Bissau', 'Guinea-Bissau', 'Гвинея-Бисау', 'غينيا - بيساو', '几内亚比绍', 'GW', 'GNB')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Hungary', 'Hongrie', 'Hungría', 'Венгрия', 'هنغاريا', '匈牙利', 'HU', 'HUN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Poland', 'Pologne', 'Polonia', 'Польша', 'بولندا', '波 兰', 'PL', 'POL')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Portugal', 'Portugal', 'Portugal', 'Португалия', 'البرتغال', '葡萄牙', 'PT', 'PRT')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Romania', 'Roumanie', 'Rumania', 'Румыния', 'رومانيا', '罗马尼亚', 'RO', 'ROU')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Saint Lucia', 'Sainte-Lucie', 'Santa Lucía', 'Сент-Люсия', 'سانت لوسيا', '圣卢西亚', 'LC', 'LCA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Samoa', 'Samoa', 'Samoa', 'Самоа', 'ساموا', '萨摩亚', 'WS', 'WSM')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Saudi Arabia', 'Arabie saoudite', 'Arabia Saudita', 'Саудовская Аравия', 'المملكة العربية السعودية', '沙特阿拉伯', 'SA', 'SAU')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Senegal', 'Sénégal', 'Senegal', 'Сенегал', 'السنغال', '塞内加尔', 'SN', 'SEN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Sierra Leone', 'Sierra Leone', 'Sierra Leona', 'Сьерра-Леоне', 'سيراليون', '塞拉利昂', 'SL', 'SLE')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Somalia', 'Somalie', 'Somalia', 'Сомали', 'الصومال', '索马里', 'SO', 'SOM')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Sri Lanka', 'Sri Lanka', 'Sri Lanka', 'Шри-Ланка', 'سري لانكا', '斯里兰卡', 'LK', 'LKA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Suriname', 'Suriname', 'Suriname', 'Суринам', 'سورينام', '苏里南', 'SR', 'SUR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Sweden', 'Suède', 'Suecia', 'Швеция', 'السويد', '瑞 典', 'SE', 'SWE')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Switzerland', 'Suisse', 'Suiza', 'Швейцария', 'سويسرا', '瑞 士', 'CH', 'CHE')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Thailand', 'Thaïlande', 'Tailandia', 'Таиланд', 'تايلند', '泰 国', 'TH', 'THA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Tonga', 'Tonga', 'Tonga', 'Тонга', 'تونغا', '汤 加', 'TO', 'TON')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Tunisia', 'Tunisie', 'Túnez', 'Тунис', 'تونس', '突尼斯', 'TN', 'TUN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Turkey', 'Turquie', 'Turquía', 'Турция', 'تركيا', '土耳其', 'TR', 'TUR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('United Kingdom', 'Royaume-Uni', 'Reino Unido', 'Соединенное Королевство', 'المملكة المتحدة', '联合王国', 'GB', 'GBR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Uruguay', 'Uruguay', 'Uruguay', 'Уругвай', 'أوروغواي', '乌拉圭', 'UY', 'URY')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Vanuatu', 'Vanuatu', 'Vanuatu', 'Вануату', 'فانواتو', '瓦努阿图', 'VU', 'VUT')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Viet Nam', 'Viet Nam', 'Viet Nam', 'Вьетнам', 'فييت نام', '越 南', 'VN', 'VNM')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Yemen', 'Yémen', 'Yemen', 'Йемен', 'اليمن', '也 门', 'YE', 'YEM')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Zambia', 'Zambie', 'Zambia', 'Замбия', 'زامبيا', '赞比亚', 'ZM', 'ZMB')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('South Africa', 'Afrique du Sud', 'Sudáfrica', 'Южная Африка', 'جنوب أفريقيا', '南 非', 'ZA', 'ZAF')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Ukraine', 'Ukraine', 'Ucrania', 'Украина', 'أوكرانيا', '乌克兰', 'UA', 'UKR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Singapore', 'Singapour', 'Singapur', 'Сингапур', 'سنغافورة', '新加坡', 'SG', 'SGP')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Tuvalu', 'Tuvalu', 'Tuvalu', 'Тувалу', 'توفالو', '图瓦卢', 'TV', 'TUV')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Tajikistan', 'Tadjikistan', 'Tayikistán', 'Таджикистан', 'طاجيكستان', '塔吉克斯坦', 'TJ', 'TJK')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Uzbekistan', 'Ouzbékistan', 'Uzbekistán', 'Узбекистан', 'أوزبكستان', '乌兹别克斯坦', 'UZ', 'UZB')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Slovakia', 'Slovaquie', 'Eslovaquia', 'Словакия', 'سلوفاكيا', '斯洛伐克', 'SK', 'SVK')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Serbia', 'Serbie', 'Serbia', 'Сербия', 'صربيا', '塞尔维亚', 'RS', 'SRB')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('South Sudan', 'Soudan du Sud', 'Sudán del Sur', 'Южный Судан', 'جنوب السودان', '南苏丹', 'SS', 'SSD')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('India', 'Inde', 'India', 'Индия', 'الهند', '印 度', 'IN', 'IND')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Indonesia', 'Indonésie', 'Indonesia', 'Индонезия', 'إندونيسيا', '印度尼西亚', 'ID', 'IDN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Iran (Islamic Republic of)', U&'Iran (République islamique d\0027)', 'Irán (República Islámica del)', 'Иран (Исламская Республика)', 'إيران', '伊 朗(伊斯兰共和国)', 'IR', 'IRN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Italy', 'Italie', 'Italia', 'Италия', 'إيطاليا', '意大利', 'IT', 'ITA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Jordan', 'Jordanie', 'Jordania', 'Иордания', 'الأردن', '约 旦', 'JO', 'JOR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Kuwait', 'Koweït', 'Kuwait', 'Кувейт', 'الكويت', '科威特', 'KW', 'KWT')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Czech Republic', 'République tchèque', 'República Checa', 'Чешская Республика', 'الجمهورية التشيكية', '捷克共和国', 'CZ', 'CZE')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES (U&'Lao People\0027s Democratic Republic', 'République démocratique populaire lao', 'República Democrática Popular Lao', 'Лаосская Народно-Демократическая Республика', 'جمهورية لاو الديمقراطية الشعبية', '老挝人民民主共和国', 'LA', 'LAO')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Libya', 'Libye', 'Libia', 'Ливия', 'ليبيا', '利比亚', 'LY', 'LBY')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Madagascar', 'Madagascar', 'Madagascar', 'Мадагаскар', 'مدغشقر', '马达加斯加', 'MG', 'MDG')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Malaysia', 'Malaisie', 'Malasia', 'Малайзия', 'ماليزيا', '马来西亚', 'MY', 'MYS')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Mali', 'Mali', 'Malí', 'Мали', 'مالي', '马 里', 'ML', 'MLI')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Mauritania', 'Mauritanie', 'Mauritania', 'Мавритания', 'موريتانيا', '毛里塔尼亚', 'MR', 'MRT')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Mexico', 'Mexique', 'México', 'Мексика', 'المكسيك', '墨西哥', 'MX', 'MEX')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Morocco', 'Maroc', 'Marruecos', 'Марокко', 'المغرب', '摩洛哥', 'MA', 'MAR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Myanmar', 'Myanmar', 'Myanmar', 'Мьянма', 'ميانمار', '缅 甸', 'MM', 'MMR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Nepal', 'Népal', 'Nepal', 'Непал', 'نيبال', '尼泊尔', 'NP', 'NPL')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('New Zealand', 'Nouvelle-Zélande', 'Nueva Zelandia', 'Новая Зеландия', 'نيوزيلندا', '新西兰', 'NZ', 'NZL')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Niger', 'Niger', 'Níger', 'Нигер', 'النيجر', '尼日尔', 'NE', 'NER')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Norway', 'Norvège', 'Noruega', 'Норвегия', 'النرويج', '挪 威', 'NO', 'NOR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Pakistan', 'Pakistan', 'Pakistán', 'Пакистан', 'باكستان', '巴基斯坦', 'PK', 'PAK')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Papua New Guinea', 'Papouasie-Nouvelle-Guinée', 'Papua Nueva Guinea', 'Папуа-Новая Гвинея', 'بابوا غينيا الجديدة ', '巴布亚新几内亚', 'PG', 'PNG')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Paraguay', 'Paraguay', 'Paraguay', 'Парагвай', 'باراغواي', '巴拉圭', 'PY', 'PRY')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Peru', 'Pérou', 'Perú', 'Перу', 'بيرو', '秘 鲁', 'PE', 'PER')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Philippines', 'Philippines', 'Filipinas', 'Филиппины', 'الفلبين', '菲律宾', 'PH', 'PHL')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Qatar', 'Qatar', 'Qatar', 'Катар', 'قطر', '卡塔尔', 'QA', 'QAT')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Rwanda', 'Rwanda', 'Rwanda', 'Руанда', 'رواندا', '卢旺达', 'RW', 'RWA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Saint Kitts and Nevis', 'Saint-Kitts-et-Nevis', 'Saint Kitts y Nevis', 'Сент-Китс и Невис', 'سانت كيتس ونيفيس', '圣基茨和尼维斯', 'KN', 'KNA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Saint Vincent and the Grenadines', 'Saint-Vincent-et-les Grenadines', 'San Vicente y las Granadinas', 'Сент-Винсент и Гренадины', 'سانت فنسنت وجزر غرينادين', '圣文森特和格林纳丁斯', 'VC', 'VCT')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Sao Tome and Principe', 'Sao Tomé-et-Principe', 'Santo Tomé y Príncipe', 'Сан-Томе и Принсипи', 'سان تومي وبرنسيبي', '圣多美和普林西比', 'ST', 'STP')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Seychelles', 'Seychelles', 'Seychelles', 'Сейшельские Острова', 'سيشيل', '塞舌尔', 'SC', 'SYC')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Solomon Islands', 'Îles Salomon', 'Islas Salomón', 'Соломоновы Острова', 'جزر سليمان', '所罗门群岛', 'SB', 'SLB')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Spain', 'Espagne', 'España', 'Испания', 'إسبانيا', '西班牙', 'ES', 'ESP')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Sudan', 'Soudan', 'Sudán', 'Судан', 'السودان', '苏 丹', 'SD', 'SDN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Swaziland', 'Swaziland', 'Swazilandia', 'Свазиленд', 'سوازيلند', '斯威士兰', 'SZ', 'SWZ')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Syrian Arab Republic', 'République arabe syrienne', 'República Árabe Siria', 'Сирийская Арабская Республика', 'الجمهورية العربية السورية', '阿拉伯叙利亚共和国', 'SY', 'SYR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Togo', 'Togo', 'Togo', 'Того', 'توغو', '多 哥', 'TG', 'TGO')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Trinidad and Tobago', 'Trinité-et-Tobago', 'Trinidad y Tabago', 'Тринидад и Тобаго', 'ترينيداد وتوباغو', '特立尼达和多巴哥', 'TT', 'TTO')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Uganda', 'Ouganda', 'Uganda', 'Уганда', 'أوغندا', '乌干达', 'UG', 'UGA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('United Arab Emirates', 'Émirats arabes unis', 'Emiratos Árabes Unidos', 'Объединенные Арабские Эмираты', 'الإمارات العربية المتحدة', '阿拉伯联合酋长国', 'AE', 'ARE')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('United Republic of Tanzania', 'République-Unie de Tanzanie', 'República Unida de Tanzanía', 'Объединенная Республика Танзания', 'جمهورية تنزانيا المتحدة', '坦桑尼亚联合共和国', 'TZ', 'TZA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('United States of America', U&'États-Unis d\0027Amérique', 'Estados Unidos de América', 'Соединенные Штаты Америки', 'الولايات المتحدة الأمريكية', '美 国', 'US', 'USA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Venezuela (Bolivarian Republic of)', 'Venezuela (République bolivarienne du)', 'Venezuela (República Bolivariana de)', 'Венесуэла (Боливарианская Республика)', 'فنزويلا - جمهورية .. البوليفارية', '委内瑞拉 (玻利瓦尔共和国)', 'VE', 'VEN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Democratic Republic of the Congo', 'République démocratique du Congo', 'República Democrática del Congo', 'Демократическая Республика Конго', 'جمهورية الكونغو الديمقراطية', '刚果民主共和国', 'CD', 'COD')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Zimbabwe', 'Zimbabwe', 'Zimbabwe', 'Зимбабве', 'زمبابوي', '津巴布韦', 'ZW', 'ZWE')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Republic of Korea', 'République de Corée', 'República de Corea', 'Республика Корея', 'جمهورية كوريا', '大韩民国', 'KR', 'KOR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Micronesia (Federated States of)', 'Micronésie (États fédérés de)', 'Micronesia (Estados Federados de)', 'Микронезия (Федеративные Штаты)', 'ميكرونيزيا', '密克罗尼西亚(联邦)', 'FM', 'FSM')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Lithuania', 'Lituanie', 'Lituania', 'Литва', 'ليتوانيا', '立陶宛', 'LT', 'LTU')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Belarus', 'Bélarus', 'Belarús', 'Беларусь', 'بيلاروس', '白俄罗斯', 'BY', 'BLR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Brunei Darussalam', 'Brunéi Darussalam', 'Brunei Darussalam', 'Бруней-Даруссалам', 'برونى دار السلام', '文莱达鲁萨兰国', 'BN', 'BRN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Nauru', 'Nauru', 'Nauru', 'Науру', 'ناورو', '瑙 鲁', 'NR', 'NRU')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('San Marino', 'Saint-Marin', 'San Marino', 'Сан-Марино', 'سان مارينو', '圣马力诺', 'SM', 'SMR')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Tokelau (Associate Member)', 'Tokélaou (Membre associé)', 'Tokelau (Miembro Asociado)', 'Токелау (ассоциированный член)', 'توكيلاو - عضو منتسب', '托克劳', 'TK', 'TKL')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Russian Federation', 'Fédération de Russie', 'Federación de Rusia', 'Российская Федерация', 'الاتحاد الروسي', '俄罗斯联邦', 'RU', 'RUS')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Armenia', 'Arménie', 'Armenia', 'Армения', 'أرمينيا', '亚美尼亚', 'AM', 'ARM')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Kyrgyzstan', 'Kirghizistan', 'Kirguistán', 'Кыргызстан', 'قيرغيزستان', '吉尔吉斯斯坦', 'KG', 'KGZ')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Turkmenistan', 'Turkménistan', 'Turkmenistán', 'Туркменистан', 'تركمانستان', '土库曼斯坦', 'TM', 'TKM')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Kazakhstan', 'Kazakhstan', 'Kazajstán', 'Казахстан', 'كازاخستان', '哈萨克斯坦', 'KZ', 'KAZ')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Slovenia', 'Slovénie', 'Eslovenia', 'Словения', 'سلوفينيا', '斯洛文尼亚', 'SI', 'SVN')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Bosnia and Herzegovina', 'Bosnie-Herzégovine', 'Bosnia y Herzegovina', 'Босния и Герцеговина', 'البوسنة والهرسك', '波斯尼亚和黑塞哥维那', 'BA', 'BIH')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Timor-Leste', 'Timor-Leste', 'Timor-Leste', 'Тимор-Лешти', 'تيمور- ليشتى', '东帝汶', 'TL', 'TLS')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('Republic of Moldova', 'République de Moldova', 'República de Moldova', 'Республика Молдова', 'جمهورية مولدوفا', '摩尔多瓦共和国', 'MD', 'MDA')
INSERT INTO COUNTRIES (NAME_EN, NAME_FR, NAME_ES, NAME_RU, NAME_AR, NAME_ZH, ISO2, ISO3) VALUES ('The former Yugoslav Republic of Macedonia', U&'l\0027ex-République yougoslave de Macédoine', 'la ex República Yugoslava de Macedonia', 'бывшая югославская Республика Македония', 'السابقة اليوغوسلافية مقدونيا جمهورية', '前南斯拉夫的马其顿共和国', 'MK', 'MKD')


INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('FCP', 'Cover pots', 'Paniers coiffants filets lanternes', 'Cabreros')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('DR', 'Dredges', 'Dragues', 'Rastras')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('DIN', 'Drive in nets', 'Filets de rabattage', 'Redes de batir')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('EF', 'Electrical fishing', 'Pêche électrique', 'Pesca eléctrica')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('GNC', 'Encircling gillnets', 'Filets maillants encerclants', 'Redes de batir de cerco')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('PL', 'Pole and lines', 'Lignes à main et lignes à cannes', 'Líneas de mano y caña')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('PS', 'Purse seines', 'Filet tournants avec coulisse', 'Redes de cerco con jareta')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('GNS', 'Set gillnets', 'Filets maillants calés (ancrés)', 'Redes calada')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('LLS', 'Set longlines', 'Palangres calées', 'Palangres calados')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('FPN', 'Stationary uncovered pound nets', 'Filets-pièges fixes non couverts', 'Almadrabas fijas descubiertas')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('GTR', 'Trammel nets', 'Trémails', 'Redes de trasmallo')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('EXP', 'Explosives', 'Explosifs', 'Explosivos')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('CHE', 'Chemicals', 'Poisons', 'Productos químicos')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('FWR', 'Barriers, fences, weirs, corrals, etc.', 'Barrages, parcs, bordigues, etc.', 'Barretas, cercotes, corrales, etc.')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('SB', 'Beach seines', 'Sennes de plage', 'Chinchorros de playa')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('SV', 'Boat seines', 'Sennes halées à bord', 'Redes de tiro desde embaraciones')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('LTL', 'Trolling lines', 'Lignes de traîne', 'Curricanes')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('FAR', 'Aerial traps', 'Pièges aériens', 'Trampas aéreas')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('LLD', 'Drifting longlines', 'Palangres dérivantes', 'Palangres de deriva')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('GND', 'Driftnets', 'Filets maillants dérivants (filets dérivants)', 'Redes de deriva')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('GNF', 'Fixed gillnets (on stakes)', 'Filets maillants fixes (sur perches)', 'Redes de enmalle fijas (en estacas)')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('LA', 'Lampara nets', 'Filet tournants sans coulisse (filet lamparas)', 'Redes de cerco sin jareta (lámparos, etc.)')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('TM', 'Midwater trawls', 'Chaluts pélagiques', 'Redes de arrastre pelágico')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('SE', 'Seine nets', 'Sennes', 'Redes de tiro')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('LNS', 'Shore operated stationary lift nets', 'Filets soulevés fixes manoeuvrés du rivage', 'Estacionarias de playa')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('SPE', 'Spears', 'Harpons; Tridents', 'Fisgas, tridentes')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('FSN', 'Stow nets', U&'Filets à l\0027étalage (diables)', 'Butirones')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('SN', 'Surrounding nets', 'Filet tournants', 'Redes de cerco')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('TON', 'Tongs', 'Pinces', 'Tenazas')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('FN', 'Traps', 'Pieges', 'Trampas')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('TN', 'Trawl nets', 'Chaluts', 'Redes de arrastre')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('VL', 'Vertical lines', 'Lignes verticales', 'Líneas verticales')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('WRG', 'Wrenching gears', 'Wrenching gears', 'Wrenching gears')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('FG', 'Falling gears (not specified)', 'Autres engins retombants (non spécifiés)', 'Redes de caída (sin especificar)')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('SD', 'Destructive gears', '', '')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('HMX', 'Harvesting machines (not specified)', 'Engins de récolte (non spécifiés)', 'Maquinas de recolectar (sin especificar)')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('LL', 'Hooks and lines', 'Lignes et hamecons', 'Sedal y anzuelo')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('LN', 'Lift nets', 'Filets souleves', 'Redes izadas')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('LF', 'Lift nets (not specified)', 'Filets soulevés (non spécifiés)', 'Redes izadas (sin especificar)')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('HMD', 'Mechanized dredges', 'Dragues mécanisées', 'Dragas mecanizadas')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('MIS', 'Miscellaneous gears', 'Divers', 'Artes diversas')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('OTT', 'Otter twin trawls', 'Chaluts jumeaux à panneaux', 'Redes de arrastre gemelas con puertas')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('HM', 'Harvesting machines', 'Engins de récolte', 'Maquinas de recolectar')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('SX', 'Seine nets (not specified)', 'Sennes (non spécifiées)', 'Redes de tiro (sin especificar)')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('TB', 'Bottom trawls (not specified)', 'Chaluts de fond (non spécifiés)', 'Redes de arrastre de fondo - redes de arrastre de fondo (sin especificar)')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('PT', 'Pair trawls (not specified)', 'Chaluts-boeufs (non spécifiés)', 'Redes de arrastre a la pareja (sin especificar)')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('LNP', 'Portable hand lift nets', 'Filets soulevés portatif', 'Portátiles')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('OT', 'Otter trawls (not specified)', 'Chaluts à panneaux (non spécifiés)', 'Redes de arrastre de puertas (sin especificar)')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('HMP', 'Pumps', 'Pompes', 'Bombas')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('TX', 'Other trawls (not specified)', 'Autres chaluts (non spécifiés)', 'Otras redes de arrastre (sin especificar)')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('PUN', 'Push nets', 'Pusseux; Troubles', 'Rastrillos; Angazas')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('RAK', 'Rakes', 'Râteaux', 'Rastros')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('RG', 'Recreational fishing gears', 'Engins de pêche recreative', 'Artes par la pesca recreativa')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('RN', 'Ring nets', 'Filet tournants sans coulisse ("ring net")', 'Redes de cerco sin jareta ("ring net")')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('SCN', 'Scoop nets', 'Epuissettes; Salabardes', 'Salabardos')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('FIX', 'Traps (not specified)', 'Pièges (non spécifiés)', 'Trampas (sin especificar)')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('LL', 'Longlines (not specified)', 'Palangres (non spécifiées)', 'Palangres (sin especificar)')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('LX', 'Hooks and lines (not specified)', 'Hameçons et lignes (non spécifiés)', 'Sedal y anzuelo (sin especificar)')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('HAR', 'Harpoons', 'Harpons', 'Arpones')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('NK', 'Gear not known or not specified', 'Engins inconnus ou non specifiés', 'Artes desconocidos o no especificados')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('GN', 'Gillnets (not specified)', 'Filets maillants (non spécifiés)', 'Redes de enmalle (sin especificar)')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('DRB', 'Boat dredges', 'Dragues remorquées par bateau', 'Rastras para embarcación')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('LNB', 'Boat-operated lift nets', 'Filets soulevés manoeuvrés du bateau', 'Para embarcación')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('TB', 'Bottom trawls', 'Chaluts de fond', 'Redes de arrastre de fondo')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('FCN', 'Cast nets', 'Eperviers', 'Esparaveles')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('CLA', 'Clamps', 'Foënes', 'Fítora')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('FS', 'Falling gears', 'Engins retombants', 'Redes de caida')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('FYK', 'Fyke nets', 'Verveux', 'Garlitos')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('GE', 'Gillnets and entangling nets', 'Filet maillant et filet emmelants', 'Redes de enmalle y de enredo')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('GEN', 'Gillnets and entangling nets (not specified)', 'Filets maillants et filets emmélants (non spécifiés)', 'Redes de enmalle y de enredo')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('GAW', 'Grappling and wounding gears', 'Engins de pêche par accrochage ou pour blessure', 'Artefactos de herir y aferrar')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('DIV', 'Diving', 'Plonger', 'Buceo')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('DRH', 'Hand dredges', 'Dragues à main', 'Rastras de mano')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('LHP', 'Handline and pole-lines (hand operated)', 'Lignes à main et lignes à cannes (manoeuvrées à la main)', 'Líneas de mano y caña (manuales)')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('LHM', 'Handline and pole-lines (mechanized)', 'Lignes à main et lignes à cannes (mécanisées)', 'Líneas de mano y caña (mecanizadas)')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('FPO', 'Pots', 'Nasses (casiers)', 'Nasas')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('GTN', 'Combined gillnets-trammel nets', 'Trémails et filets maillants combinés', 'Redes de enmalle-trasmallo')
INSERT INTO GEARTYPES (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('TMX', 'Midwater trawls (not specified)', 'Chaluts pélagiques (non spécifiés)', 'Redes de arrastre pelágico - redes de arrastre pelágico (sin especificar)')

INSERT INTO YESNO (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('Y', 'Yes', 'Oui', 'Si');
INSERT INTO YESNO (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('N', 'No', 'No', 'No');

INSERT INTO CHECKBOXTEST (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('1', 'Option 1', 'Option 1', 'Opción 1');
INSERT INTO CHECKBOXTEST (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('2', 'Option 2', 'Option 2', 'Opción 2');
INSERT INTO CHECKBOXTEST (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('3', 'Option 3', 'Option 3', 'Opción 3');
INSERT INTO CHECKBOXTEST (CODE, NAME_EN, NAME_FR, NAME_ES) VALUES ('4', 'Option 4', 'Option 4', 'Opción 4');
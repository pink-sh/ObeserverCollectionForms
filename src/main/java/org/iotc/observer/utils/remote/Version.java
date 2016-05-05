package org.iotc.observer.utils.remote;

import java.util.List;

public class Version {
	private String version;
	private List<File> files;
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public List<File> getFiles() {
		return files;
	}
	public void setFiles(List<File> files) {
		this.files = files;
	}
}

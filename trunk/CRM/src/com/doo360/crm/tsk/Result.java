package com.doo360.crm.tsk;

public class Result {
	/* the download url,return back to service to remove it from the arraylist */
	private String url;
	/* the download result */
	private boolean success;
	/* the destination for the apk downloaded */
	private String dest;

	public Result(String url, boolean success, String dest) {
		this.url = url;
		this.success = success;
		this.dest = dest;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getDest() {
		return dest;
	}

	public void setDest(String dest) {
		this.dest = dest;
	}

	@Override
	public String toString() {
		return "Result [url=" + url + ", success=" + success + ", dest=" + dest
				+ "]";
	}

}

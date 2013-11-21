package com.db;

import java.io.Serializable;

/**
 * Created by kai.wang on 11/20/13.
 */
public class DBException extends Exception {

	static final long serialVersionUID = -7034897190745766934L;

	public DBException() {
		super();
	}

	public DBException(String message) {
		super(message);
	}

	public DBException(String message, Throwable cause) {
		super(message, cause);
	}

	public DBException(Throwable cause) {
		super(cause);
	}

	protected DBException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}
}

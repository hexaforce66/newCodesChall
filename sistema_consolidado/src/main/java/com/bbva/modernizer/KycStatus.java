package com.bbva.modernizer;

public enum KycStatus {
    VALID("Y"),
    MISSING("N");

    private final String code;

    KycStatus(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }
}
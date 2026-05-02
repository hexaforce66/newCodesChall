package com.bbva.modernizer;

public enum KycFlag {
    KYC_VALID("Y"),
    KYC_MISSING("N");

    private final String value;

    KycFlag(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
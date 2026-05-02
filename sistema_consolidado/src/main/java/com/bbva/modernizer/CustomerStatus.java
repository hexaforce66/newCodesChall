package com.bbva.modernizer;

public enum CustomerStatus {
    ACTIVE("A"),
    BLOCKED("B"),
    CLOSED("C");

    private final String code;

    CustomerStatus(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }
}
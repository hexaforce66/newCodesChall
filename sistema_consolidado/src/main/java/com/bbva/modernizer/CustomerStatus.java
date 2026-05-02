package com.bbva.modernizer;

public enum CustomerStatus {
    CUST_ACTIVE("A"),
    CUST_BLOCKED("B"),
    CUST_CLOSED("C");

    private final String value;

    CustomerStatus(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
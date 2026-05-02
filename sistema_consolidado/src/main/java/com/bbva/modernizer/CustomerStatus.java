package com.bbva.modernizer;

import java.math.BigDecimal;

public enum CustomerStatus {
    ACTIVE('A'),
    BLOCKED('B'),
    CLOSED('C');

    private final char value;

    CustomerStatus(char value) {
        this.value = value;
    }

    public char getValue() {
        return value;
    }
}
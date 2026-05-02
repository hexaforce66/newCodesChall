package com.bbva.modernizer;

import java.math.BigDecimal;

public enum AccountStatus {
    OPEN('O'),
    BLOCKED('B'),
    CLOSED('C');

    private final char value;

    AccountStatus(char value) {
        this.value = value;
    }

    public char getValue() {
        return value;
    }
}
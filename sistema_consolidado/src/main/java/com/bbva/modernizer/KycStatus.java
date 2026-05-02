package com.bbva.modernizer;

import java.math.BigDecimal;

public enum KycStatus {
    VALID('Y'),
    MISSING('N');

    private final char value;

    KycStatus(char value) {
        this.value = value;
    }

    public char getValue() {
        return value;
    }
}
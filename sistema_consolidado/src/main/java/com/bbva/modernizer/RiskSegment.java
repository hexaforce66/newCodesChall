package com.bbva.modernizer;

import java.math.BigDecimal;

public enum RiskSegment {
    LOW('L'),
    MEDIUM('M'),
    HIGH('H');

    private final char value;

    RiskSegment(char value) {
        this.value = value;
    }

    public char getValue() {
        return value;
    }
}
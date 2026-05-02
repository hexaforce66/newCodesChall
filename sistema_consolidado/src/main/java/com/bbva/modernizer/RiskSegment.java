package com.bbva.modernizer;

public enum RiskSegment {
    RISK_LOW("L"),
    RISK_MEDIUM("M"),
    RISK_HIGH("H");

    private final String value;

    RiskSegment(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
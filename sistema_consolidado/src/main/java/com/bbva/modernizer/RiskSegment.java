package com.bbva.modernizer;

public enum RiskSegment {
    LOW("L"),
    MEDIUM("M"),
    HIGH("H");

    private final String code;

    RiskSegment(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }
}
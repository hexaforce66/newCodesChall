package com.bbva.modernizer;

public enum ReturnCode {
    APPROVED("0000"),
    CUSTOMER_ERROR("1001"),
    ACCOUNT_ERROR("2001"),
    BALANCE_ERROR("3001"),
    RISK_ERROR("4001"),
    REVIEW_REQUIRED("9001");

    private final String code;

    ReturnCode(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }
}
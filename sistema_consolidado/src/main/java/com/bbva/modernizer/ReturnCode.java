package com.bbva.modernizer;

public enum ReturnCode {
    RET_APPROVED("0000"),
    RET_CUST_ERR("1001"),
    RET_ACCT_ERR("2001"),
    RET_BAL_ERR("3001"),
    RET_RISK_ERR("4001"),
    RET_REVIEW("9001");

    private final String value;

    ReturnCode(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
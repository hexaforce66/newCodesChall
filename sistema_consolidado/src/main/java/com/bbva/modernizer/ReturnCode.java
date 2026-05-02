package com.bbva.modernizer;

import java.math.BigDecimal;

public class ReturnCode {
    private String returnCode;
    private String returnMessage;
    private BigDecimal returnRiskScore;

    public ReturnCode(String returnCode, String returnMessage, BigDecimal returnRiskScore) {
        this.returnCode = returnCode;
        this.returnMessage = returnMessage;
        this.returnRiskScore = returnRiskScore;
    }

    public String getReturnCode() {
        return returnCode;
    }

    public String getReturnMessage() {
        return returnMessage;
    }

    public BigDecimal getReturnRiskScore() {
        return returnRiskScore;
    }
}
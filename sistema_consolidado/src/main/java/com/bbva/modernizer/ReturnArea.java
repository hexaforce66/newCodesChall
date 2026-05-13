package com.bbva.modernizer;

public class ReturnArea {
    private ReturnCode returnCode;
    private String returnMessage;
    private int returnRiskScore;

    public ReturnArea(ReturnCode returnCode, String returnMessage, int returnRiskScore) {
        this.returnCode = returnCode;
        this.returnMessage = returnMessage;
        this.returnRiskScore = returnRiskScore;
    }

    public ReturnCode getReturnCode() {
        return returnCode;
    }

    public String getReturnMessage() {
        return returnMessage;
    }

    public int getReturnRiskScore() {
        return returnRiskScore;
    }
}
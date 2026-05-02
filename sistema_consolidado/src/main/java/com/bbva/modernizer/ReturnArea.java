package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

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
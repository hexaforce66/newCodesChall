package com.bbva.modernizer;

import java.math.BigDecimal;

public class Riskscor {
    public ReturnArea calculateRisk(Payment payment, Customer customer, Account account) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED.getValue(), "Risk validation approved", 0);
        int baseScore = 10;

        if (customer.riskSegment() == RiskSegment.MEDIUM) {
            baseScore += 30;
        } else if (customer.riskSegment() == RiskSegment.HIGH) {
            baseScore += 60;
        }

        int amountScore;
        if (payment.amount().compareTo(BigDecimal.valueOf(10000)) > 0) {
            amountScore = 30;
        } else if (payment.amount().compareTo(BigDecimal.valueOf(5000)) > 0) {
            amountScore = 15;
        } else {
            amountScore = 5;
        }

        int riskScore = baseScore + amountScore;

        if (riskScore > 80) {
            returnArea = new ReturnArea(ReturnCode.RISK_ERROR.getValue(), "Payment rejected by risk score", riskScore);
        } else if (riskScore > 60) {
            returnArea = new ReturnArea(ReturnCode.REVIEW_REQUIRED.getValue(), "Payment requires manual risk review", riskScore);
        }

        return returnArea;
    }
}
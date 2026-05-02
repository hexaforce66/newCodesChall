package com.bbva.modernizer;

import java.math.BigDecimal;

public class Riskscor {
    public ReturnCode calculateRisk(Payment payment, Customer customer, Account account) {
        ReturnCode returnCode = new ReturnCode("0000", "Risk validation approved", BigDecimal.ZERO);
        BigDecimal baseScore = BigDecimal.valueOf(10);
        BigDecimal amountScore = BigDecimal.ZERO;

        if (customer.getRiskSegment() == RiskSegment.RISK_MEDIUM) {
            baseScore = baseScore.add(BigDecimal.valueOf(30));
        } else if (customer.getRiskSegment() == RiskSegment.RISK_HIGH) {
            baseScore = baseScore.add(BigDecimal.valueOf(60));
        }

        if (payment.getPayAmount().compareTo(BigDecimal.valueOf(10000)) > 0) {
            amountScore = BigDecimal.valueOf(30);
        } else if (payment.getPayAmount().compareTo(BigDecimal.valueOf(5000)) > 0) {
            amountScore = BigDecimal.valueOf(15);
        } else {
            amountScore = BigDecimal.valueOf(5);
        }

        BigDecimal riskScore = baseScore.add(amountScore);

        if (riskScore.compareTo(BigDecimal.valueOf(80)) > 0) {
            returnCode = new ReturnCode("4001", "Payment rejected by risk score", riskScore);
        } else if (riskScore.compareTo(BigDecimal.valueOf(60)) > 0) {
            returnCode = new ReturnCode("9001", "Payment requires manual risk review", riskScore);
        }

        return returnCode;
    }
}
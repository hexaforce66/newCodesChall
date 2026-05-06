package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Riskscor {
    public ReturnArea calculateRisk(Payment payment, Customer customer, Account account) {
        int baseScore = 10;

        if (customer.getRiskSegment() == RiskSegment.MEDIUM) {
            baseScore += 30;
        } else if (customer.getRiskSegment() == RiskSegment.HIGH) {
            baseScore += 60;
        }

        int amountScore;
        if (payment.getAmount().compareTo(BigDecimal.valueOf(10000)) > 0) {
            amountScore = 30;
        } else if (payment.getAmount().compareTo(BigDecimal.valueOf(5000)) > 0) {
            amountScore = 15;
        } else {
            amountScore = 5;
        }

        int riskScore = baseScore + amountScore;

        if (riskScore > 80) {
            return new ReturnArea(ReturnCode.RISK_ERROR, "Payment rejected by risk score", riskScore);
        }

        if (riskScore > 60) {
            return new ReturnArea(ReturnCode.REVIEW_REQUIRED, "Payment requires manual risk review", riskScore);
        }

        return new ReturnArea(ReturnCode.APPROVED, "Risk validation approved", riskScore);
    }
}
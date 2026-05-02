package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Riskscor {
    public ReturnArea calculateRisk(Payment payment, Customer customer, Account account) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Risk validation approved", 0);

        int baseScore = 10;

        if (customer.getRiskSegment() == RiskSegment.RISK_MEDIUM) {
            baseScore += 30;
        } else if (customer.getRiskSegment() == RiskSegment.RISK_HIGH) {
            baseScore += 60;
        }

        int amountScore = 0;

        if (payment.getPayAmount().compareTo(BigDecimal.valueOf(10000)) > 0) {
            amountScore = 30;
        } else if (payment.getPayAmount().compareTo(BigDecimal.valueOf(5000)) > 0) {
            amountScore = 15;
        } else {
            amountScore = 5;
        }

        returnArea.setReturnRiskScore(baseScore + amountScore);

        if (returnArea.getReturnRiskScore() > 80) {
            returnArea.setReturnCode(ReturnCode.RET_RISK_ERR);
            returnArea.setReturnMessage("Payment rejected by risk score");
            return returnArea;
        }

        if (returnArea.getReturnRiskScore() > 60) {
            returnArea.setReturnCode(ReturnCode.RET_REVIEW);
            returnArea.setReturnMessage("Payment requires manual risk review");
            return returnArea;
        }

        return returnArea;
    }

    private RiskSegment RiskSegment() {
        // Implementación de RiskSegment
        return null;
    }
}
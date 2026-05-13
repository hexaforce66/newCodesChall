package com.bbva.modernizer;

import java.math.BigDecimal;

public class Paymain {
    public void processPayment(Payment payment) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Payment approved", 0);

        // Call CUSTVAL
        Custval custval = new Custval();
        returnArea = custval.validateCustomer(payment, new Customer(payment.getCustomerId(), CustomerStatus.ACTIVE, KycStatus.VALID, RiskSegment.LOW));

        if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
            // Call BALCHK
            Balchk balchk = new Balchk();
            returnArea = balchk.validateBalance(payment, new Account(payment.getAccountId(), payment.getCustomerId(), AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR"));
        }

        if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
            // Call RISKSCOR
            Riskscor riskscor = new Riskscor();
            returnArea = riskscor.calculateRisk(payment, new Customer(payment.getCustomerId(), CustomerStatus.ACTIVE, KycStatus.VALID, RiskSegment.LOW), new Account(payment.getAccountId(), payment.getCustomerId(), AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR"));
        }

        // Write result
        System.out.println("Return Code: " + returnArea.getReturnCode().getCode());
        System.out.println("Return Message: " + returnArea.getReturnMessage());
        System.out.println("Return Risk Score: " + returnArea.getReturnRiskScore());
    }
}
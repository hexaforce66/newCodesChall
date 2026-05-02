package com.bbva.modernizer;

import java.math.BigDecimal;

public class Paymain {
    public void processPayment(Payment payment) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Payment approved", 0);

        // Call CUSTVAL
        Custval custval = new Custval();
        returnArea = custval.validateCustomer(payment, new Customer(payment.getPayCustomerId(), CustomerStatus.CUST_ACTIVE, KycFlag.KYC_VALID, RiskSegment.RISK_LOW));

        if (returnArea.getReturnCode() == ReturnCode.RET_APPROVED) {
            // Call BALCHK
            Balchk balchk = new Balchk();
            returnArea = balchk.validateBalance(payment, new Account(payment.getPayAccountId(), payment.getPayCustomerId(), AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR"));

            if (returnArea.getReturnCode() == ReturnCode.RET_APPROVED) {
                // Call RISKSCOR
                Riskscor riskscor = new Riskscor();
                returnArea = riskscor.calculateRisk(payment, new Customer(payment.getPayCustomerId(), CustomerStatus.CUST_ACTIVE, KycFlag.KYC_VALID, RiskSegment.RISK_LOW), new Account(payment.getPayAccountId(), payment.getPayCustomerId(), AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR"));
            }
        }

        // Write result
        if (returnArea.getReturnCode() == ReturnCode.RET_APPROVED) {
            System.out.println("Payment approved");
        } else {
            System.out.println("Payment rejected: " + returnArea.getReturnMessage());
        }
    }
}
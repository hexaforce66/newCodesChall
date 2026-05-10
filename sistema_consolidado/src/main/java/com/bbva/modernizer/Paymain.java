package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Paymain {
    public void processPayment(Payment payment) {
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Payment approved", 0);

        Customer customer = new Customer(payment.getPayCustomerId(), CustomerStatus.CUST_ACTIVE, KycFlag.KYC_VALID, RiskSegment.RISK_LOW);
        Account account = new Account(payment.getPayAccountId(), payment.getPayCustomerId(), AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");

        Balchk balchk = new Balchk();
        returnArea = balchk.validateBalance(payment, account);

        if (returnArea.getReturnCode() == ReturnCode.RET_APPROVED) {
            Custval custval = new Custval();
            returnArea = custval.validateCustomer(payment, customer);
        }

        if (returnArea.getReturnCode() == ReturnCode.RET_APPROVED) {
            Custval custval = new Custval();
            returnArea = custval.validateCustomer(payment, customer);
        }

        if (returnArea.getReturnCode() == ReturnCode.RET_APPROVED) {
            Custval custval = new Custval();
            returnArea = custval.validateCustomer(payment, customer);
        }

        Txnlog txnlog = new Txnlog();
        String auditLine = txnlog.buildAuditLine(payment, returnArea);

        System.out.println(auditLine);
    }
}
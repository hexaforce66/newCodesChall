package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Paymain {
    public void processPayments(List<Payment> payments, List<Customer> customers, List<Account> accounts) {
        int approvedCount = 0;
        int rejectedCount = 0;
        int reviewCount = 0;
        BigDecimal totalAmount = BigDecimal.ZERO;

        for (Payment payment : payments) {
            ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Payment approved", 0);

            Optional<Customer> customer = customers.stream()
                    .filter(c -> c.getId().equals(payment.getCustomerId()))
                    .findFirst();

            if (customer.isPresent()) {
                returnArea = new Custval().validateCustomer(payment, customer.get());
            }

            if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
                Optional<Account> account = accounts.stream()
                        .filter(a -> a.getId().equals(payment.getAccountId()))
                        .findFirst();

                if (account.isPresent()) {
                    returnArea = new Balchk().validateBalance(payment, account.get());
                }
            }

            if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
                returnArea = new Riskscor().calculateRisk(payment, customer.get(), account.get());
            }

            if (returnArea.getReturnCode() == ReturnCode.APPROVED || returnArea.getReturnCode() == ReturnCode.REVIEW_REQUIRED) {
                totalAmount = totalAmount.add(payment.getAmount());
            }

            if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
                approvedCount++;
            } else if (returnArea.getReturnCode() == ReturnCode.REVIEW_REQUIRED) {
                reviewCount++;
            } else {
                rejectedCount++;
            }

            System.out.println(new Txnlog().buildAuditLine(payment, returnArea));
        }

        System.out.println("SUMMARY;APPROVED=" + approvedCount +
                ";REJECTED=" + rejectedCount +
                ";REVIEW=" + reviewCount +
                ";TOTAL=" + totalAmount);
    }
}
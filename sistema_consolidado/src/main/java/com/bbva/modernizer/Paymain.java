package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Paymain {
    public void processPayments(List<Payment> payments, List<Customer> customers, List<Account> accounts) {
        List<Payment> approvedPayments = new ArrayList<>();
        List<Payment> rejectedPayments = new ArrayList<>();
        List<Payment> reviewPayments = new ArrayList<>();
        BigDecimal totalAmount = BigDecimal.ZERO;

        for (Payment payment : payments) {
            Customer customer = findCustomer(customers, payment.customerId());
            Account account = findAccount(accounts, payment.accountId());

            if (customer != null && account != null) {
                ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED.getValue(), "Payment approved", 0);

                Custval custval = new Custval();
                returnArea = custval.validateCustomer(payment, customer);

                if (returnArea.code().equals(ReturnCode.APPROVED.getValue())) {
                    Balchk balchk = new Balchk();
                    returnArea = balchk.validateBalance(payment, account);
                }

                if (returnArea.code().equals(ReturnCode.APPROVED.getValue())) {
                    Riskscor riskscor = new Riskscor();
                    returnArea = riskscor.calculateRisk(payment, customer, account);
                }

                if (returnArea.code().equals(ReturnCode.APPROVED.getValue())) {
                    approvedPayments.add(payment);
                    totalAmount = totalAmount.add(payment.amount());
                } else if (returnArea.code().equals(ReturnCode.REVIEW_REQUIRED.getValue())) {
                    reviewPayments.add(payment);
                } else {
                    rejectedPayments.add(payment);
                }
            }
        }

        // Write approved, rejected and review payments to files
        // Write audit log
        // Write summary
    }

    private Customer findCustomer(List<Customer> customers, String customerId) {
        for (Customer customer : customers) {
            if (customer.id().equals(customerId)) {
                return customer;
            }
        }
        return null;
    }

    private Account findAccount(List<Account> accounts, String accountId) {
        for (Account account : accounts) {
            if (account.id().equals(accountId)) {
                return account;
            }
        }
        return null;
    }
}
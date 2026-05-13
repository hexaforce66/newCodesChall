package com.bbva.modernizer;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
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
            Customer customer = getCustomer(customers, payment.getCustomerId());
            Account account = getAccount(accounts, payment.getAccountId());

            if (customer != null && account != null) {
                ReturnArea returnArea = validatePayment(payment, customer, account);

                if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
                    approvedPayments.add(payment);
                    totalAmount = totalAmount.add(payment.getAmount());
                } else if (returnArea.getReturnCode() == ReturnCode.REVIEW_REQUIRED) {
                    reviewPayments.add(payment);
                } else {
                    rejectedPayments.add(payment);
                }
            }
        }

        writeAuditLog(approvedPayments, rejectedPayments, reviewPayments, totalAmount);
    }

    private Customer getCustomer(List<Customer> customers, String customerId) {
        for (Customer customer : customers) {
            if (customer.getId().equals(customerId)) {
                return customer;
            }
        }
        return null;
    }

    private Account getAccount(List<Account> accounts, String accountId) {
        for (Account account : accounts) {
            if (account.getId().equals(accountId)) {
                return account;
            }
        }
        return null;
    }

    private ReturnArea validatePayment(Payment payment, Customer customer, Account account) {
        ReturnArea returnArea = new Custval().validateCustomer(payment, customer);

        if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
            returnArea = new Balchk().validateBalance(payment, account);
        }

        if (returnArea.getReturnCode() == ReturnCode.APPROVED) {
            returnArea = new Riskscor().calculateRisk(payment, customer, account);
        }

        return returnArea;
    }

    private void writeAuditLog(List<Payment> approvedPayments, List<Payment> rejectedPayments, List<Payment> reviewPayments, BigDecimal totalAmount) {
        try (PrintWriter writer = new PrintWriter(new FileWriter("audit.log"))) {
            for (Payment payment : approvedPayments) {
                writer.println(new Txnlog().buildAuditLine(payment, new ReturnArea(ReturnCode.APPROVED, "Payment approved", 0)));
            }

            for (Payment payment : rejectedPayments) {
                writer.println(new Txnlog().buildAuditLine(payment, new ReturnArea(ReturnCode.REJECTED, "Payment rejected", 0)));
            }

            for (Payment payment : reviewPayments) {
                writer.println(new Txnlog().buildAuditLine(payment, new ReturnArea(ReturnCode.REVIEW_REQUIRED, "Payment requires review", 0)));
            }

            writer.println("SUMMARY;APPROVED=" + approvedPayments.size() +
                    ";REJECTED=" + rejectedPayments.size() +
                    ";REVIEW=" + reviewPayments.size() +
                    ";TOTAL=" + totalAmount);
        } catch (IOException e) {
            System.err.println("Error writing audit log: " + e.getMessage());
        }
    }
}
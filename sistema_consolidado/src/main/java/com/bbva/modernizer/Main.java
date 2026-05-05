package com.bbva.modernizer;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<Payment> payments = readPayments("payments.log");
        List<Customer> customers = readCustomers("customers.log");
        List<Account> accounts = readAccounts("accounts.log");

        Paymain paymain = new Paymain();
        paymain.processPayments(payments, customers, accounts);
    }

    private static List<Payment> readPayments(String filename) {
        List<Payment> payments = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(filename))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(";");
                Payment payment = new Payment(parts[0], parts[1], parts[2], new BigDecimal(parts[3]), parts[4], parts[5], parts[6], parts[7]);
                payments.add(payment);
            }
        } catch (IOException e) {
            System.err.println("Error reading payments log: " + e.getMessage());
        }

        return payments;
    }

    private static List<Customer> readCustomers(String filename) {
        List<Customer> customers = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(filename))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(";");
                Customer customer = new Customer(parts[0], CustomerStatus.valueOf(parts[1]), KycStatus.valueOf(parts[2]), RiskSegment.valueOf(parts[3]));
                customers.add(customer);
            }
        } catch (IOException e) {
            System.err.println("Error reading customers log: " + e.getMessage());
        }

        return customers;
    }

    private static List<Account> readAccounts(String filename) {
        List<Account> accounts = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(filename))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(";");
                Account account = new Account(parts[0], parts[1], AccountStatus.valueOf(parts[2]), new BigDecimal(parts[3]), new BigDecimal(parts[4]), parts[5]);
                accounts.add(account);
            }
        } catch (IOException e) {
            System.err.println("Error reading accounts log: " + e.getMessage());
        }

        return accounts;
    }
}
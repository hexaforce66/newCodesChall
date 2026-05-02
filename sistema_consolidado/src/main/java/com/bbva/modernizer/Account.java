package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Account {
    private String id;
    private String customerId;
    private AccountStatus status;
    private BigDecimal balance;
    private BigDecimal dailyLimit;
    private String currency;

    public Account(String id, String customerId, AccountStatus status, BigDecimal balance, BigDecimal dailyLimit, String currency) {
        this.id = id;
        this.customerId = customerId;
        this.status = status;
        this.balance = balance;
        this.dailyLimit = dailyLimit;
        this.currency = currency;
    }

    public String getId() {
        return id;
    }

    public String getCustomerId() {
        return customerId;
    }

    public AccountStatus getStatus() {
        return status;
    }

    public BigDecimal getBalance() {
        return balance;
    }

    public BigDecimal getDailyLimit() {
        return dailyLimit;
    }

    public String getCurrency() {
        return currency;
    }
}
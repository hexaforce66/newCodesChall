package com.bbva.modernizer;

import java.math.BigDecimal;

public class Account {
    private String accId;
    private String accCustomerId;
    private AccountStatus accStatus;
    private BigDecimal accBalance;
    private BigDecimal accDailyLimit;
    private String accCurrency;

    public Account(String accId, String accCustomerId, AccountStatus accStatus, BigDecimal accBalance, BigDecimal accDailyLimit, String accCurrency) {
        this.accId = accId;
        this.accCustomerId = accCustomerId;
        this.accStatus = accStatus;
        this.accBalance = accBalance;
        this.accDailyLimit = accDailyLimit;
        this.accCurrency = accCurrency;
    }

    public String getAccId() {
        return accId;
    }

    public String getAccCustomerId() {
        return accCustomerId;
    }

    public AccountStatus getAccStatus() {
        return accStatus;
    }

    public BigDecimal getAccBalance() {
        return accBalance;
    }

    public BigDecimal getAccDailyLimit() {
        return accDailyLimit;
    }

    public String getAccCurrency() {
        return accCurrency;
    }
}
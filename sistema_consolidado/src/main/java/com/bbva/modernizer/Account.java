package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

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

    public void setAccId(String accId) {
        this.accId = accId;
    }

    public String getAccCustomerId() {
        return accCustomerId;
    }

    public void setAccCustomerId(String accCustomerId) {
        this.accCustomerId = accCustomerId;
    }

    public AccountStatus getAccStatus() {
        return accStatus;
    }

    public void setAccStatus(AccountStatus accStatus) {
        this.accStatus = accStatus;
    }

    public BigDecimal getAccBalance() {
        return accBalance;
    }

    public void setAccBalance(BigDecimal accBalance) {
        this.accBalance = accBalance;
    }

    public BigDecimal getAccDailyLimit() {
        return accDailyLimit;
    }

    public void setAccDailyLimit(BigDecimal accDailyLimit) {
        this.accDailyLimit = accDailyLimit;
    }

    public String getAccCurrency() {
        return accCurrency;
    }

    public void setAccCurrency(String accCurrency) {
        this.accCurrency = accCurrency;
    }
}
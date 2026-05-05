package com.bbva.modernizer;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Payment {
    private String id;
    private String customerId;
    private String accountId;
    private BigDecimal amount;
    private String currency;
    private String channel;
    private String destination;
    private LocalDate requestDate;

    public Payment(String id, String customerId, String accountId, BigDecimal amount, String currency, String channel, String destination, LocalDate requestDate) {
        this.id = id;
        this.customerId = customerId;
        this.accountId = accountId;
        this.amount = amount;
        this.currency = currency;
        this.channel = channel;
        this.destination = destination;
        this.requestDate = requestDate;
    }

    public String getId() {
        return id;
    }

    public String getCustomerId() {
        return customerId;
    }

    public String getAccountId() {
        return accountId;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public String getCurrency() {
        return currency;
    }

    public String getChannel() {
        return channel;
    }

    public String getDestination() {
        return destination;
    }

    public LocalDate getRequestDate() {
        return requestDate;
    }
}
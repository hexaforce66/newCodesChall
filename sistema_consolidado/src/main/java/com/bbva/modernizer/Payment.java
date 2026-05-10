package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Payment {
    private String payId;
    private String payCustomerId;
    private String payAccountId;
    private BigDecimal payAmount;
    private String payCurrency;
    private String payChannel;
    private String payDestination;
    private String payRequestDate;

    public Payment(String payId, String payCustomerId, String payAccountId, BigDecimal payAmount, String payCurrency, String payChannel, String payDestination, String payRequestDate) {
        this.payId = payId;
        this.payCustomerId = payCustomerId;
        this.payAccountId = payAccountId;
        this.payAmount = payAmount;
        this.payCurrency = payCurrency;
        this.payChannel = payChannel;
        this.payDestination = payDestination;
        this.payRequestDate = payRequestDate;
    }

    public String getPayId() {
        return payId;
    }

    public void setPayId(String payId) {
        this.payId = payId;
    }

    public String getPayCustomerId() {
        return payCustomerId;
    }

    public void setPayCustomerId(String payCustomerId) {
        this.payCustomerId = payCustomerId;
    }

    public String getPayAccountId() {
        return payAccountId;
    }

    public void setPayAccountId(String payAccountId) {
        this.payAccountId = payAccountId;
    }

    public BigDecimal getPayAmount() {
        return payAmount;
    }

    public void setPayAmount(BigDecimal payAmount) {
        this.payAmount = payAmount;
    }

    public String getPayCurrency() {
        return payCurrency;
    }

    public void setPayCurrency(String payCurrency) {
        this.payCurrency = payCurrency;
    }

    public String getPayChannel() {
        return payChannel;
    }

    public void setPayChannel(String payChannel) {
        this.payChannel = payChannel;
    }

    public String getPayDestination() {
        return payDestination;
    }

    public void setPayDestination(String payDestination) {
        this.payDestination = payDestination;
    }

    public String getPayRequestDate() {
        return payRequestDate;
    }

    public void setPayRequestDate(String payRequestDate) {
        this.payRequestDate = payRequestDate;
    }
}
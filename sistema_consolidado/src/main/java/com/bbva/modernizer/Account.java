package com.bbva.modernizer;

import java.math.BigDecimal;

public record Account(String id, String customerId, AccountStatus status, BigDecimal balance, BigDecimal dailyLimit, String currency) {
}
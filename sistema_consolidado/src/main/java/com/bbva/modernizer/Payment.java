package com.bbva.modernizer;

import java.math.BigDecimal;

public record Payment(String id, String customerId, String accountId, BigDecimal amount, String currency, String channel, String destination, String requestDate) {
}
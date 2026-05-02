package com.bbva.modernizer;

import java.math.BigDecimal;

public record Customer(String id, CustomerStatus status, KycStatus kycStatus, RiskSegment riskSegment) {
}
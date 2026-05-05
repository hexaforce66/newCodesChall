package com.bbva.modernizer;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

public class Customer {
    private String id;
    private CustomerStatus status;
    private KycStatus kycStatus;
    private RiskSegment riskSegment;

    public Customer(String id, CustomerStatus status, KycStatus kycStatus, RiskSegment riskSegment) {
        this.id = id;
        this.status = status;
        this.kycStatus = kycStatus;
        this.riskSegment = riskSegment;
    }

    public String getId() {
        return id;
    }

    public CustomerStatus getStatus() {
        return status;
    }

    public KycStatus getKycStatus() {
        return kycStatus;
    }

    public RiskSegment getRiskSegment() {
        return riskSegment;
    }
}
package com.bbva.modernizer;

public class Customer {
    private String id;
    private CustomerStatus status;
    private KycFlag kycFlag;
    private RiskSegment riskSegment;

    public Customer(String id, CustomerStatus status, KycFlag kycFlag, RiskSegment riskSegment) {
        this.id = id;
        this.status = status;
        this.kycFlag = kycFlag;
        this.riskSegment = riskSegment;
    }

    public String getId() {
        return id;
    }

    public CustomerStatus getStatus() {
        return status;
    }

    public KycFlag getKycFlag() {
        return kycFlag;
    }

    public RiskSegment getRiskSegment() {
        return riskSegment;
    }
}
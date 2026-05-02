package com.bbva.modernizer;

public class Customer {
    private String custId;
    private CustomerStatus custStatus;
    private KycFlag kycFlag;
    private RiskSegment riskSegment;

    public Customer(String custId, CustomerStatus custStatus, KycFlag kycFlag, RiskSegment riskSegment) {
        this.custId = custId;
        this.custStatus = custStatus;
        this.kycFlag = kycFlag;
        this.riskSegment = riskSegment;
    }

    public String getCustId() {
        return custId;
    }

    public CustomerStatus getCustStatus() {
        return custStatus;
    }

    public KycFlag getKycFlag() {
        return kycFlag;
    }

    public RiskSegment getRiskSegment() {
        return riskSegment;
    }
}
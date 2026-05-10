package com.bbva.modernizer;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

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

    public void setCustId(String custId) {
        this.custId = custId;
    }

    public CustomerStatus getCustStatus() {
        return custStatus;
    }

    public void setCustStatus(CustomerStatus custStatus) {
        this.custStatus = custStatus;
    }

    public KycFlag getKycFlag() {
        return kycFlag;
    }

    public void setKycFlag(KycFlag kycFlag) {
        this.kycFlag = kycFlag;
    }

    public RiskSegment getRiskSegment() {
        return riskSegment;
    }

    public void setRiskSegment(RiskSegment riskSegment) {
        this.riskSegment = riskSegment;
    }
}
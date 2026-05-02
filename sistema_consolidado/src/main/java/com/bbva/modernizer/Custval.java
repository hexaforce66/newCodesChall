package com.bbva.modernizer;

public class Custval {
    public ReturnCode validateCustomer(Payment payment, Customer customer) {
        ReturnCode returnCode = new ReturnCode("0000", "Customer validation approved", BigDecimal.ZERO);

        if (payment.getPayCustomerId().isEmpty()) {
            returnCode = new ReturnCode("1001", "Customer id is mandatory", BigDecimal.ZERO);
        } else if (customer.getCustStatus() == CustomerStatus.CUST_BLOCKED || customer.getCustStatus() == CustomerStatus.CUST_CLOSED) {
            returnCode = new ReturnCode("1001", "Customer is not active", BigDecimal.ZERO);
        } else if (customer.getKycFlag() == KycFlag.KYC_MISSING) {
            returnCode = new ReturnCode("1001", "Customer KYC is incomplete", BigDecimal.ZERO);
        }

        return returnCode;
    }
}
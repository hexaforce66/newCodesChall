package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class CustvalTest {

    @Test
    public void testValidateCustomer_CustomerIdIsEmpty_ReturnsError() {
        // Arrange
        Payment payment = new Payment("", "CUST-001", "ACC-001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL-001", "CHANNEL-001", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.CUST_ACTIVE, KycFlag.KYC_VALID, RiskSegment.RISK_LOW);
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Customer validation approved", 0);

        // Act
        Custval custval = new Custval();
        returnArea = custval.validateCustomer(payment, customer);

        // Assert
        assertEquals(ReturnCode.RET_CUST_ERR, returnArea.getReturnCode());
        assertEquals("Customer id is mandatory", returnArea.getReturnMessage());
    }

    @Test
    public void testValidateCustomer_CustomerBlocked_ReturnsError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL-001", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.CUST_BLOCKED, KycFlag.KYC_VALID, RiskSegment.RISK_LOW);
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Customer validation approved", 0);

        // Act
        Custval custval = new Custval();
        returnArea = custval.validateCustomer(payment, customer);

        // Assert
        assertEquals(ReturnCode.RET_CUST_ERR, returnArea.getReturnCode());
        assertEquals("Customer is not active", returnArea.getReturnMessage());
    }

    @Test
    public void testValidateCustomer_CustomerClosed_ReturnsError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL-001", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.CUST_CLOSED, KycFlag.KYC_VALID, RiskSegment.RISK_LOW);
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Customer validation approved", 0);

        // Act
        Custval custval = new Custval();
        returnArea = custval.validateCustomer(payment, customer);

        // Assert
        assertEquals(ReturnCode.RET_CUST_ERR, returnArea.getReturnCode());
        assertEquals("Customer is not active", returnArea.getReturnMessage());
    }

    @Test
    public void testValidateCustomer_KycMissing_ReturnsError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL-001", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.CUST_ACTIVE, KycFlag.KYC_MISSING, RiskSegment.RISK_LOW);
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Customer validation approved", 0);

        // Act
        Custval custval = new Custval();
        returnArea = custval.validateCustomer(payment, customer);

        // Assert
        assertEquals(ReturnCode.RET_CUST_ERR, returnArea.getReturnCode());
        assertEquals("Customer KYC is incomplete", returnArea.getReturnMessage());
    }

    @Test
    public void testValidateCustomer_ValidCustomer_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL-001", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.CUST_ACTIVE, KycFlag.KYC_VALID, RiskSegment.RISK_LOW);
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Customer validation approved", 0);

        // Act
        Custval custval = new Custval();
        returnArea = custval.validateCustomer(payment, customer);

        // Assert
        assertEquals(ReturnCode.RET_APPROVED, returnArea.getReturnCode());
        assertEquals("Customer validation approved", returnArea.getReturnMessage());
    }
}
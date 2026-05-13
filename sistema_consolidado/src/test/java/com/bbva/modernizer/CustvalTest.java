package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class CustvalTest {

    @Test
    public void testValidateCustomer_CustomerIdIsEmpty_ReturnsCustomerError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "", "ACCT-001", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.ACTIVE, KycStatus.VALID, RiskSegment.LOW);
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.CUSTOMER_ERROR, "Customer id is mandatory", 0);

        // Act
        Custval custval = new Custval();
        ReturnArea actualReturnArea = custval.validateCustomer(payment, customer);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), actualReturnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), actualReturnArea.getReturnMessage());
    }

    @Test
    public void testValidateCustomer_CustomerIsBlocked_ReturnsCustomerError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACCT-001", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.BLOCKED, KycStatus.VALID, RiskSegment.LOW);
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.CUSTOMER_ERROR, "Customer is not active", 0);

        // Act
        Custval custval = new Custval();
        ReturnArea actualReturnArea = custval.validateCustomer(payment, customer);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), actualReturnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), actualReturnArea.getReturnMessage());
    }

    @Test
    public void testValidateCustomer_CustomerIsClosed_ReturnsCustomerError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACCT-001", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.CLOSED, KycStatus.VALID, RiskSegment.LOW);
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.CUSTOMER_ERROR, "Customer is not active", 0);

        // Act
        Custval custval = new Custval();
        ReturnArea actualReturnArea = custval.validateCustomer(payment, customer);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), actualReturnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), actualReturnArea.getReturnMessage());
    }

    @Test
    public void testValidateCustomer_KycIsMissing_ReturnsCustomerError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACCT-001", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.ACTIVE, KycStatus.MISSING, RiskSegment.LOW);
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.CUSTOMER_ERROR, "Customer KYC is incomplete", 0);

        // Act
        Custval custval = new Custval();
        ReturnArea actualReturnArea = custval.validateCustomer(payment, customer);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), actualReturnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), actualReturnArea.getReturnMessage());
    }

    @Test
    public void testValidateCustomer_ValidCustomer_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACCT-001", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-001", "20220101");
        Customer customer = new Customer("CUST-001", CustomerStatus.ACTIVE, KycStatus.VALID, RiskSegment.LOW);
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.APPROVED, "Customer validation approved", 0);

        // Act
        Custval custval = new Custval();
        ReturnArea actualReturnArea = custval.validateCustomer(payment, customer);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), actualReturnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), actualReturnArea.getReturnMessage());
    }
}
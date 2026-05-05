package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class CustvalTest {

    @Test
    public void testValidateCustomer_CustomerIdIsEmpty_ReturnsCustomerError() {
        // Arrange
        Payment payment = new Payment("", "CUST-123", "ACC-123", BigDecimal.valueOf(100), "EUR", "CHANNEL", "DESTINATION", "2022-01-01");
        Customer customer = new Customer("CUST-123", CustomerStatus.ACTIVE, KycFlag.VALID, RiskSegment.LOW);
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
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(100), "EUR", "CHANNEL", "DESTINATION", "2022-01-01");
        Customer customer = new Customer("CUST-123", CustomerStatus.BLOCKED, KycFlag.VALID, RiskSegment.LOW);
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
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(100), "EUR", "CHANNEL", "DESTINATION", "2022-01-01");
        Customer customer = new Customer("CUST-123", CustomerStatus.CLOSED, KycFlag.VALID, RiskSegment.LOW);
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
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(100), "EUR", "CHANNEL", "DESTINATION", "2022-01-01");
        Customer customer = new Customer("CUST-123", CustomerStatus.ACTIVE, KycFlag.MISSING, RiskSegment.LOW);
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
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(100), "EUR", "CHANNEL", "DESTINATION", "2022-01-01");
        Customer customer = new Customer("CUST-123", CustomerStatus.ACTIVE, KycFlag.VALID, RiskSegment.LOW);
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.APPROVED, "Customer validation approved", 0);

        // Act
        Custval custval = new Custval();
        ReturnArea actualReturnArea = custval.validateCustomer(payment, customer);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), actualReturnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), actualReturnArea.getReturnMessage());
    }
}
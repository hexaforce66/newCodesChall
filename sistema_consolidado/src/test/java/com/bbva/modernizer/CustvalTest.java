package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class CustvalTest {

    @Test
    public void testValidateCustomer_CustomerIdIsEmpty_ReturnsCustomerError() {
        // Arrange
        Customer customer = new Customer("123", CustomerStatus.ACTIVE, KycStatus.VALID, RiskSegment.LOW);
        Payment payment = new Payment("789", "", "123", BigDecimal.valueOf(50), "EUR", "WEB", "IBAN123", LocalDate.now());
        Custval custval = new Custval();

        // Act
        ReturnArea returnArea = custval.validateCustomer(customer, payment);

        // Assert
        assertEquals(ReturnCode.CUSTOMER_ERROR, returnArea.getReturnCode());
    }

    @Test
    public void testValidateCustomer_CustomerIsBlocked_ReturnsCustomerError() {
        // Arrange
        Customer customer = new Customer("123", CustomerStatus.BLOCKED, KycStatus.VALID, RiskSegment.LOW);
        Payment payment = new Payment("789", "456", "123", BigDecimal.valueOf(50), "EUR", "WEB", "IBAN123", LocalDate.now());
        Custval custval = new Custval();

        // Act
        ReturnArea returnArea = custval.validateCustomer(customer, payment);

        // Assert
        assertEquals(ReturnCode.CUSTOMER_ERROR, returnArea.getReturnCode());
    }

    @Test
    public void testValidateCustomer_CustomerIsClosed_ReturnsCustomerError() {
        // Arrange
        Customer customer = new Customer("123", CustomerStatus.CLOSED, KycStatus.VALID, RiskSegment.LOW);
        Payment payment = new Payment("789", "456", "123", BigDecimal.valueOf(50), "EUR", "WEB", "IBAN123", LocalDate.now());
        Custval custval = new Custval();

        // Act
        ReturnArea returnArea = custval.validateCustomer(customer, payment);

        // Assert
        assertEquals(ReturnCode.CUSTOMER_ERROR, returnArea.getReturnCode());
    }

    @Test
    public void testValidateCustomer_KycIsMissing_ReturnsCustomerError() {
        // Arrange
        Customer customer = new Customer("123", CustomerStatus.ACTIVE, KycStatus.MISSING, RiskSegment.LOW);
        Payment payment = new Payment("789", "456", "123", BigDecimal.valueOf(50), "EUR", "WEB", "IBAN123", LocalDate.now());
        Custval custval = new Custval();

        // Act
        ReturnArea returnArea = custval.validateCustomer(customer, payment);

        // Assert
        assertEquals(ReturnCode.CUSTOMER_ERROR, returnArea.getReturnCode());
    }

    @Test
    public void testValidateCustomer_ValidCustomer_ReturnsApproved() {
        // Arrange
        Customer customer = new Customer("123", CustomerStatus.ACTIVE, KycStatus.VALID, RiskSegment.LOW);
        Payment payment = new Payment("789", "456", "123", BigDecimal.valueOf(50), "EUR", "WEB", "IBAN123", LocalDate.now());
        Custval custval = new Custval();

        // Act
        ReturnArea returnArea = custval.validateCustomer(customer, payment);

        // Assert
        assertEquals(ReturnCode.APPROVED, returnArea.getReturnCode());
    }
}
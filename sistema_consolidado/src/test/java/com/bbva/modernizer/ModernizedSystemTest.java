package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class PaymentValidatorTest {

    @Test
    public void testValidatePayment_CustomerNotActive_ReturnsCustomerError() {
        // Arrange
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-1", new Date());
        Customer customer = new Customer("CUST-123", CustomerStatus.BLOCKED, true, RiskSegment.LOW);
        Account account = new Account("ACC-123", "CUST-123", AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Payment approved", 0);

        // Act
        PaymentValidator validator = new PaymentValidator();
        returnArea = validator.validatePayment(payment, customer, account);

        // Assert
        assertEquals(ReturnCode.CUSTOMER_ERROR, returnArea.code());
        assertEquals("Customer is not active", returnArea.message());
    }

    @Test
    public void testValidatePayment_AccountNotOpen_ReturnsAccountError() {
        // Arrange
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-1", new Date());
        Customer customer = new Customer("CUST-123", CustomerStatus.ACTIVE, true, RiskSegment.LOW);
        Account account = new Account("ACC-123", "CUST-123", AccountStatus.BLOCKED, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Payment approved", 0);

        // Act
        PaymentValidator validator = new PaymentValidator();
        returnArea = validator.validatePayment(payment, customer, account);

        // Assert
        assertEquals(ReturnCode.ACCOUNT_ERROR, returnArea.code());
        assertEquals("Account is not open", returnArea.message());
    }

    @Test
    public void testValidatePayment_InsufficientFunds_ReturnsBalanceError() {
        // Arrange
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-1", new Date());
        Customer customer = new Customer("CUST-123", CustomerStatus.ACTIVE, true, RiskSegment.LOW);
        Account account = new Account("ACC-123", "CUST-123", AccountStatus.OPEN, BigDecimal.valueOf(50), BigDecimal.valueOf(1000), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Payment approved", 0);

        // Act
        PaymentValidator validator = new PaymentValidator();
        returnArea = validator.validatePayment(payment, customer, account);

        // Assert
        assertEquals(ReturnCode.BALANCE_ERROR, returnArea.code());
        assertEquals("Insufficient funds", returnArea.message());
    }

    @Test
    public void testValidatePayment_PaymentExceedsDailyLimit_ReturnsReviewRequired() {
        // Arrange
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-1", new Date());
        Customer customer = new Customer("CUST-123", CustomerStatus.ACTIVE, true, RiskSegment.LOW);
        Account account = new Account("ACC-123", "CUST-123", AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(50), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Payment approved", 0);

        // Act
        PaymentValidator validator = new PaymentValidator();
        returnArea = validator.validatePayment(payment, customer, account);

        // Assert
        assertEquals(ReturnCode.REVIEW_REQUIRED, returnArea.code());
        assertEquals("Payment exceeds daily limit and requires review", returnArea.message());
    }

    @Test
    public void testValidatePayment_PaymentIsValid_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-1", new Date());
        Customer customer = new Customer("CUST-123", CustomerStatus.ACTIVE, true, RiskSegment.LOW);
        Account account = new Account("ACC-123", "CUST-123", AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Payment approved", 0);

        // Act
        PaymentValidator validator = new PaymentValidator();
        returnArea = validator.validatePayment(payment, customer, account);

        // Assert
        assertEquals(ReturnCode.APPROVED, returnArea.code());
        assertEquals("Payment approved", returnArea.message());
    }
}
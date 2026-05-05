package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class BalchkTest {

    @Test
    public void testValidateBalance_AccountBlocked_ReturnsAccountError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACCT-001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL-1", "DEST-001", "20230220");
        Account account = new Account("ACCT-001", "CUST-001", AccountStatus.BLOCKED, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(500.00), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Balance validation approved", 0);

        // Act
        Balchk balchk = new Balchk();
        returnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.ACCOUNT_ERROR, returnArea.getReturnCode());
        assertEquals("Account is not open", returnArea.getReturnMessage());
    }

    @Test
    public void testValidateBalance_PaymentCurrencyDiffers_ReturnsAccountError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACCT-001", BigDecimal.valueOf(100.00), "USD", "CHANNEL-1", "DEST-001", "20230220");
        Account account = new Account("ACCT-001", "CUST-001", AccountStatus.OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(500.00), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Balance validation approved", 0);

        // Act
        Balchk balchk = new Balchk();
        returnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.ACCOUNT_ERROR, returnArea.getReturnCode());
        assertEquals("Payment currency differs from account currency", returnArea.getReturnMessage());
    }

    @Test
    public void testValidateBalance_PaymentExceedsDailyLimit_ReturnsReviewRequired() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACCT-001", BigDecimal.valueOf(600.00), "EUR", "CHANNEL-1", "DEST-001", "20230220");
        Account account = new Account("ACCT-001", "CUST-001", AccountStatus.OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(500.00), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Balance validation approved", 0);

        // Act
        Balchk balchk = new Balchk();
        returnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.REVIEW_REQUIRED, returnArea.getReturnCode());
        assertEquals("Payment exceeds daily limit and requires review", returnArea.getReturnMessage());
    }

    @Test
    public void testValidateBalance_InsufficientFunds_ReturnsBalanceError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACCT-001", BigDecimal.valueOf(1500.00), "EUR", "CHANNEL-1", "DEST-001", "20230220");
        Account account = new Account("ACCT-001", "CUST-001", AccountStatus.OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(500.00), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Balance validation approved", 0);

        // Act
        Balchk balchk = new Balchk();
        returnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.BALANCE_ERROR, returnArea.getReturnCode());
        assertEquals("Insufficient funds", returnArea.getReturnMessage());
    }

    @Test
    public void testValidateBalance_ValidPayment_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACCT-001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL-1", "DEST-001", "20230220");
        Account account = new Account("ACCT-001", "CUST-001", AccountStatus.OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(500.00), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Balance validation approved", 0);

        // Act
        Balchk balchk = new Balchk();
        returnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.APPROVED, returnArea.getReturnCode());
        assertEquals("Balance validation approved", returnArea.getReturnMessage());
    }
}
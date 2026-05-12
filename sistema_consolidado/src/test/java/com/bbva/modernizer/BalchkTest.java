package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class BalchkTest {

    @Test
    public void testValidateBalance_AccountBlocked_ReturnsAccountError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUS-001", "ACC-001", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-001", "20220101");
        Account account = new Account("ACC-001", "CUS-001", AccountStatus.BLOCKED, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
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
        Payment payment = new Payment("PAY-001", "CUS-001", "ACC-001", BigDecimal.valueOf(100), "USD", "CHANNEL-1", "DEST-001", "20220101");
        Account account = new Account("ACC-001", "CUS-001", AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
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
        Payment payment = new Payment("PAY-001", "CUS-001", "ACC-001", BigDecimal.valueOf(1500), "EUR", "CHANNEL-1", "DEST-001", "20220101");
        Account account = new Account("ACC-001", "CUS-001", AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
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
        Payment payment = new Payment("PAY-001", "CUS-001", "ACC-001", BigDecimal.valueOf(1500), "EUR", "CHANNEL-1", "DEST-001", "20220101");
        Account account = new Account("ACC-001", "CUS-001", AccountStatus.OPEN, BigDecimal.valueOf(100), BigDecimal.valueOf(1000), "EUR");
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
        Payment payment = new Payment("PAY-001", "CUS-001", "ACC-001", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-001", "20220101");
        Account account = new Account("ACC-001", "CUS-001", AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.APPROVED, "Balance validation approved", 0);

        // Act
        Balchk balchk = new Balchk();
        returnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.APPROVED, returnArea.getReturnCode());
        assertEquals("Balance validation approved", returnArea.getReturnMessage());
    }
}
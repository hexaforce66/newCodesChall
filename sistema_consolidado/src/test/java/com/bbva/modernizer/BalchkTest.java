package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class BalchkTest {

    @Test
    public void testValidateBalance_AccountBlocked_ReturnsError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-1", "2022-01-01");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_BLOCKED, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea result = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.RET_ACCT_ERR, result.getReturnCode());
        assertEquals("Account is not open", result.getReturnMessage());
    }

    @Test
    public void testValidateBalance_AccountClosed_ReturnsError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-1", "2022-01-01");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_CLOSED, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea result = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.RET_ACCT_ERR, result.getReturnCode());
        assertEquals("Account is not open", result.getReturnMessage());
    }

    @Test
    public void testValidateBalance_PaymentCurrencyDiffers_ReturnsError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100), "USD", "CHANNEL-1", "DEST-1", "2022-01-01");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea result = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.RET_ACCT_ERR, result.getReturnCode());
        assertEquals("Payment currency differs from account currency", result.getReturnMessage());
    }

    @Test
    public void testValidateBalance_PaymentExceedsDailyLimit_ReturnsReview() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(1500), "EUR", "CHANNEL-1", "DEST-1", "2022-01-01");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea result = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.RET_REVIEW, result.getReturnCode());
        assertEquals("Payment exceeds daily limit and requires review", result.getReturnMessage());
    }

    @Test
    public void testValidateBalance_InsufficientFunds_ReturnsError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(1500), "EUR", "CHANNEL-1", "DEST-1", "2022-01-01");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(100), BigDecimal.valueOf(1000), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea result = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.RET_BAL_ERR, result.getReturnCode());
        assertEquals("Insufficient funds", result.getReturnMessage());
    }

    @Test
    public void testValidateBalance_ValidPayment_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100), "EUR", "CHANNEL-1", "DEST-1", "2022-01-01");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea result = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.RET_APPROVED, result.getReturnCode());
        assertEquals("Balance validation approved", result.getReturnMessage());
    }
}
package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class BalchkTest {

    @Test
    public void testValidateBalance_AccountBlocked_ReturnsError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL-1", "DEST-1", "20220101");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_BLOCKED, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(1000.00), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Balance validation approved", 0);

        // Act
        Balchk balchk = new Balchk();
        returnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.RET_ACCT_ERR, returnArea.getReturnCode());
        assertEquals("Account is not open", returnArea.getReturnMessage());
    }

    @Test
    public void testValidateBalance_AccountClosed_ReturnsError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL-1", "DEST-1", "20220101");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_CLOSED, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(1000.00), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Balance validation approved", 0);

        // Act
        Balchk balchk = new Balchk();
        returnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.RET_ACCT_ERR, returnArea.getReturnCode());
        assertEquals("Account is not open", returnArea.getReturnMessage());
    }

    @Test
    public void testValidateBalance_PaymentCurrencyDiffersFromAccountCurrency_ReturnsError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100.00), "USD", "CHANNEL-1", "DEST-1", "20220101");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(1000.00), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Balance validation approved", 0);

        // Act
        Balchk balchk = new Balchk();
        returnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.RET_ACCT_ERR, returnArea.getReturnCode());
        assertEquals("Payment currency differs from account currency", returnArea.getReturnMessage());
    }

    @Test
    public void testValidateBalance_PaymentExceedsDailyLimit_ReturnsReview() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(1500.00), "EUR", "CHANNEL-1", "DEST-1", "20220101");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(1000.00), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Balance validation approved", 0);

        // Act
        Balchk balchk = new Balchk();
        returnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.RET_REVIEW, returnArea.getReturnCode());
        assertEquals("Payment exceeds daily limit and requires review", returnArea.getReturnMessage());
    }

    @Test
    public void testValidateBalance_InsufficientFunds_ReturnsError() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(1500.00), "EUR", "CHANNEL-1", "DEST-1", "20220101");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(100.00), BigDecimal.valueOf(1000.00), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Balance validation approved", 0);

        // Act
        Balchk balchk = new Balchk();
        returnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.RET_BAL_ERR, returnArea.getReturnCode());
        assertEquals("Insufficient funds", returnArea.getReturnMessage());
    }

    @Test
    public void testValidateBalance_ValidPayment_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("PAY-001", "CUST-001", "ACC-001", BigDecimal.valueOf(100.00), "EUR", "CHANNEL-1", "DEST-1", "20220101");
        Account account = new Account("ACC-001", "CUST-001", AccountStatus.ACC_OPEN, BigDecimal.valueOf(1000.00), BigDecimal.valueOf(1000.00), "EUR");
        ReturnArea returnArea = new ReturnArea(ReturnCode.RET_APPROVED, "Balance validation approved", 0);

        // Act
        Balchk balchk = new Balchk();
        returnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(ReturnCode.RET_APPROVED, returnArea.getReturnCode());
        assertEquals("Balance validation approved", returnArea.getReturnMessage());
    }
}
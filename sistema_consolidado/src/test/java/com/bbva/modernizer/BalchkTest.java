package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class BalchkTest {

    @Test
    public void testValidateBalance_AccountBlocked_ReturnsAccountError() {
        // Arrange
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(100), "EUR", "CHANNEL", "DESTINATION", "20220101");
        Account account = new Account("ACC-123", "CUST-123", AccountStatus.BLOCKED, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.ACCOUNT_ERROR.getValue(), "Account is not open", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea actualReturnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnArea, actualReturnArea);
    }

    @Test
    public void testValidateBalance_AccountClosed_ReturnsAccountError() {
        // Arrange
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(100), "EUR", "CHANNEL", "DESTINATION", "20220101");
        Account account = new Account("ACC-123", "CUST-123", AccountStatus.CLOSED, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.ACCOUNT_ERROR.getValue(), "Account is not open", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea actualReturnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnArea, actualReturnArea);
    }

    @Test
    public void testValidateBalance_PaymentCurrencyDiffersFromAccountCurrency_ReturnsAccountError() {
        // Arrange
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(100), "USD", "CHANNEL", "DESTINATION", "20220101");
        Account account = new Account("ACC-123", "CUST-123", AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.ACCOUNT_ERROR.getValue(), "Payment currency differs from account currency", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea actualReturnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnArea, actualReturnArea);
    }

    @Test
    public void testValidateBalance_PaymentExceedsDailyLimit_ReturnsReviewRequired() {
        // Arrange
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(1500), "EUR", "CHANNEL", "DESTINATION", "20220101");
        Account account = new Account("ACC-123", "CUST-123", AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.REVIEW_REQUIRED.getValue(), "Payment exceeds daily limit and requires review", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea actualReturnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnArea, actualReturnArea);
    }

    @Test
    public void testValidateBalance_InsufficientFunds_ReturnsBalanceError() {
        // Arrange
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(1500), "EUR", "CHANNEL", "DESTINATION", "20220101");
        Account account = new Account("ACC-123", "CUST-123", AccountStatus.OPEN, BigDecimal.valueOf(100), BigDecimal.valueOf(1000), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.BALANCE_ERROR.getValue(), "Insufficient funds", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea actualReturnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnArea, actualReturnArea);
    }

    @Test
    public void testValidateBalance_ValidPayment_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(100), "EUR", "CHANNEL", "DESTINATION", "20220101");
        Account account = new Account("ACC-123", "CUST-123", AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.APPROVED.getValue(), "Balance validation approved", 0);

        // Act
        Balchk balchk = new Balchk();
        ReturnArea actualReturnArea = balchk.validateBalance(payment, account);

        // Assert
        assertEquals(expectedReturnArea, actualReturnArea);
    }
}
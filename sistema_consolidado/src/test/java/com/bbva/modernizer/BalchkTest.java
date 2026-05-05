package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class BalchkTest {

    @Test
    public void testValidateBalance_AccountBlocked_ReturnsAccountError() {
        // Arrange
        Account account = new Account("123", "456", AccountStatus.BLOCKED, BigDecimal.valueOf(100), BigDecimal.valueOf(1000), "EUR");
        Payment payment = new Payment("789", "456", "123", BigDecimal.valueOf(50), "EUR", "WEB", "IBAN123", LocalDate.now());
        Balchk balchk = new Balchk();

        // Act
        ReturnArea returnArea = balchk.validateBalance(account, payment);

        // Assert
        assertEquals(ReturnCode.ACCOUNT_ERROR, returnArea.getReturnCode());
    }

    @Test
    public void testValidateBalance_AccountClosed_ReturnsAccountError() {
        // Arrange
        Account account = new Account("123", "456", AccountStatus.CLOSED, BigDecimal.valueOf(100), BigDecimal.valueOf(1000), "EUR");
        Payment payment = new Payment("789", "456", "123", BigDecimal.valueOf(50), "EUR", "WEB", "IBAN123", LocalDate.now());
        Balchk balchk = new Balchk();

        // Act
        ReturnArea returnArea = balchk.validateBalance(account, payment);

        // Assert
        assertEquals(ReturnCode.ACCOUNT_ERROR, returnArea.getReturnCode());
    }

    @Test
    public void testValidateBalance_PaymentCurrencyDiffersFromAccountCurrency_ReturnsAccountError() {
        // Arrange
        Account account = new Account("123", "456", AccountStatus.OPEN, BigDecimal.valueOf(100), BigDecimal.valueOf(1000), "EUR");
        Payment payment = new Payment("789", "456", "123", BigDecimal.valueOf(50), "USD", "WEB", "IBAN123", LocalDate.now());
        Balchk balchk = new Balchk();

        // Act
        ReturnArea returnArea = balchk.validateBalance(account, payment);

        // Assert
        assertEquals(ReturnCode.ACCOUNT_ERROR, returnArea.getReturnCode());
    }

    @Test
    public void testValidateBalance_PaymentExceedsDailyLimit_ReturnsReviewRequired() {
        // Arrange
        Account account = new Account("123", "456", AccountStatus.OPEN, BigDecimal.valueOf(100), BigDecimal.valueOf(50), "EUR");
        Payment payment = new Payment("789", "456", "123", BigDecimal.valueOf(75), "EUR", "WEB", "IBAN123", LocalDate.now());
        Balchk balchk = new Balchk();

        // Act
        ReturnArea returnArea = balchk.validateBalance(account, payment);

        // Assert
        assertEquals(ReturnCode.REVIEW_REQUIRED, returnArea.getReturnCode());
    }

    @Test
    public void testValidateBalance_InsufficientFunds_ReturnsBalanceError() {
        // Arrange
        Account account = new Account("123", "456", AccountStatus.OPEN, BigDecimal.valueOf(50), BigDecimal.valueOf(1000), "EUR");
        Payment payment = new Payment("789", "456", "123", BigDecimal.valueOf(75), "EUR", "WEB", "IBAN123", LocalDate.now());
        Balchk balchk = new Balchk();

        // Act
        ReturnArea returnArea = balchk.validateBalance(account, payment);

        // Assert
        assertEquals(ReturnCode.BALANCE_ERROR, returnArea.getReturnCode());
    }

    @Test
    public void testValidateBalance_ValidPayment_ReturnsApproved() {
        // Arrange
        Account account = new Account("123", "456", AccountStatus.OPEN, BigDecimal.valueOf(100), BigDecimal.valueOf(1000), "EUR");
        Payment payment = new Payment("789", "456", "123", BigDecimal.valueOf(50), "EUR", "WEB", "IBAN123", LocalDate.now());
        Balchk balchk = new Balchk();

        // Act
        ReturnArea returnArea = balchk.validateBalance(account, payment);

        // Assert
        assertEquals(ReturnCode.APPROVED, returnArea.getReturnCode());
    }
}
package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class RiskscorTest {

    @Test
    public void testCalculateRisk_PaymentRejectedByRiskScore_ReturnsRiskError() {
        // Arrange
        Payment payment = new Payment("789", "456", "123", BigDecimal.valueOf(15000), "EUR", "WEB", "IBAN123", LocalDate.now());
        Customer customer = new Customer("123", CustomerStatus.ACTIVE, KycStatus.VALID, RiskSegment.HIGH);
        Account account = new Account("123", "456", AccountStatus.OPEN, BigDecimal.valueOf(100), BigDecimal.valueOf(1000), "EUR");
        Riskscor riskscor = new Riskscor();

        // Act
        ReturnArea returnArea = riskscor.calculateRisk(payment, customer, account);

        // Assert
        assertEquals(ReturnCode.RISK_ERROR, returnArea.getReturnCode());
    }

    @Test
    public void testCalculateRisk_PaymentRequiresManualRiskReview_ReturnsReviewRequired() {
        // Arrange
        Payment payment = new Payment("789", "456", "123", BigDecimal.valueOf(10000), "EUR", "WEB", "IBAN123", LocalDate.now());
        Customer customer = new Customer("123", CustomerStatus.ACTIVE, KycStatus.VALID, RiskSegment.HIGH);
        Account account = new Account("123", "456", AccountStatus.OPEN, BigDecimal.valueOf(100), BigDecimal.valueOf(1000), "EUR");
        Riskscor riskscor = new Riskscor();

        // Act
        ReturnArea returnArea = riskscor.calculateRisk(payment, customer, account);

        // Assert
        assertEquals(ReturnCode.REVIEW_REQUIRED, returnArea.getReturnCode());
    }

    @Test
    public void testCalculateRisk_ValidPayment_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("789", "456", "123", BigDecimal.valueOf(50), "EUR", "WEB", "IBAN123", LocalDate.now());
        Customer customer = new Customer("123", CustomerStatus.ACTIVE, KycStatus.VALID, RiskSegment.LOW);
        Account account = new Account("123", "456", AccountStatus.OPEN, BigDecimal.valueOf(100), BigDecimal.valueOf(1000), "EUR");
        Riskscor riskscor = new Riskscor();

        // Act
        ReturnArea returnArea = riskscor.calculateRisk(payment, customer, account);

        // Assert
        assertEquals(ReturnCode.APPROVED, returnArea.getReturnCode());
    }
}
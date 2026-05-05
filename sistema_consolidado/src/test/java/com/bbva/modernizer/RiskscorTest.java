package com.bbva.modernizer;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class RiskscorTest {

    @Test
    public void testCalculateRisk_PaymentAmountExceeds10000_ReturnsRiskError() {
        // Arrange
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(15000), "EUR", "CHANNEL", "DESTINATION", "2022-01-01");
        Customer customer = new Customer("CUST-123", CustomerStatus.ACTIVE, KycFlag.VALID, RiskSegment.LOW);
        Account account = new Account("ACC-123", "CUST-123", AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.RISK_ERROR, "Payment rejected by risk score", 80);

        // Act
        Riskscor riskscor = new Riskscor();
        ReturnArea actualReturnArea = riskscor.calculateRisk(payment, customer, account);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), actualReturnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), actualReturnArea.getReturnMessage());
        assertEquals(expectedReturnArea.getReturnRiskScore(), actualReturnArea.getReturnRiskScore());
    }

    @Test
    public void testCalculateRisk_PaymentAmountExceeds5000_ReturnsReview() {
        // Arrange
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(6000), "EUR", "CHANNEL", "DESTINATION", "2022-01-01");
        Customer customer = new Customer("CUST-123", CustomerStatus.ACTIVE, KycFlag.VALID, RiskSegment.LOW);
        Account account = new Account("ACC-123", "CUST-123", AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.REVIEW, "Payment requires manual risk review", 60);

        // Act
        Riskscor riskscor = new Riskscor();
        ReturnArea actualReturnArea = riskscor.calculateRisk(payment, customer, account);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), actualReturnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), actualReturnArea.getReturnMessage());
        assertEquals(expectedReturnArea.getReturnRiskScore(), actualReturnArea.getReturnRiskScore());
    }

    @Test
    public void testCalculateRisk_ValidPayment_ReturnsApproved() {
        // Arrange
        Payment payment = new Payment("PAY-123", "CUST-123", "ACC-123", BigDecimal.valueOf(100), "EUR", "CHANNEL", "DESTINATION", "2022-01-01");
        Customer customer = new Customer("CUST-123", CustomerStatus.ACTIVE, KycFlag.VALID, RiskSegment.LOW);
        Account account = new Account("ACC-123", "CUST-123", AccountStatus.OPEN, BigDecimal.valueOf(1000), BigDecimal.valueOf(1000), "EUR");
        ReturnArea expectedReturnArea = new ReturnArea(ReturnCode.APPROVED, "Risk validation approved", 10);

        // Act
        Riskscor riskscor = new Riskscor();
        ReturnArea actualReturnArea = riskscor.calculateRisk(payment, customer, account);

        // Assert
        assertEquals(expectedReturnArea.getReturnCode(), actualReturnArea.getReturnCode());
        assertEquals(expectedReturnArea.getReturnMessage(), actualReturnArea.getReturnMessage());
        assertEquals(expectedReturnArea.getReturnRiskScore(), actualReturnArea.getReturnRiskScore());
    }
}
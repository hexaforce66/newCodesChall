// PaymentProcessor.java
public class PaymentProcessor {
    private PaymentValidator paymentValidator;
    private RiskScoreCalculator riskScoreCalculator;
    private AuditLogger auditLogger;

    public PaymentProcessor(PaymentValidator paymentValidator, RiskScoreCalculator riskScoreCalculator, AuditLogger auditLogger) {
        this.paymentValidator = paymentValidator;
        this.riskScoreCalculator = riskScoreCalculator;
        this.auditLogger = auditLogger;
    }

    public void processPayment(PaymentDTO paymentDTO) {
        // Validar pago
        paymentValidator.validatePayment(paymentDTO);

        // Calcular riesgo
        riskScoreCalculator.calculateRisk(paymentDTO);

        // Generar archivo de auditoría
        auditLogger.logAudit(paymentDTO);
    }
}

// PaymentValidator.java
public class PaymentValidator {
    public void validatePayment(PaymentDTO paymentDTO) {
        // Validar pago
        if (!paymentDTO.isValid()) {
            throw new PaymentException("Pago no válido");
        }
    }
}

// RiskScoreCalculator.java
public class RiskScoreCalculator {
    public void calculateRisk(PaymentDTO paymentDTO) {
        // Calcular riesgo
        int riskScore = calculateRiskScore(paymentDTO);
        paymentDTO.setRiskScore(riskScore);
    }

    private int calculateRiskScore(PaymentDTO paymentDTO) {
        // Calcular riesgo
        return 10; // Valor de ejemplo
    }
}

// AuditLogger.java
public class AuditLogger {
    public void logAudit(PaymentDTO paymentDTO) {
        // Generar archivo de auditoría
        System.out.println("Pago procesado: " + paymentDTO.getPaymentId());
    }
}

// PaymentDTO.java
public class PaymentDTO {
    private String paymentId;
    private String customerId;
    private String accountId;
    private double amount;
    private String currency;
    private String channel;
    private String destination;
    private Date requestDate;
    private int riskScore;

    // Getters y setters
}

// CustomerDTO.java
public class CustomerDTO {
    private String customerId;
    private String customerStatus;
    private boolean kycValid;
    private String riskSegment;

    // Getters y setters
}

// AccountDTO.java
public class AccountDTO {
    private String accountId;
    private String accountStatus;
    private double balance;
    private double dailyLimit;
    private String currency;

    // Getters y setters
}

// PaymentException.java
public class PaymentException extends Exception {
    public PaymentException(String message) {
        super(message);
    }
}
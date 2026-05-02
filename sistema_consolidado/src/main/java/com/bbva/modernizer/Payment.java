// Payment.java
public record Payment(
    String id,
    String customerId,
    String accountId,
    String accountId,
    BigDecimal amount,
    String currency,
    String channel,
    String destination,
    LocalDate requestDate
) {
}

// Customer.java
public record Customer(
    String id,
    String status,
    boolean kycValid,
    String riskSegment
) {
}

// Account.java
public record Account(
    String id,
    String customerId,
    String status,
    BigDecimal balance,
    BigDecimal dailyLimit,
    String currency
) {
}

// ReturnCode.java
public record ReturnCode(
    String code,
    String message,
    int riskScore
) {
}

// PaymentException.java
public class PaymentException extends Exception {
    private final String code;
    private final String message;

    public PaymentException(String code, String message) {
        super(message);
        this.code = code;
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}

// CustomerValidator.java
@Service
public class CustomerValidator {
    @Autowired
    private CustomerRepository customerRepository;

    public void validate(Customer customer) {
        if (customer.status().equals("BLOCKED") || customer.status().equals("CLOSED")) {
            throw new PaymentException("1001", "Customer is not active");
        }

        if (!customer.kycValid()) {
            throw new PaymentException("1001", "Customer KYC is incomplete");
        }
    }
}

// AccountValidator.java
@Service
public class AccountValidator {
    @Autowired
    private AccountRepository accountRepository;

    public void validate(Account account) {
        if (account.status().equals("BLOCKED") || account.status().equals("CLOSED")) {
            throw new PaymentException("2001", "Account is not open");
        }

        if (account.balance().compareTo(BigDecimal.ZERO) < 0) {
            throw new PaymentException("3001", "Insufficient funds");
        }
    }
}

// RiskValidator.java
@Service
public class RiskValidator {
    public void validate(Payment payment, Customer customer, Account account) {
        int riskScore = calculateRiskScore(payment, customer, account);

        if (riskScore > 80) {
            throw new PaymentException("4001", "Payment rejected by risk score");
        }

        if (riskScore > 60) {
            throw new PaymentException("9001", "Payment requires manual risk review");
        }
    }

    private int calculateRiskScore(Payment payment, Customer customer, Account account) {
        int riskScore = 10;

        if (customer.riskSegment().equals("MEDIUM")) {
            riskScore += 30;
        }

        if (customer.riskSegment().equals("HIGH")) {
            riskScore += 60;
        }

        if (payment.amount().compareTo(BigDecimal.valueOf(10000)) > 0) {
            riskScore += 30;
        } else if (payment.amount().compareTo(BigDecimal.valueOf(5000)) > 0) {
            riskScore += 15;
        } else {
            riskScore += 5;
        }

        return riskScore;
    }
}

// PaymentRuleEngine.java
@Service
public class PaymentRuleEngine {
    @Autowired
    private CustomerValidator customerValidator;

    @Autowired
    private AccountValidator accountValidator;

    @Autowired
    private RiskValidator riskValidator;

    public ReturnCode evaluate(Payment payment, Customer customer, Account account) {
        try {
            customerValidator.validate(customer);
            accountValidator.validate(account);
            riskValidator.validate(payment, customer, account);

            return new ReturnCode("0000", "Payment approved", 0);
        } catch (PaymentException e) {
            return new ReturnCode(e.getCode(), e.getMessage(), 0);
        }
    }
}

// PaymentJobOrchestrator.java
@Component
public class PaymentJobOrchestrator {
    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private PaymentRuleEngine paymentRuleEngine;

    @Scheduled(fixedDelay = 86400000) // ejecutar cada 24 horas
    public void execute() {
        List<Payment> payments = paymentRepository.findAll();

        for (Payment payment : payments) {
            Customer customer = paymentRepository.findCustomerByPayment(payment);
            Account account = paymentRepository.findAccountByPayment(payment);

            ReturnCode returnCode = paymentRuleEngine.evaluate(payment, customer, account);

            if (returnCode.code().equals("0000")) {
                // aprobar pago
            } else {
                // rechazar pago
            }
        }
    }
}
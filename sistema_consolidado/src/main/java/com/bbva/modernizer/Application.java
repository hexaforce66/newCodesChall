// Application.java
@SpringBootApplication
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}

// PaymentProcessorConfig.java
@Configuration
public class PaymentProcessorConfig {
    @Bean
    public PaymentValidator paymentValidator() {
        return new PaymentValidator();
    }

    @Bean
    public RiskScoreCalculator riskScoreCalculator() {
        return new RiskScoreCalculator();
    }

    @Bean
    public AuditLogger auditLogger() {
        return new AuditLogger();
    }

    @Bean
    public PaymentProcessor paymentProcessor() {
        return new PaymentProcessor(paymentValidator(), riskScoreCalculator(), auditLogger());
    }
}
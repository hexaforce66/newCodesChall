// PaymentProcessorConfig.java
@Configuration
public class PaymentProcessorConfig {
    @Bean
    public PaymentValidator paymentValidator() {
        return new PaymentValidator();
    }

    @Bean
    public CustomerValidator customerValidator() {
        return new CustomerValidator();
    }

    @Bean
    public AccountValidator accountValidator() {
        return new AccountValidator();
    }

    @Bean
    public RiskScoreCalculator riskScoreCalculator() {
        return new RiskScoreCalculator();
    }

    @Bean
    public TransactionLogger transactionLogger() {
        return new TransactionLogger();
    }

    @Bean
    public PaymentProcessor paymentProcessor() {
        return new PaymentProcessor(paymentValidator(), customerValidator(), accountValidator(), riskScoreCalculator(), transactionLogger());
    }
}
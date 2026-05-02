// PaymentApplication.java
@SpringBootApplication
public class PaymentApplication {
    public static void main(String[] args) {
        SpringApplication.run(PaymentApplication.class, args);
    }
}

// JobOrchestratorConfig.java
@Configuration
public class JobOrchestratorConfig {
    @Bean
    public JobOrchestrator jobOrchestrator() {
        return new JobOrchestrator(paymentProcessor());
    }

    @Bean
    public PaymentProcessor paymentProcessor() {
        return new PaymentProcessor(paymentValidator(), customerValidator(), accountValidator(), riskScoreCalculator(), transactionLogger());
    }

    // ...
}

// JobOrchestratorRunner.java
@Component
public class JobOrchestratorRunner implements CommandLineRunner {
    private final JobOrchestrator jobOrchestrator;

    public JobOrchestratorRunner(JobOrchestrator jobOrchestrator) {
        this.jobOrchestrator = jobOrchestrator;
    }

    @Override
    public void run(String... args) {
        jobOrchestrator.execute();
    }
}
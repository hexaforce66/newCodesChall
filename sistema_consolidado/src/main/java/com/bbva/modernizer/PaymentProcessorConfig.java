// PaymentProcessorConfig.java
@Configuration
public class PaymentProcessorConfig {
    @Value("${input.file}")
    private String inputFile;

    @Value("${output.file}")
    private String outputFile;

    // ...
}
@SpringBootApplication
public class ProcesoBancoApplication {

    @Bean
    public ProcesoBanco procesoBanco() {
        return new ProcesoBanco(motorDeReglas());
    }

    @Bean
    public MotorDeReglas motorDeReglas() {
        return new MotorDeReglas();
    }

    public static void main(String[] args) {
        SpringApplication.run(ProcesoBancoApplication.class, args);
    }
}
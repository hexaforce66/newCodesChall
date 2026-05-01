@SpringBootApplication
public class BancoApplication {

    public static void main(String[] args) {
        SpringApplication.run(BancoApplication.class, args);
    }

    @Bean
    public CommandLineRunner commandLineRunner(ApplicationContext ctx) {
        return args -> {
            ProcesoBanco procesoBanco = ctx.getBean(ProcesoBanco.class);
            procesoBanco.procesar();
        };
    }
}
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class BancoRunner implements CommandLineRunner {

    private final ProcesoBanco procesoBanco;

    @Autowired
    public BancoRunner(ProcesoBanco procesoBanco) {
        this.procesoBanco = procesoBanco;
    }

    @Override
    public void run(String... args) {
        procesoBanco.procesarArchivo("transacciones.txt");
    }
}
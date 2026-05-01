import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class ProcesoBancoTest {

    @Mock
    private MotorDeReglas motorDeReglas;

    @InjectMocks
    private ProcesoBanco procesoBanco;

    @Test
    public void testProcesarArchivo() throws FileNotFoundException, SQLException {
        // Configuración del mock
        Resultado resultado = new Resultado();
        resultado.setExitoso(true);
        resultado.setNuevoSaldo(100.0);
        when(motorDeReglas.validarYCalcular(any(double.class), any(double.class))).thenReturn(resultado);

        // Creación de un archivo de transacciones de prueba
        File archivo = new File("transacciones.txt");
        archivo.createNewFile();

        // Procesamiento del archivo
        procesoBanco.procesarArchivo("transacciones.txt");

        // Verificación del resultado
        assertEquals(true, resultado.esExitoso());
        assertEquals(100.0, resultado.getNuevoSaldo(), 0.01);
    }
}
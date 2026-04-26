import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class DemoBancoTest {

    @Mock
    private Scanner scanner;

    @InjectMocks
    private DemoBanco demoBanco;

    @BeforeEach
    public void setup() {
        demoBanco.numeroTarjeta = "";
        demoBanco.cuentaBancaria = "";
        demoBanco.rfcCliente = "";
        demoBanco.montoTransaccion = 0.0;
        demoBanco.limiteDiario = 10000.00;
        demoBanco.respuesta = "";
    }

    @Test
    public void testIniciar_TransaccionAprobada() {
        // Arrange
        when(scanner.nextLine()).thenReturn("1234-5678-9012-3456", "1234567890", "RFC123456789", "1000.0");

        // Act
        demoBanco.iniciar();

        // Assert
        assertEquals("Transacción aprobada", demoBanco.respuesta);
    }

    @Test
    public void testIniciar_TransaccionRechazada() {
        // Arrange
        when(scanner.nextLine()).thenReturn("1234-5678-9012-3456", "1234567890", "RFC123456789", "15000.0");

        // Act
        demoBanco.iniciar();

        // Assert
        assertEquals("Transacción rechazada: excede límite diario", demoBanco.respuesta);
    }

    @Test
    public void testLeerEntrada() {
        // Arrange
        InputStream inputStream = new ByteArrayInputStream("Hola".getBytes(StandardCharsets.UTF_8));
        System.setIn(inputStream);

        // Act
        String resultado = demoBanco.leerEntrada();

        // Assert
        assertEquals("Hola", resultado);
    }

    @Test
    public void testLeerDouble() {
        // Arrange
        InputStream inputStream = new ByteArrayInputStream("10.5".getBytes(StandardCharsets.UTF_8));
        System.setIn(inputStream);

        // Act
        double resultado = demoBanco.leerDouble();

        // Assert
        assertEquals(10.5, resultado, 0.01);
    }
}
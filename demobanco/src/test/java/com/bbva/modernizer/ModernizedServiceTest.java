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
        String entrada = "1234567890123456\n1234567890\nRFC123456789\n1000.0";
        InputStream inputStream = new ByteArrayInputStream(entrada.getBytes(StandardCharsets.UTF_8));
        System.setIn(inputStream);
        when(scanner.nextLine()).thenReturn("1234567890123456", "1234567890", "RFC123456789");
        when(scanner.nextDouble()).thenReturn(1000.0);

        // Act
        demoBanco.iniciar();

        // Assert
        assertEquals("Transacción aprobada", demoBanco.respuesta);
    }

    @Test
    public void testIniciar_TransaccionRechazada() {
        // Arrange
        String entrada = "1234567890123456\n1234567890\nRFC123456789\n15000.0";
        InputStream inputStream = new ByteArrayInputStream(entrada.getBytes(StandardCharsets.UTF_8));
        System.setIn(inputStream);
        when(scanner.nextLine()).thenReturn("1234567890123456", "1234567890", "RFC123456789");
        when(scanner.nextDouble()).thenReturn(15000.0);

        // Act
        demoBanco.iniciar();

        // Assert
        assertEquals("Transacción rechazada: excede límite diario", demoBanco.respuesta);
    }
}
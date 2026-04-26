import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Scanner;

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
        when(scanner.nextLine()).thenReturn("1234567890", "1234567890", "RFC1234567890", "1000.0");
        InputStream inputStream = new ByteArrayInputStream("1000.0".getBytes());
        System.setIn(inputStream);

        // Act
        demoBanco.iniciar();

        // Assert
        assertEquals("Transacción aprobada", demoBanco.respuesta);
    }

    @Test
    public void testIniciar_TransaccionRechazada() {
        // Arrange
        when(scanner.nextLine()).thenReturn("1234567890", "1234567890", "RFC1234567890", "15000.0");
        InputStream inputStream = new ByteArrayInputStream("15000.0".getBytes());
        System.setIn(inputStream);

        // Act
        demoBanco.iniciar();

        // Assert
        assertEquals("Transacción rechazada: excede límite diario", demoBanco.respuesta);
    }
}
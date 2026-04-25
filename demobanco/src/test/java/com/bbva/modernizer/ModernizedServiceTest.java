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
        when(scanner.nextLine()).thenReturn("1234-5678-9012-3456", "1234567890", "RFC123456789", "1000.00");
        when(scanner.nextDouble()).thenReturn(1000.00);

        // Act
        demoBanco.iniciar();

        // Assert
        assertEquals("Transacción aprobada", demoBanco.respuesta);
    }

    @Test
    public void testIniciar_TransaccionRechazada() {
        // Arrange
        when(scanner.nextLine()).thenReturn("1234-5678-9012-3456", "1234567890", "RFC123456789", "15000.00");
        when(scanner.nextDouble()).thenReturn(15000.00);

        // Act
        demoBanco.iniciar();

        // Assert
        assertEquals("Transacción rechazada: excede límite diario", demoBanco.respuesta);
    }

    @Test
    public void testLeerEntrada() {
        // Arrange
        String input = "1234-5678-9012-3456";
        InputStream inputStream = new ByteArrayInputStream(input.getBytes());
        System.setIn(inputStream);

        // Act
        String resultado = demoBanco.leerEntrada();

        // Assert
        assertEquals(input, resultado);
    }

    @Test
    public void testLeerDouble() {
        // Arrange
        String input = "1000.00";
        InputStream inputStream = new ByteArrayInputStream(input.getBytes());
        System.setIn(inputStream);

        // Act
        double resultado = demoBanco.leerDouble();

        // Assert
        assertEquals(1000.00, resultado, 0.01);
    }
}
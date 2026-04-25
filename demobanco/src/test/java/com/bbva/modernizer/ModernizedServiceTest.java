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

    @Test
    public void testIniciar_TransaccionAprobada() {
        // Arrange
        when(scanner.nextLine()).thenReturn("1234567890", "1234567890123456", "RFC123456789");
        when(scanner.nextDouble()).thenReturn(5000.0);

        // Act
        demoBanco.iniciar();

        // Assert
        assertEquals("Transacción aprobada", demoBanco.getRespuesta());
    }

    @Test
    public void testIniciar_TransaccionRechazada() {
        // Arrange
        when(scanner.nextLine()).thenReturn("1234567890", "1234567890123456", "RFC123456789");
        when(scanner.nextDouble()).thenReturn(15000.0);

        // Act
        demoBanco.iniciar();

        // Assert
        assertEquals("Transacción rechazada: excede límite diario", demoBanco.getRespuesta());
    }

    @Test
    public void testLeerEntrada() {
        // Arrange
        String entrada = "Hola";
        InputStream inputStream = new ByteArrayInputStream(entrada.getBytes(StandardCharsets.UTF_8));
        System.setIn(inputStream);

        // Act
        String resultado = demoBanco.leerEntrada();

        // Assert
        assertEquals(entrada, resultado);
    }

    @Test
    public void testLeerDouble() {
        // Arrange
        String entrada = "123.45";
        InputStream inputStream = new ByteArrayInputStream(entrada.getBytes(StandardCharsets.UTF_8));
        System.setIn(inputStream);

        // Act
        double resultado = demoBanco.leerDouble();

        // Assert
        assertEquals(123.45, resultado, 0.01);
    }
}
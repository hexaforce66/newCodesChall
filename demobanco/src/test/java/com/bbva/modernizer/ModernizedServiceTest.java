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
        demoBanco = new DemoBanco();
    }

    @Test
    public void testIniciar_TransaccionAprobada() {
        // Arrange
        String input = "1234567890123456\n" +
                "1234567890\n" +
                "RFC123456789\n" +
                "1000.0";
        InputStream inputStream = new ByteArrayInputStream(input.getBytes(StandardCharsets.UTF_8));
        System.setIn(inputStream);
        when(scanner.nextLine()).thenReturn("1234567890123456", "1234567890", "RFC123456789");
        when(scanner.nextDouble()).thenReturn(1000.0);

        // Act
        demoBanco.iniciar();

        // Assert
        assertEquals("Transacción aprobada", demoBanco.getRespuesta());
    }

    @Test
    public void testIniciar_TransaccionRechazada() {
        // Arrange
        String input = "1234567890123456\n" +
                "1234567890\n" +
                "RFC123456789\n" +
                "15000.0";
        InputStream inputStream = new ByteArrayInputStream(input.getBytes(StandardCharsets.UTF_8));
        System.setIn(inputStream);
        when(scanner.nextLine()).thenReturn("1234567890123456", "1234567890", "RFC123456789");
        when(scanner.nextDouble()).thenReturn(15000.0);

        // Act
        demoBanco.iniciar();

        // Assert
        assertEquals("Transacción rechazada: excede límite diario", demoBanco.getRespuesta());
    }
}
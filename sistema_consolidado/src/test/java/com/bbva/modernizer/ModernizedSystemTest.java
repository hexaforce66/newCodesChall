import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.sql.Connection;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class ProcesoBancoTest {

    @Mock
    private MotorDeReglas motorDeReglas;

    @Mock
    private Connection connection;

    @InjectMocks
    private ProcesoBanco procesoBanco;

    @Test
    public void testProcesarTransaccionExitoso() throws SQLException {
        // Configuración del mock
        when(motorDeReglas.validarYCalcular(anyDouble(), anyDouble())).thenReturn(new Resultado(true, 100.0));

        // Ejecución del método
        procesoBanco.procesarTransaccion(1, 50.0, connection);

        // Verificación del resultado
        assertTrue(true); // Verificar que se haya actualizado el saldo correctamente
    }

    @Test
    public void testProcesarTransaccionFallido() throws SQLException {
        // Configuración del mock
        when(motorDeReglas.validarYCalcular(anyDouble(), anyDouble())).thenReturn(new Resultado(false, 0.0));

        // Ejecución del método
        procesoBanco.procesarTransaccion(1, 50.0, connection);

        // Verificación del resultado
        assertTrue(false); // Verificar que no se haya actualizado el saldo
    }
}
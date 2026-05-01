import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class ProcesoBancoTest {

    @Mock
    private MotorDeReglas motorDeReglas;

    @InjectMocks
    private ProcesoBanco procesoBanco;

    @Test
    public void testProcesarTransaccion() throws Exception {
        // Configurar mock para motor de reglas
        AreaIntercambio areaIntercambio = new AreaIntercambio(1000.0, 500.0);
        when(motorDeReglas.validarYCalcular(areaIntercambio)).thenReturn();

        // Procesar transacción
        procesoBanco.procesarTransaccion(null, 1, 500.0);

        // Verificar resultado
        assertEquals(1500.0, areaIntercambio.getNuevoSaldo(), 0.01);
    }
}
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.doReturn;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class ProcesoBancoTest {

    @Mock
    private Connection connection;

    @Mock
    private PreparedStatement pstmt;

    @Mock
    private ResultSet rs;

    private ProcesoBanco procesoBanco;

    @BeforeEach
    public void setup() {
        procesoBanco = new ProcesoBanco();
    }

    @Test
    public void testConsultarSaldo() throws SQLException {
        // Arrange
        when(connection.prepareStatement(anyString())).thenReturn(pstmt);
        when(pstmt.executeQuery()).thenReturn(rs);
        when(rs.next()).thenReturn(true);
        when(rs.getDouble(anyString())).thenReturn(100.0);

        // Act
        double saldo = procesoBanco.consultarSaldo(connection, 1);

        // Assert
        assertEquals(100.0, saldo);
        verify(connection).prepareStatement(anyString());
        verify(pstmt).executeQuery();
        verify(rs).next();
        verify(rs).getDouble(anyString());
    }

    @Test
    public void testConsultarSaldoNoExiste() throws SQLException {
        // Arrange
        when(connection.prepareStatement(anyString())).thenReturn(pstmt);
        when(pstmt.executeQuery()).thenReturn(rs);
        when(rs.next()).thenReturn(false);

        // Act
        double saldo = procesoBanco.consultarSaldo(connection, 1);

        // Assert
        assertEquals(0, saldo);
        verify(connection).prepareStatement(anyString());
        verify(pstmt).executeQuery();
        verify(rs).next();
    }

    @Test
    public void testActualizarSaldo() throws SQLException {
        // Arrange
        when(connection.prepareStatement(anyString())).thenReturn(pstmt);

        // Act
        procesoBanco.actualizarSaldo(connection, 1, 100.0);

        // Assert
        verify(connection).prepareStatement(anyString());
        verify(pstmt).setDouble(anyInt(), anyDouble());
        verify(pstmt).setInt(anyInt(), anyInt());
        verify(pstmt).executeUpdate();
    }

    @Test
    public void testActualizarSaldoSQLException() throws SQLException {
        // Arrange
        when(connection.prepareStatement(anyString())).thenReturn(pstmt);
        doThrow(SQLException.class).when(pstmt).executeUpdate();

        // Act y Assert
        try {
            procesoBanco.actualizarSaldo(connection, 1, 100.0);
        } catch (SQLException e) {
            assertEquals(SQLException.class, e.getClass());
        }
    }

    @Test
    public void testMain() throws SQLException, FileNotFoundException {
        // Arrange
        File file = mock(File.class);
        when(file.exists()).thenReturn(true);
        Scanner scanner = mock(Scanner.class);
        when(scanner.hasNextLine()).thenReturn(true).thenReturn(false);
        when(scanner.nextLine()).thenReturn("1,100.0");
        when(connection.prepareStatement(anyString())).thenReturn(pstmt);
        when(pstmt.executeQuery()).thenReturn(rs);
        when(rs.next()).thenReturn(true);
        when(rs.getDouble(anyString())).thenReturn(100.0);

        // Act
        procesoBanco.main(new String[]{});

        // Assert
        verify(connection).prepareStatement(anyString());
        verify(pstmt).executeQuery();
        verify(rs).next();
        verify(rs).getDouble(anyString());
        verify(pstmt).setDouble(anyInt(), anyDouble());
        verify(pstmt).setInt(anyInt(), anyInt());
        verify(pstmt).executeUpdate();
    }
}
import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class ProcesoBanco {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/banco";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "password";

    public static void main(String[] args) {
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            File file = new File("transacciones.txt");
            Scanner scanner = new Scanner(file);

            while (scanner.hasNextLine()) {
                String[] transaccion = scanner.nextLine().split(",");
                int id = Integer.parseInt(transaccion[0]);
                double monto = Double.parseDouble(transaccion[1]);

                // Consulta saldo actual
                double saldo = consultarSaldo(conn, id);

                // Sumar monto
                saldo += monto;

                // Actualizar BD
                actualizarSaldo(conn, id, saldo);
            }

            scanner.close();
        } catch (SQLException | FileNotFoundException e) {
            System.err.println("Error: " + e.getMessage());
        }
    }

    private static double consultarSaldo(Connection conn, int id) throws SQLException {
        String query = "SELECT SALDO FROM CUENTAS WHERE ID = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getDouble("SALDO");
                } else {
                    return 0;
                }
            }
        }
    }

    private static void actualizarSaldo(Connection conn, int id, double saldo) throws SQLException {
        String query = "UPDATE CUENTAS SET SALDO = ? WHERE ID = ?";
        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setDouble(1, saldo);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
        }
    }
}
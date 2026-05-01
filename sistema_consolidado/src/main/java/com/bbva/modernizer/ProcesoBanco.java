import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.File;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

@Component
public class ProcesoBanco {

    private final MotorDeReglas motorDeReglas;

    @Autowired
    public ProcesoBanco(MotorDeReglas motorDeReglas) {
        this.motorDeReglas = motorDeReglas;
    }

    public void procesarArchivo(String archivo) {
        try (Scanner scanner = new Scanner(new File(archivo))) {
            while (scanner.hasNextLine()) {
                String[] datos = scanner.nextLine().split(",");
                if (datos.length == 2) {
                    int id = Integer.parseInt(datos[0]);
                    double monto = Double.parseDouble(datos[1]);
                    procesarTransaccion(id, monto);
                }
            }
        } catch (FileNotFoundException e) {
            System.out.println("Archivo no encontrado: " + e.getMessage());
        }
    }

    private void procesarTransaccion(int id, double monto) {
        try (Connection conn = DriverManager.getConnection("jdbc:sqlite:banco.db")) {
            double saldoActual = obtenerSaldoActual(conn, id);
            if (saldoActual != -1) {
                Resultado resultado = motorDeReglas.validarYCalcular(saldoActual, monto);
                if (resultado.esExitoso()) {
                    actualizarSaldo(conn, id, resultado.getNuevoSaldo());
                    System.out.println("Actualización exitosa.");
                } else {
                    System.out.println("Error al procesar transacción.");
                }
            } else {
                System.out.println("Error al obtener saldo actual.");
            }
        } catch (SQLException e) {
            System.out.println("Error de base de datos: " + e.getMessage());
        }
    }

    private double obtenerSaldoActual(Connection conn, int id) {
        try (java.sql.Statement stmt = conn.createStatement();
             java.sql.ResultSet rs = stmt.executeQuery("SELECT saldo FROM cuentas WHERE id = " + id)) {
            if (rs.next()) {
                return rs.getDouble("saldo");
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener saldo actual: " + e.getMessage());
        }
        return -1;
    }

    private void actualizarSaldo(Connection conn, int id, double nuevoSaldo) {
        try (java.sql.PreparedStatement pstmt = conn.prepareStatement("UPDATE cuentas SET saldo = ? WHERE id = ?")) {
            pstmt.setDouble(1, nuevoSaldo);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al actualizar saldo: " + e.getMessage());
        }
    }
}
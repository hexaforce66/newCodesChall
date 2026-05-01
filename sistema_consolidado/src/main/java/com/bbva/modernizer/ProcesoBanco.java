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

    public void procesar() {
        try (Scanner scanner = new Scanner(new File("transacciones.txt"))) {
            Connection connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/banco_db", "usuario", "contraseña");
            while (scanner.hasNextLine()) {
                String[] transaccion = scanner.nextLine().split(",");
                int id = Integer.parseInt(transaccion[0]);
                double monto = Double.parseDouble(transaccion[1]);
                procesarTransaccion(id, monto, connection);
            }
            connection.close();
        } catch (FileNotFoundException e) {
            System.out.println("Archivo no encontrado");
        } catch (SQLException e) {
            System.out.println("Error de base de datos");
        }
    }

    private void procesarTransaccion(int id, double monto, Connection connection) {
        try {
            double saldoActual = obtenerSaldoActual(id, connection);
            Resultado resultado = motorDeReglas.validarYCalcular(saldoActual, monto);
            if (resultado.esExitoso()) {
                actualizarSaldo(id, resultado.getNuevoSaldo(), connection);
                System.out.println("Actualización exitosa");
            } else {
                System.out.println("Error al procesar transacción");
            }
        } catch (SQLException e) {
            System.out.println("Error de base de datos");
        }
    }

    private double obtenerSaldoActual(int id, Connection connection) throws SQLException {
        // Implementar consulta a base de datos para obtener saldo actual
        return 0;
    }

    private void actualizarSaldo(int id, double nuevoSaldo, Connection connection) throws SQLException {
        // Implementar actualización de saldo en base de datos
    }
}
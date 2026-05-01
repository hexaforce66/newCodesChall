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
        try (Connection conn = DriverManager.getConnection("jdbc:sqlite:Banco_DB.db")) {
            // Inicializar variables de conteo
            int totalTransacciones = 0;
            int totalExitosas = 0;
            int totalErrores = 0;
            double sumaMontos = 0.0;

            // Leer archivo de transacciones
            File archivoTransacciones = new File("transacciones.txt");
            try (Scanner scanner = new Scanner(archivoTransacciones)) {
                while (scanner.hasNextLine()) {
                    String[] transaccion = scanner.nextLine().split(",");
                    int id = Integer.parseInt(transaccion[0]);
                    double monto = Double.parseDouble(transaccion[1]);

                    // Procesar transacción
                    try {
                        procesarTransaccion(conn, id, monto);
                        totalExitosas++;
                        sumaMontos += monto;
                    } catch (Exception e) {
                        totalErrores++;
                        System.out.println("Error al procesar transacción " + id + ": " + e.getMessage());
                    }
                    totalTransacciones++;
                }
            }

            // Mostrar resumen final
            System.out.println("Resumen final del procesamiento:");
            System.out.println("Total transacciones leídas: " + totalTransacciones);
            System.out.println("Total procesadas con éxito: " + totalExitosas);
            System.out.println("Total con errores: " + totalErrores);
            System.out.println("Suma total procesada: " + sumaMontos);
        } catch (SQLException e) {
            System.out.println("Error al conectar a la base de datos: " + e.getMessage());
        } catch (FileNotFoundException e) {
            System.out.println("Archivo de transacciones no encontrado: " + e.getMessage());
        }
    }

    private void procesarTransaccion(Connection conn, int id, double monto) throws Exception {
        // Consultar saldo actual
        double saldoActual = consultarSaldo(conn, id);

        // Validar y calcular nuevo saldo
        AreaIntercambio areaIntercambio = new AreaIntercambio(saldoActual, monto);
        motorDeReglas.validarYCalcular(areaIntercambio);

        // Actualizar saldo en base de datos
        if (areaIntercambio.getResultado().equals("OK")) {
            actualizarSaldo(conn, id, areaIntercambio.getNuevoSaldo());
        } else {
            throw new Exception("Error al validar transacción");
        }
    }

    private double consultarSaldo(Connection conn, int id) throws SQLException {
        // Simular consulta a base de datos
        return 1000.0; // Saldo actual
    }

    private void actualizarSaldo(Connection conn, int id, double nuevoSaldo) throws SQLException {
        // Simular actualización en base de datos
    }
}
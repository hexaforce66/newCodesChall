public class AreaIntercambio {
    private double saldoActual;
    private double montoTransaccion;
    private double nuevoSaldo;
    private String resultado;

    public AreaIntercambio(double saldoActual, double montoTransaccion) {
        this.saldoActual = saldoActual;
        this.montoTransaccion = montoTransaccion;
    }

    public double getSaldoActual() {
        return saldoActual;
    }

    public void setSaldoActual(double saldoActual) {
        this.saldoActual = saldoActual;
    }

    public double getMontoTransaccion() {
        return montoTransaccion;
    }

    public void setMontoTransaccion(double montoTransaccion) {
        this.montoTransaccion = montoTransaccion;
    }

    public double getNuevoSaldo() {
        return nuevoSaldo;
    }

    public void setNuevoSaldo(double nuevoSaldo) {
        this.nuevoSaldo = nuevoSaldo;
    }

    public String getResultado() {
        return resultado;
    }

    public void setResultado(String resultado) {
        this.resultado = resultado;
    }
}
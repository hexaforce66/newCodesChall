public class Resultado {
    private boolean exitoso;
    private double nuevoSaldo;

    public boolean esExitoso() {
        return exitoso;
    }

    public void setExitoso(boolean exitoso) {
        this.exitoso = exitoso;
    }

    public double getNuevoSaldo() {
        return nuevoSaldo;
    }

    public void setNuevoSaldo(double nuevoSaldo) {
        this.nuevoSaldo = nuevoSaldo;
    }
}
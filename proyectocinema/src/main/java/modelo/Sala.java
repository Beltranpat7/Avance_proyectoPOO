package modelo;

import java.util.ArrayList;
import java.util.List;

public class Sala {
    private int numeroSala;
    private Sucursal sucursal;
    private List<Pelicula> peliculas;
    private List<String> horarios;
    private Asiento[][] asientos;
    private int entradasVendidas; // Nuevo registro de entradas vendidas

    public Sala(int numeroSala, Sucursal sucursal) {
        this.numeroSala = numeroSala;
        this.sucursal = sucursal;
        this.peliculas = new ArrayList<>();
        this.horarios = new ArrayList<>();
        this.asientos = new Asiento[8][5];
        this.entradasVendidas = 0; // Inicialmente no se ha vendido ninguna entrada
        inicializarAsientos();
    }

    //  películas y horarios
    public void agregarPelicula(Pelicula pelicula) {
        peliculas.add(pelicula);
    }

    public void agregarHorario(String horario) {
        horarios.add(horario);
    }

    // Inicialización de asientos
    private void inicializarAsientos() {
        for (int fila = 0; fila < asientos.length; fila++) {
            for (int columna = 0; columna < asientos[fila].length; columna++) {
                asientos[fila][columna] = new Asiento(fila, columna);
            }
        }
    }

    //  comprar entrada
    public boolean comprarEntrada(int fila, int columna) {
        if (fila >= 0 && fila < asientos.length && columna >= 0 && columna < asientos[fila].length) {
            Asiento asiento = asientos[fila][columna];
            if (!asiento.isOcupado()) {
                asiento.ocupar();
                return true;
            }
        }
        return false;
    }

    //  para vender una entrada
    public boolean venderEntrada(int fila, int columna) {
        if (comprarEntrada(fila, columna)) {
            entradasVendidas++; // Incrementa el contador de entradas vendidas
            return true;
        }
        return false;
    }

    //  buscar salas por nombre de sucursal
    public List<Sala> buscarPorNombreSucursal(String nombreSucursal) {
        List<Sala> salasEncontradas = new ArrayList<>();
        for (Sala sala : sucursal.getSalas()) {
            if (sala.getSucursal().getNombre().equalsIgnoreCase(nombreSucursal)) {
                salasEncontradas.add(sala);
            }
        }
        return salasEncontradas;
    }

    //  buscar salas por nombre de película
    public List<Sala> buscarSalasPorNombrePelicula(String nombrePelicula) {
        List<Sala> salasEncontradas = new ArrayList<>();
        for (Sala sala : sucursal.getSalas()) {
            for (Pelicula pelicula : sala.getPeliculas()) {
                if (pelicula.getNombre().equalsIgnoreCase(nombrePelicula)) {
                    salasEncontradas.add(sala);
                    break; // Romper el bucle interno cuando se encuentra la película
                }
            }
        }
        return salasEncontradas;
    }


    public int getNumeroSala() { return numeroSala; }
    public void setNumeroSala(int numeroSala) { this.numeroSala = numeroSala; }

    public Sucursal getSucursal() { return sucursal; }
    public void setSucursal(Sucursal sucursal) { this.sucursal = sucursal; }

    public List<Pelicula> getPeliculas() { return peliculas; }
    public void setPeliculas(List<Pelicula> peliculas) { this.peliculas = peliculas; }

    public List<String> getHorarios() { return horarios; }
    public void setHorarios(List<String> horarios) { this.horarios = horarios; }

    public Asiento[][] getAsientos() { return asientos; }

    public int getEntradasVendidas() {
        return entradasVendidas;
    }
}

package modelo;

import java.util.ArrayList;
import java.util.List;

public class Sucursal {
    private String nombre;
    private String gerente;
    private String direccion;
    private String telefono;
    private List<Sala> salas;

    public Sucursal(String nombre, String gerente, String direccion, String telefono) {
        this.nombre = nombre;
        this.gerente = gerente;
        this.direccion = direccion;
        this.telefono = telefono;
        this.salas = new ArrayList<>();
    }


    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getGerente() { return gerente; }
    public void setGerente(String gerente) { this.gerente = gerente; }

    public String getDireccion() { return direccion; }
    public void setDireccion(String direccion) { this.direccion = direccion; }

    public String getTelefono() { return telefono; }
    public void setTelefono(String telefono) { this.telefono = telefono; }

    public List<Sala> getSalas() { return salas; }
    public void setSalas(List<Sala> salas) { this.salas = salas; }


    public void agregarSala(Sala sala) {
        this.salas.add(sala);
    }
}

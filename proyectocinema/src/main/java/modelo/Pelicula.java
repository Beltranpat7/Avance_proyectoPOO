package modelo;

public class Pelicula {
    private String nombre;
    private String genero;
    private String clasificacion;
    private String formato;
    private double precioAdulto;
    private double precioTerceraEdad;

    // Getters
    public String getNombre() { return nombre; }
    public String getGenero() { return genero; }
    public String getClasificacion() { return clasificacion; }
    public String getFormato() { return formato; }
    public double getPrecioAdulto() { return precioAdulto; }
    public double getPrecioTerceraEdad() { return precioTerceraEdad; }

    // Setters
    public void setNombre(String nombre) { this.nombre = nombre; }
    public void setGenero(String genero) { this.genero = genero; }
    public void setClasificacion(String clasificacion) { this.clasificacion = clasificacion; }
    public void setFormato(String formato) { this.formato = formato; }
    public void setPrecioAdulto(double precioAdulto) { this.precioAdulto = precioAdulto; }
    public void setPrecioTerceraEdad(double precioTerceraEdad) { this.precioTerceraEdad = precioTerceraEdad; }
}



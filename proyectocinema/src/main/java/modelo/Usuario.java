package modelo;
public class Usuario {
    private String login;
    private String contraseña;
    private String nombreCompleto;
    private String numeroDUI;
    private String direccion;
    private String correoElectronico;
    private String numeroTelefono;


    public String getLogin() { return login; }
    public String getContraseña() { return contraseña; }
    public String getNombreCompleto() { return nombreCompleto; }
    public String getNumeroDUI() { return numeroDUI; }
    public String getDireccion() { return direccion; }
    public String getCorreoElectronico() { return correoElectronico; }
    public String getNumeroTelefono() { return numeroTelefono; }


    public void setLogin(String login) { this.login = login; }
    public void setContraseña(String contraseña) { this.contraseña = contraseña; }
    public void setNombreCompleto(String nombreCompleto) { this.nombreCompleto = nombreCompleto; }
    public void setNumeroDUI(String numeroDUI) { this.numeroDUI = numeroDUI; }
    public void setDireccion(String direccion) { this.direccion = direccion; }
    public void setCorreoElectronico(String correoElectronico) { this.correoElectronico = correoElectronico; }
    public void setNumeroTelefono(String numeroTelefono) { this.numeroTelefono = numeroTelefono; }
}



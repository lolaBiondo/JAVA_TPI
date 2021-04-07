package entities;

public class Persona {
	private String email; 
	private String contrase�a;
	private boolean admin;
	private int idPersona;
	private String apellido;
	private String nombre;
	private String telefono;
	private String direccion;
	private String dni;
	private float montoAPagar;
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public float getMontoAPagar() {
		return montoAPagar;
	}
	public void setMontoAPagar(float montoAPagar) {
		this.montoAPagar = montoAPagar;
	}
	
	
	
	
	public int getIdPersona() {
		return idPersona;
	}
	public void setIdPersona(int idPersona) {
		this.idPersona = idPersona;
	}
	public boolean isAdmin() {
		return admin;
	}
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContrase�a() {
		return contrase�a;
	}
	public void setContrase�a(String contrase�a) {
		this.contrase�a = contrase�a;
	}
	
	
	public String getDNINombreApellido() {
		String patron = "%s - %s - %s";
		String cadena = String.format(patron, dni, nombre, apellido);
		return cadena;
	}
	
}

package Persistencia;

import Logica.Persona;
import Logica.TipoDocumento;
import Logica.TipoUsuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 * Clase que permite administrar las personas en la base de datos
 * @author LEIDY
 * @version 1.0
 * @created 24-sep.-2015 8:54:09 a. m.
 */
public class PersonaDao {

	private ConexionDB conexionDB;
	private Connection conn;


	/**
	 * Metodo que permite actualizar informacion de una persona
	 * 
	 * @param documento
	 */
	public boolean actualizarPersona(int documento, String contrasenia){
		boolean actualizacion = false;
		Persona persona = this.consultarPersona(documento);
		if(persona != null){
			try {
				conn = conexionDB.getConexion();
				String queryUpdate = "UPDATE persona SET  contrasenia = ? "
						+ "WHERE documento_persona = ?";

				PreparedStatement ppStm = conn.prepareStatement(queryUpdate);

				ppStm.setString(1, contrasenia);
				ppStm.setInt(2, documento);

				ppStm.executeUpdate();

				//conn.close();
				actualizacion = true;

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				actualizacion = false;
			}
		}
		return actualizacion;
	}

	/**
	 * Metodo que permite obtener la informacion de una persona 
	 * ingresando por parametro el documento de identidad
	 * 
	 * @param documento
	 */
	public Persona consultarPersona(int documento){
		Persona persona = null;
		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM persona WHERE documento_persona = ?";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);
			ppStm.setInt(1, documento);

			ResultSet resultSet = ppStm.executeQuery();

			if(resultSet.next()){
				TipoDocumento tipoDocumento = conversionDocumento(resultSet.getString(2));

				TipoUsuario tipoUsuario = conversionUsuario(resultSet.getString(4));

				persona = new Persona();
				persona.setCedula(resultSet.getInt(1));
				persona.setTipoDocumento(tipoDocumento);
				persona.setNombre(resultSet.getString(3));
				persona.setTipoUsuario(tipoUsuario);
				persona.setContrasenia(resultSet.getString(5));
			}else{
				return persona;
			}
			//conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return persona;
	}

	/**
	 * Metodo que permite consultar el listado de todos los afiliados 
	 */
	public ArrayList<Persona> consultarPersonas(){
		ArrayList<Persona> listaPersonas = new ArrayList<Persona>();
		try {
			conn = conexionDB.getConexion();
			String querySearch = "SELECT * FROM persona";

			PreparedStatement ppStm = conn.prepareStatement(querySearch);

			ResultSet resultSet = ppStm.executeQuery();
			while(resultSet.next()) {

				listaPersonas.add(new Persona(resultSet.getInt(1), resultSet.getString(3), conversionDocumento(resultSet.getString(2)),
						conversionUsuario(resultSet.getString(4)), resultSet.getString(5)));
			}


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return listaPersonas;
	}

	/**
	 * Metodo que permite crear una persona afiliada al sindicato
	 * 
	 * @param persona
	 */
	public boolean crearPersona(Persona persona){
		try {
			conn = conexionDB.getConexion();
			String documento = conversionDeEnumDocumentoAIniciales(persona.getTipoDocumento());

			String tipoUsuario = conversionEnumUsuarioAIniciales(persona.getTipoUsuario());

			String queryInsertar = "INSERT INTO persona VALUES(?,?,?,?,?)";

			PreparedStatement ppStm = conn.prepareStatement(queryInsertar);
			ppStm.setInt(1, persona.getCedula());
			ppStm.setString(2, documento);
			ppStm.setString(3, persona.getNombre());
			ppStm.setString(4, tipoUsuario);
			ppStm.setString(5, persona.getContrasenia());

			ppStm.executeUpdate();
			//conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public TipoDocumento conversionDocumento(String documento){
		TipoDocumento tipoDocumento = null;
		if(documento.equalsIgnoreCase("CC")){
			tipoDocumento = TipoDocumento.Cedula;
		}
		else {
			if(documento.equalsIgnoreCase("RC")){
				tipoDocumento = TipoDocumento.RegistroNacimiento;
			}
			else{
				if(documento.equalsIgnoreCase("TI")){
					tipoDocumento = TipoDocumento.TarjetaIdentidad;
				}
			}
		}
		return tipoDocumento;
	}

	public TipoUsuario conversionUsuario(String usuario){
		TipoUsuario tipoUsuario = null;
		if(usuario.equalsIgnoreCase("Af")){
			tipoUsuario = TipoUsuario.Afiliado;
		}
		else {
			tipoUsuario = TipoUsuario.NoAfiliado;
		}
		return tipoUsuario;
	}

	public String conversionDeEnumDocumentoAIniciales(TipoDocumento tipoDocumento){
		String documento = "";
		if(tipoDocumento.toString().equalsIgnoreCase("Cedula")){
			documento = "CC";
		}
		else{
			if(tipoDocumento.toString().equalsIgnoreCase("TarjetaIdentidad")){
				documento = "TI";
			}
			else {
				documento = "RC";
			}
		}
		return documento;
	}

	public String conversionEnumUsuarioAIniciales(TipoUsuario tipoUsuario){
		String usuario = "";
		if(tipoUsuario.toString().equalsIgnoreCase("Afiliado")){
			usuario = "Af";
		}
		else {
			usuario = "NA";
		}
		return usuario;
	}

	public ConexionDB getConexionDB() {
		return conexionDB;
	}

	public void setConexionDB(ConexionDB conexionDB) {
		this.conexionDB = conexionDB;
	}
}
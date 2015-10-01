package Logica;

/**
 * Este enum contiene los tipos de documentos que se pueden
 * tener
 * @author LEIDY
 * @version 1.0
 * @updated 24-sep.-2015 7:55:07 a. m.
 */
public enum TipoDocumento {
	/**
	 * Documento tipo cedula que en la base de datos debe ser
	 * almacenado como CC
	 */
	Cedula,
	/**
	 * Tipo de documento tarjeta de Identidad que en la base de
	 * datos debe ser almacenada como TI
	 */
	TarjetaIdentidad,
	/**
	 * Documento de identidad de tipo registro de nacimiento que
	 * en la base de datos debe ser representado con RC
	 */
	RegistroNacimiento
}
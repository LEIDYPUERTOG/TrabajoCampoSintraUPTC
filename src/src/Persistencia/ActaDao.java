package Persistencia;

import Logica.Acta;

/**
 * Clase que permite adminsitrar las actas de la base de datos
 * @author LEIDY
 * @version 1.0
 * @created 24-sep.-2015 8:54:07 a. m.
 */
public class ActaDao {

	private ConexionDB conexion;

	public ActaDao() {
		conexion = new ConexionDB("root","");
	}

	/**
	 *
	 * Metodo que permite almacenar informacion de un acta en la base de datos sin
	 * tener la descripcio
	 * @param acta
	 *
	 */
	public boolean almacenarActa(Acta acta){

	}

}
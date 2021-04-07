package logic;
import data.*;
import entities.*;

import java.util.LinkedList;
public class PrestamoController {
private DataPrestamo dp;

public PrestamoController() {
	dp=new DataPrestamo();
}

public LinkedList<Prestamo> getAllPrestamos(){
	return dp.getAll();
}
public Prestamo addPrestamo(Prestamo p ) {
	return dp.add(p);
	
}
public Prestamo editPrestamo(Prestamo p ) {
	return dp.editPrestamo(p);
}
public Prestamo deletePrestamo(Prestamo p ) {
	return dp.deletePrestamo(p);
}

public LinkedList<LineaPrestamo> getLPByPrestamo(Prestamo p ){
	return dp.getLPByPrestamo(p);
			}

public Prestamo getByIdPrestamo(Prestamo p) {
	return dp.getById(p);
}

public void setEstado(Prestamo p, String e) {
	 dp.setEstado(p, e);
	}


	/*
	 * public int getCantLP(Prestamo p) { return dp.getCantLP(p); }
	 */
}

package servlets;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Ejemplar;
import entities.Libro;
import logic.LibroController;

@WebServlet("/listarEjemplaresServlet")
public class listarEjemplaresServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public listarEjemplaresServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LibroController ctrlLibro = new LibroController();
		int  ID  =  Integer.parseInt (request.getParameter("id"));
		Libro lib = new Libro();
		lib.setIdLibro(ID);
		Libro l = ctrlLibro.getByIdLibro(lib);
		LinkedList<Ejemplar> ejemplares = ctrlLibro.getEjByIdLibro(l);
		request.setAttribute("listaEjemplares", ejemplares);
		request.setAttribute("libro", l);
		request.getRequestDispatcher("listaEjemplares.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

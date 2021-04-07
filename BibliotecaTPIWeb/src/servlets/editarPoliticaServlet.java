package servlets;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.MyResult;
import entities.PoliticaPrestamo;
import logic.PoliticaPrestamoController;

/**
 * Servlet implementation class editarPoliticaServlet
 */
@WebServlet("/editarPoliticaServlet")
public class editarPoliticaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editarPoliticaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		PoliticaPrestamoController ctrlPP = new PoliticaPrestamoController();
		int ID = Integer.parseInt(request.getParameter("id"));
		PoliticaPrestamo pp = new PoliticaPrestamo();
		pp.setIdPoliticaPrestamo(ID);
		PoliticaPrestamo p = ctrlPP.getByIdPolitica(pp);
		
		request.setAttribute("politicaAEditar", p);
		request.getRequestDispatcher("editarPolitica.jsp").forward(request, response);
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		SimpleDateFormat formato = new SimpleDateFormat("yyyy-mm-dd");
		PoliticaPrestamoController ctrlPP = new PoliticaPrestamoController();
		PoliticaPrestamo pp = new PoliticaPrestamo();
		
		pp.setIdPoliticaPrestamo(Integer.parseInt(request.getParameter("id")));
		pp.setCantMaximaNoSocio(Integer.parseInt(request.getParameter("librosNoSocio")));
		pp.setCantMaximaSocio(Integer.parseInt(request.getParameter("librosSocio")));
		
		MyResult res = ctrlPP.editPolitica(pp);
		request.setAttribute("result", res);
		request.getRequestDispatcher("listarPoliticaServlet").forward(request, response);
		
	}

}

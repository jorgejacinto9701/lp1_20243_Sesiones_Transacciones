package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Logger;

import com.google.gson.Gson;

import dao.BoletaDao;
import entidad.Producto;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/buscaProducto")
public class ServletBuscaProducto extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger log = Logger.getLogger(ServletBuscaProducto.class.getName());

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		log.info("En ServletBuscaProducto");
		
		String filtro = request.getParameter("filtro");
		log.info("Filtro -> " + filtro);
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		BoletaDao dao = fabrica.getBoletaDao();
		
		ArrayList<Producto> lista = dao.consultaXNombre("%" + filtro + "%");
		
		Gson gson = new Gson();
		String json = gson.toJson(lista);

		response.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.println(json);

	}

}

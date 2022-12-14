
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package negocio.controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Daniel
 */
@WebServlet(name = "ServletNavegar", urlPatterns = {"/ServletNavegar", "/sobreNosotros", "/servicio", "/menu", "/reservar", "/equipo", "/contacto", "/testimonios"})
public class PrincipalNavegation extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            String path = request.getServletPath();
            if(path.equals("/sobreNosotros")){
                request.getRequestDispatcher("WEB-INF/principal/sobreNosotros.jsp").forward(request, response);
            }
            if(path.equals("/servicio")){
                request.getRequestDispatcher("WEB-INF/principal/servicio.jsp").forward(request, response);
            }
            if(path.equals("/menu")){
                request.getRequestDispatcher("WEB-INF/e-commerce/shop.jsp").forward(request, response);
            }
            if(path.equals("/reservar")){
                request.getRequestDispatcher("WEB-INF/principal/reservar.jsp").forward(request, response);
            }
            if(path.equals("/contacto")){
                request.getRequestDispatcher("WEB-INF/principal/contacto.jsp").forward(request, response);
            }
            if(path.equals("/equipo")){
                request.getRequestDispatcher("WEB-INF/principal/equipo.jsp").forward(request, response);
            }
            if(path.equals("/testimonios")){
                request.getRequestDispatcher("WEB-INF/principal/testimonios.jsp").forward(request, response);
            }
          
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

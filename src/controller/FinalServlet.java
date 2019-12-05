package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FinalServlet
 */
@WebServlet("/FinalServlet")
public class FinalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String msg = "";
		Double currentBank; 
		Double result= null;
		String url = "/final.jsp";
		
		currentBank = Double.parseDouble(request.getParameter("currentBank"));
		
		if(currentBank > 100.0) {
	     result = currentBank - 100.0; 
		 msg = "Congratulations! You are a winner! Good job quitting while you were ahead!";
		}
		 else if(currentBank < 100.00 && currentBank >= 0) {
			 msg = "You're losing but at least you're not going home empty handed. Try again.";
		     result = 100.00 - currentBank;  
		 }	
		 else if(currentBank < 0){
			 msg="You lost your shirt! You might want to think twice before wagering again.";
		     result = currentBank - 100.00; 
		 }
		
		   request.setAttribute("msg", msg);
		   request.setAttribute("currentBank", currentBank);
		   request.setAttribute("result", result);
		   // send control to the next component
		   RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		   dispatcher.forward(request, response);
			
	}

}

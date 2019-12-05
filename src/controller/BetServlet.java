package controller;


import java.io.IOException;
import java.text.NumberFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BetServlet
 */
@WebServlet("/BetServlet")
public class BetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BetServlet() {
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
		String url = "/bet.jsp";
		
		//String deckString = request.getParameter("deckString");
		Double currentBank = Double.parseDouble(request.getParameter("currentBank"));
		Double bet = Double.parseDouble(request.getParameter("bet"));
		int aCardVal = Integer.parseInt(request.getParameter("cardA")); 
		int bCardVal = Integer.parseInt(request.getParameter("cardB")); 
		int cCardVal = Integer.parseInt(request.getParameter("cardC")); 

		//String valSuitA = request.getParameter("valSuitA");
		//String valSuitB = request.getParameter("valSuitB");
		//String valSuitC = request.getParameter("valSuitC");
		
		if(aCardVal < bCardVal && cCardVal > bCardVal) {
			msg = "Nice. You won " + NumberFormat.getCurrencyInstance().format(bet) + " for this hand!";	
			currentBank = currentBank + bet; 
		}
		else if(aCardVal == bCardVal && bCardVal == cCardVal) {
			msg = "Nice you won " + NumberFormat.getCurrencyInstance().format(2*bet) + " for this hand!";
			currentBank = currentBank + (2*bet); 
	
		}
		else if(aCardVal == cCardVal && bCardVal != aCardVal) {
			msg = "Sorry. You lost " + NumberFormat.getCurrencyInstance().format(2*bet) + " for this hand!";
			currentBank = currentBank - (2*bet); 
		}
		else if(aCardVal == bCardVal | cCardVal == bCardVal) {
			msg = "Draw - you neither won nor lost this round."; 
			
		}
		else
		{
			msg = "Sorry. You lost " + NumberFormat.getCurrencyInstance().format(bet) + " for this hand!";
			currentBank = currentBank - bet; 
			url = "/bet.jsp";
			//if(currentBank < 0.0) {
				//url = "/final.jsp"; 
			//}
		}
	 
		
		   // add values to request object to pass to the destination
		   request.setAttribute("msg", msg);
		   request.setAttribute("currentBank", currentBank);
		   
		   // send control to the next component
		   RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		   dispatcher.forward(request, response);
			
		
	}

}

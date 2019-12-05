<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="java.text.NumberFormat" %>
  <% 
    String msg = (String) request.getAttribute("msg");
    Double currentBank = (Double) request.getAttribute("currentBank");
    Double result = (Double) request.getAttribute("result");
    result = currentBank - 100;;
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<p><%=msg %></p>
<p>
Starting Bank: 
</p>
<p>
$100.00
</p>
<p>Current Bank: </p> <p><%=NumberFormat.getCurrencyInstance().format(currentBank)%></p>
<p><%if(currentBank < 100)%>Loss: </p> <p><%if(currentBank >= 100)%>Winnings: </p>
<p><%=NumberFormat.getCurrencyInstance().format(result)%></p>

<form name="playAgain" action="DealServlet" method="post" >
<input type="submit" name="guessButton" value="Play Again!" />
<input type="hidden" name="currentBank" value="100.00" />
</form>

</body>
</html>
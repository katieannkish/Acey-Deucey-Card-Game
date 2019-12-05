<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@ page import="model.Deck" %>
<%@ page import="model.Card" %>
 <%@ page import="java.text.NumberFormat" %>

<%
String msg = (String) request.getAttribute("msg");
Double currentBank = (Double) request.getAttribute("currentBank");
Double bet = Double.parseDouble(request.getParameter("bet"));
int aCardVal = Integer.parseInt(request.getParameter("cardA")); 
int bCardVal = Integer.parseInt(request.getParameter("cardB")); 
int cCardVal = Integer.parseInt(request.getParameter("cardC")); 
String valSuitA = request.getParameter("valSuitA");
String valSuitB = request.getParameter("valSuitB");
String valSuitC = request.getParameter("valSuitC");
String deckString = request.getParameter("deckString");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Acey Duecey!</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<div>
<h1>
Acey Deucey!
</h1>
</div>

<p> <%=msg%></p>
<p>
Starting Bank: 
</p>
<p> $100.00</p>
<p>Current Bank: </p>   <p> <%=NumberFormat.getCurrencyInstance().format(currentBank)%></p>



<img src = "classic-cards/<%=valSuitA%>.png">
<img src = "classic-cards/<%=valSuitB%>.png">
<img src = "classic-cards/<%=valSuitC%>.png">


<form name="makeBet" action="DealServlet" method="post" >
<label>
Bet:
</label>
<input type="text" name="bet" value="10.0" />
<br>
<%if(currentBank > 0)%><input type="submit" name="guessButton" value="Play Again!" />

<input type="hidden" name="bet" value="<%= bet %>" />
<input type="hidden" name="currentBank" value="<%= currentBank %>" />

<input type="hidden" name="valSuitA" value="<%= valSuitA %>" />
<input type="hidden" name="valSuitB" value="<%= valSuitB %>" />
<input type="hidden" name="valSuitC" value="<%= valSuitC %>" />
<input type="hidden" name="deckString" value="<%= deckString %>" />
<input type="hidden" name="cardA" value="<%= aCardVal %>" />
<input type="hidden" name="cardB" value="<%= bCardVal %>" />
<input type="hidden" name="cardC" value="<%= cCardVal %>" />
</form>

<form name="quit" action="FinalServlet" method="post" >
<%if(currentBank > 0)%><input type="submit" name="guessButton" value="Quit" />
<input type="hidden" name="currentBank" value="<%= currentBank %>" />
</form>

<form name="quit" action="FinalServlet" method="post" >
<%if(currentBank < 0)%><input type="submit" name="guessButton" value="Quit" />
<input type="hidden" name="currentBank" value="<%= currentBank %>" />
</form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

    <%@ page import="model.Deck" %>
    <%@ page import="model.Card" %>
    <%@ page import="java.text.NumberFormat" %>
    <%

    double bet=10.0;
    double startingBank= 100.00;
    //double currentBank = 100.00;
    
   
 
  
     String deckString = (String) request.getAttribute("deckString"); 
     Double currentBank = (Double) request.getAttribute("currentBank"); 
     
     Deck deck = new Deck(deckString, false);
 	 deck.newDeck();
	 deck.shuffleDeck();
	 
	
	 Card aCard = new Card();
	 aCard = deck.getCard(0);
	

	 Card bCard = new Card();
	 bCard = deck.getCard(1);
	
	 
	 Card cCard = new Card();
	 cCard = deck.getCard(2);
	 
	 if(aCard.getValue() > cCard.getValue()){
		 aCard = deck.getCard(2);
		 cCard = deck.getCard(0);
		 }
	 
	 String valSuitA = aCard.toString(); 
	 String valSuitB = bCard.toString();
	 String valSuitC = cCard.toString(); 
	 int aCardVal = aCard.getValue();
	 int bCardVal = bCard.getValue(); 
	 int cCardVal = cCard.getValue();
	
	
    %>
   

<% String schedule = (String) request.getAttribute("startGame"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<div>
<h1>
Acey Deucey!
</h1>
</div>

<p>
Starting Bank: 
</p>
<p>
$100.00
</p>
<p>Current Bank: </p> <p><%=NumberFormat.getCurrencyInstance().format(currentBank)%></p>


<img src = "classic-cards/<%=valSuitA%>.png">
<img src = "classic-cards/b2fv.png">
<img src = "classic-cards/<%=valSuitC%>.png">

<form name="makeBet" action="BetServlet" method="post" >
<label>
Bet:
</label>
<input type="text" name="bet" value="10.0" />
<br>
<input type="submit" name="guessButton" value="Play!" />

<input type="hidden" name="bet" value="<%= bet %>" />

<input type="hidden" name="currentBank" value="<%= currentBank %>" />
<input type="hidden" name="valSuitA" value="<%= valSuitA  %>" />
<input type="hidden" name="valSuitB" value="<%= valSuitB %>" />
<input type="hidden" name="valSuitC" value="<%= valSuitC %>" />
<input type="hidden" name="deckString" value="<%= deckString %>" />
<input type="hidden" name="cardA" value="<%= aCardVal %>" />
<input type="hidden" name="cardB" value="<%= bCardVal %>" />
<input type="hidden" name="cardC" value="<%= cCardVal %>" /> 

</form>


<form name="pass" action="DealServlet" method="post" >
<input type="submit" name="guessButton" value="Pass" />
<input type="hidden" name="currentBank" value="<%= currentBank %>" />
</form>

<form name="quit" action="FinalServlet" method="post" >
<input type="submit" name="guessButton" value="Quit" />
<input type="hidden" name="currentBank" value="<%= currentBank %>" />
</form>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

double bet=10.0;
double startingBank= 100.00;
double currentBank = 100.00;

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Acey Deucey!</title>
<link rel="stylesheet" href="style.css" type="text/css">
</head>
<body>
<div>
<h1>
Acey Deucey!
</h1>

</div>

<p>
Play Acey Deucey! The simple, 3-card game where you bet on whether the middle card is between the two outer cards.
</p>
<p class = "cards">
<img src = "classic-cards/1S.png">
<img src = "classic-cards/1H.png">
</p>

<form name="startGame" action="DealServlet" method="post" >
<input type="submit" name="guessButton" value="Play!" />


<input type="hidden" name="bet" value="<%= bet %>" />
<input type="hidden" name="startingBank" value="<%= startingBank %>" />
<input type="hidden" name="currentBank" value="<%= currentBank %>" />
</form>

</body>
</html>
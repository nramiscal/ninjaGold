<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ninja Gold</title>
<!-- <link rel="stylesheet" type="text/css" href="style.css"> -->

<style>
*{
  margin: 0px;
  padding: 0px;
  font-family: sans-serif;
  /*outline: 1px dashed red;*/

}

.wrapper{
  width: 1000px;
  margin: 0px auto;
  /*display: inline-block;
  vertical-align: top;*/
  margin: 0px auto;
}
.total_gold{
  /*width: 500px;
  height: 50px;*/
  /*display: inline-block;
  vertical-align: top;*/
}

div .gold{
  width: 80px;
  height: 30px;
  border: 2px solid black;
  margin-bottom: 5px;
  margin-top: 5px;
}
.places{
  width: 1000px;
  /*height: 500px;*/
  /*display: inline-block;
  vertical-align: top;*/
  display: flex;
  justify-content: space-around;
}

.place{
  width: 250px;
  height: 250px;
  /*display: inline-block;
  vertical-align: top;*/

  border: 2px solid black;

}
div .activities{
  width: 1000px;
  height: 200px;
  border: 2px solid black;
  margin-top: 5px;
}

</style>
</head>
<body>
	<div class="wrapper">
      <div class="total_gold">
      <br>
      Your Gold:

      <div class="gold">${ sessionScope.total_gold }</div>
      </div>
      <div class="places">
        <div class="place">
          <h3>Farm</h3>
          (earns 10-20 golds)
          <form class="" action="/process_money" method="post">
         
            <input type="hidden" name="location" value="farm">
            <input type="submit" value="Find Gold!">
          </form>
        </div>
        <div class="place">
          <h3>Cave</h3>
          (earns 5-10 golds)
          <form class="" action="/process_money" method="post">
            
            <input type="hidden" name="location" value="cave">
            <input type="submit" value="Find Gold!">
          </form>
        </div>
        <div class="place">
          <h3>House</h3>
          (earns 2-5 golds)
          <form class="" action="/process_money" method="post">
            
            <input type="hidden" name="location" value="house">
            <input type="submit" value="Find Gold!">
          </form>
        </div>
        <div class="place">
          <h3>Casino</h3>
          (earns/takes 0-50 golds)
          <form class="" action="/process_money" method="post">
         
            <input type="hidden" name="location" value="casino">
            <input type="submit" value="Find Gold!">
          </form>
        </div>

      </div>
      <div class="">

      <br>
      Activities:

      <div class="activities">
<%-- 	<p>The length of the arraylist is ${sessionScope.activities.size()}</p>
        <p>${sessionScope.activities[0]}</p>
        <p>${sessionScope.activities[1]}</p>
        <p>${sessionScope.activities[2]}</p>
        <p>${sessionScope.activities[3]}</p> --%>
        
        <% ArrayList<String> activities = (ArrayList<String>) session.getAttribute("activities"); %>
        		<% for (int i = 0; i < activities.size(); i++){ %>
        			<p><%= activities.get(i) %></p>
        		
        <% } %> 



      </div>
      </div>
      <br>
      <a href="/reset">Reset</a>
      </div>
      
</body>
</html>
<%@ page language="java" import="java.util.*" pageEncoding="US-ASCII"%>
<%@ page import="java.text.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Hello noob</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
     <h1> Here is Nick. I'm a noob </h1>
     <form name = "goods" action = "index.jsp" method = "post">
     	Item:<input type = "text" name = "article"/><br>
     	Price:<input type = "text" name = "price" /><br>
     	<input type = "submit" name = "Submit"/>

     </form>
     <%!String newitem = null;
     	String newprice = null;
     	Object obj  = null;
     	int id = 0;
     	String st = null;
		String pr[];
		String it[];
		int sum = 0;
	%>
	 <% obj = session.getAttribute("id");
	 	id = 0;
	 	if (obj != null) {st = obj.toString();id = Integer.parseInt(st); }
		it = (String[]) session.getAttribute("items[]");
		pr = (String[]) session.getAttribute("prices[]");
		if (pr == null) pr = new String[100];
		if (it == null) it = new String[100];
		newprice = null;
		newitem = null;
		newprice = request.getParameter("price");
		newitem = request.getParameter("article");
		if((newitem != null) && (newprice != null)){
			id ++;
			it[id] = newitem;
			pr[id] = newprice;
		}
		session.setAttribute("items[]",it);
		session.setAttribute("prices[]",pr);
     	session.setAttribute("id", Integer.toString(id));
		

       %>
      <form>
     	<table>
     		<tr>
     			<td>Num</td>
     			<td>Articles</td>
     			<td>Price</td>
     		</tr>
     		<%
     			int i;
     			sum = 0;
     			for (i = 1;i <= id;i ++){
	     			out.print("<tr><td>"+i+"<td><td>"+it[i]+"<td><td>"+pr[i]+"<td><tr>");
	     			sum = sum + Integer.parseInt(pr[i]);
	     		}
     		 %>
     		 <tr>
     		 	<td>Sum:<%= sum %> </td>
     		 </tr>
     	</table>
     </form>
     <br>	
     <a href = "reset.jsp">Reset</a>
  </body>
</html>

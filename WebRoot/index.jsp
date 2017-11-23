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
     <h1> Hi.I'm Nick. Here's a stupid shopping cart! </h1>
     <form name = "goods" action = "index.jsp" method = "post">
     	Item:<input type = "text" name = "article" /><br>
     	Price:<input type = "text" name = "price" /><br>
     	<input type = "submit" name = "Submit"/>

     </form>

	 <% 
	 	String newitem = null;
     	String newprice = null;
     	int id = 0;
     	String st = null;
		String pr = null;
		String it = null;
		int sum = 0;
		int i;
		String prcookie,itcookie;
		Cookie[] cookies;
	 	cookies = request.getCookies();
	 	for (Cookie c:cookies){
	 		if (c.getName().equals("items")) {it = c.getValue();}
	 		if (c.getName().equals("prices")) {pr = c.getValue();}
	 		if (c.getName().equals("id")) {st = c.getValue();if(!st.equals(""))id = Integer.parseInt(st);}
	 		
	 	}
		newprice = null;
		newitem = null;
		newprice = request.getParameter("price");
		newitem = request.getParameter("article");
		if(!(newitem==null||newitem=="")&&!(newprice==""||newprice==null)){
			id ++;
			
			it = it + "," + newitem ;
			pr = pr + "," +newprice;
		}
		Cookie items = new Cookie("items", it);
		Cookie prices = new Cookie("prices", pr);
		Cookie ids = new Cookie("id", Integer.toString(id) );
		response.addCookie(items);
		response.addCookie(prices);
		response.addCookie(ids);
       %>
      <form>
     	<table>
     		<tr>
     			<td>Num</td>
     			<td>Articles</td>
     			<td>Price</td>
     		</tr>
     		<%
     		id = 0;
     		cookies = request.getCookies();
	 		for (Cookie c:cookies){
	 		if (c.getName().equals("items")) {it = c.getValue();}
	 		if (c.getName().equals("prices")) {pr = c.getValue();}
	 		if (c.getName().equals("id")) {st = c.getValue();if(!st.equals(""))id = Integer.parseInt(st);}
	 		
	 	}
     			sum = 0;
     			String a[] = new String[100];
     			String b[] = new String[100];
     			a = it.split(",");
     			b = pr.split(",");
     		
     			for (i = 1;i <= id;i ++){
	     			out.print("<tr><td>"+i+"<td><td>"+a[i]+"<td><td>"+b[i]+"<td><tr>");
	     			sum = sum + Integer.parseInt(b[i]);
	     		}
     		 %>
     		 <tr>
     		 	<td>Sum:<%=sum %> </td>
     		 </tr>
     	</table>
     </form>
     <br>	
     <a href = "reset.jsp">Reset</a>
  </body>
</html>

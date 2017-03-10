 

<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
       
    </head>
    <body>
        <%!
       
        public static ArrayList msglist = new ArrayList();
        %>
        <%
            Object text = request.getParameter("txtMessage");
            
            if(text!=null){
            msglist.add(";"+text);
            }
        %>
       <div>
            <%
            for(Object a:msglist)
            {
                String[] temp =a.toString().split(";");
                for(Object b:temp){
                    System.out.println(b);
                  %>
                    
                  <%=b%>
                  
            <%
                }
                %></div><br><%
            }
            %>
            
          
        

    </body>
</html>

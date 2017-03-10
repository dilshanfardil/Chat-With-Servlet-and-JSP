 

<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="_css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="_css/bootstrap.min.css">
        <link href="https://afeld.github.io/emoji-css/emoji.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="_css/styles.css">
        <title>JSP Page</title>

    </head>
    <body>
        <%!
            public ArrayList msglist = new ArrayList();
        %>
        <%
            String text = request.getParameter("txtMessage");
            String ida = request.getParameter("txtid");

            if (text != null && ida != null) {
                msglist.add(ida + ";" + text);
            }
            System.out.println("IDA : " + ida);
//            if (ida != null) {
            for (Object a : msglist) {
                System.out.println(a.toString());
                String[] temp = a.toString().split(";");
//                System.out.println(temp[0] + ida);
                System.out.println(temp[0]);
                if (temp[0].equals(ida)) {
        %>
        <div id="msgContainer-left">
            <!--<p  style="background-color: red">-->

                <%=temp[1]%>
            </div>
            <%
            } else {
            %>
        <div id="msgContainer-right">
            <!--<p >-->
                <%=temp[1]%>
            </div><br>
            <%
                    }
                }

            %>

    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../js/ajax.js" type="text/javascript"></script>
    </head>


    <script type="text/javascript">

        function getTime() {
            loadXMLAsynchroneously('POST','heureXML.jsp',null ,'heure');
            setTimeout("getTime()",5000);
        }
        
    </script>
    

    <body onload="getTime();">
        Heure magique : <div id="heure" ></div>
    </body>
</html>

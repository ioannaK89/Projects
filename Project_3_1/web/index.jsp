<%-- 
    Document   : index
    Created on : 5 Δεκ 2011, 9:47:35 μμ
    Author     : ioanna
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.w3c.dom.*, javax.xml.parsers.*,javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript">
        
                function loadXMLDoc(dname){
                        if (window.XMLHttpRequest)
                          {
                          xhttp=new XMLHttpRequest();
                          }
                        else // IE 5/6
                          {
                          xhttp=new ActiveXObject("Microsoft.XMLHTTP");
                          }
                        xhttp.open("GET",dname,false);
                        xhttp.send();
                        xmlDoc=xhttp.responseXML; 
                        return xmlDoc;
                }
                function initializeTable(){     //function for doing parsing from Price.xml file
                    xmlDoc=loadXMLDoc("Prices.xml");
                    x=xmlDoc.getElementsByTagName("Price");
                    y=x[0].childNodes[0];
                    document.getElementById("c1").innerHTML=y.nodeValue;
                    document.getElementById("cafe").value=y.nodeValue;
                    y=x[1].childNodes[0];
                    document.getElementById("c2").innerHTML=y.nodeValue;
                    document.getElementById("sugar").value=y.nodeValue;
                    y=x[2].childNodes[0];
                    document.getElementById("c3").innerHTML=y.nodeValue;
                    document.getElementById("water").value=y.nodeValue;
                }

                function createCookie(name,value,days) {
                    if (days) {
                           var date = new Date();
                            date.setTime(date.getTime()+(days*24*60*60));
                            var expires = "; expires="+date.toGMTString();
                    }
                    else var expires = "";
                    document.cookie = name+"="+value+expires+"; path=/";
                }
                
                function createC(){
                    var table = new String(document.cookie);
                    table=table.split("; ");
                   
                    for(i=0;i<table.length;i++){
                        if(table[i].split("=")[1]!=null){
                            createCookie("c",document.getElementById("cafeName").value,365);
                               
                          }
                        else{
                            createCookie("c",0.0,365); 
                        }
                        if(table[i].split("=")[1]!=null){
                            createCookie("s",document.getElementById("sugarName").value,365);
                        }
                        else{
                            createCookie("s",0.0,365);
                        }
                        if(table[i].split("=")[1]!=null){
                            createCookie("w",document.getElementById("waterName").value,365);
                        }
                        else{
                            createCookie("w",0.0,365);
                        }
                        
                        if(table[i].split("=")[1]!=null){
                            var totalC= new String();
                            totalC=document.getElementById("cafeName").value*document.getElementById("c1").innerHTML;
                            createCookie("totalc",totalC,365);
                        }
                        else{
                            createCookie("totalc",0.0,365);
                        }

                       
                       
                        var totalS= new String();
                        totalS=document.getElementById("sugarName").value*document.getElementById("c2").innerHTML;
                        createCookie("totals",totalS,365);
                        
                        var totalW= new String();
                        totalW=document.getElementById("waterName").value*document.getElementById("c3").innerHTML;
                        createCookie("totalw",totalW,365);
                        
                        var total= new String();
                        total=totalC + totalS + totalW;
                        createCookie("total",total,365);

                        break;
                    }
                   
                }
                
                function checkCookie()
                {
                    var table = new String(document.cookie);
                    table=table.split("; ");
               
                for(i=0;i<table.length;i++){
                    if(table[i].split("=")[0]=="c"){
                       document.getElementById("cafeName").value=table[i].split("=")[1]; 
                    }
                    else if(table[i].split("=")[0]=="s"){
                       document.getElementById("sugarName").value=table[i].split("=")[1];
                    }
                    else if(table[i].split("=")[0]=="w"){
                       document.getElementById("waterName").value=table[i].split("=")[1];
                    }
                    else if(table[i].split("=")[0]=="totalc"){  
                       document.getElementById("cafeTotal").innerHTML=table[i].split("=")[1];                     
                    }
                    else if(table[i].split("=")[0]=="totals"){
                       document.getElementById("sugarTotal").innerHTML=table[i].split("=")[1];
                    }
                    else if(table[i].split("=")[0]=="totalw"){
                       document.getElementById("waterTotal").innerHTML=table[i].split("=")[1];                        
                    }
                    else if(table[i].split("=")[0]=="total"){
                       document.getElementById("totalRes").innerHTML="Total:"+table[i].split("=")[1];
                          
                    }
               }
              }

</script>
        <title>Shopping Cart</title>
        <style type="text/css">
#MainPanel
{
	position:relative;
	width:auto;
	height:auto;
	border-style:solid;
        margin-top:100px;
        margin-bottom:10px;
        margin-right:550px;
        margin-left:550px;
        border-style:solid;
        border-width:4px;
        border-color:#A6007C;
        background-color:#FFFF99;
        border-radius:2em;
}

#RequestButtons
{
	position:relative;
        top:50px;
}
#codeButton
{
	position:relative;
	top:-22px;
	left:50px;
}
#submitButton
{
	position:relative;
	top:40px;
}
#title
{
  font-size: 2em;
  font-weight: bold;
  color: #777777;
  margin-top:100px;
  margin-bottom:50px;
  margin-right:650px;
  margin-left:650px;
  border-style:solid;
  border-width:4px;
  border-color:#A6007C;
  background-color:#FFFF99;
  border-radius:2em;
}
 
table,td,th
{
border:1px solid black;
}
td
{
text-align:right;
}

</style>
    
    </head>
    <body onload="initializeTable(); checkCookie();"> 

        <div id="title" align="center">Shopping Cart</div>
       
         <form action="" method="post" onsubmit="createC()">
           <div id="MainPanel" align="center">
            <table border="1" id="priceTable" >
                <tr>
                    <th>Item</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
                <tr>
                    <td>Cafe</td>
                    <td id="c1"></td>                       
                    <td><input type="text" name="CafeQuantity" id ="cafeName" value="<%if(request.getParameter("CafeQuantity")!=null){%><%= request.getParameter("CafeQuantity")%><%}else{%><%=0.0%><%}%>"/></td>       
                    <td id="cafeTotal"><%
                    if(request.getParameter("CafeQuantity")!=null){
                        double val1= Double.valueOf(request.getParameter("CafeQuantity")); 
                        double val2= Double.valueOf(request.getParameter("cafeVal"));
                        out.print(String.valueOf(val1*val2));
                    }                          
                %></td>
                </tr>
                <tr>
                    <td>Sugar</td>
                    <td id="c2"></td>
                    <td><input type="text" name="SugarQuantity" id ="sugarName" value="<%if(request.getParameter("SugarQuantity")!=null){%><%= request.getParameter("SugarQuantity")%><%}else{%><%=0.0%><%}%>"/></td>
                    <td id="sugarTotal" >
                        <%
                    if(request.getParameter("SugarQuantity")!=null){
                        double val3= Double.valueOf(request.getParameter("SugarQuantity")); 
                        double val4= Double.valueOf(request.getParameter("sugarVal"));
                        out.print(String.valueOf(val3*val4));
                    }                           
                %>
                    </td>
                </tr>
                <tr>
                    <td>Water</td>
                    <td id="c3"></td>
                    <td><input type="text" name="WaterQuantity" id="waterName" value="<%if(request.getParameter("WaterQuantity")!=null){%><%= request.getParameter("WaterQuantity")%><%}else{%><%=0.0%><%}%>"/></td>
                    <td id="waterTotal">
                        <%
                    if(request.getParameter("WaterQuantity")!=null){
                        double val5= Double.valueOf(request.getParameter("WaterQuantity")); 
                        double val6= Double.valueOf(request.getParameter("waterVal"));
                        out.print(String.valueOf(val5*val6));
                    }                           
                %>
                    </td>
                </tr>
             </table>
             <div id="totalRes">Total:<%if(request.getParameter("CafeQuantity")!=null && request.getParameter("SugarQuantity")!=null && request.getParameter("WaterQuantity")!=null){
                  double val1= Double.valueOf(request.getParameter("CafeQuantity")); 
                  double val2= Double.valueOf(request.getParameter("cafeVal"));
                  double val3= Double.valueOf(request.getParameter("SugarQuantity")); 
                  double val4= Double.valueOf(request.getParameter("sugarVal"));
                  double val5= Double.valueOf(request.getParameter("WaterQuantity")); 
                  double val6= Double.valueOf(request.getParameter("waterVal"));
                  out.print(val1*val2+val3*val4+val5*val6);}%> </div>
          </div>
          <input type="hidden" name="cafeVal" id="cafe" value="0"/>
          <input type="hidden" name="sugarVal" id="sugar" value="0"/>
          <input type="hidden" name="waterVal" id="water" value="0"/>
          <div id="submitButton" align="center">    
              <input type="submit" value="Submit"/>
          </div>
        </form>
       
           <div id="RequestButtons" align="center">
          <form name="infoform" >
            <input type="hidden" name="requestName" value="InfoRequest"/>
            <input id="info" type="button" value="Info" onClick="parent.location='http://ioak89.wordpress.com/2011/12/11/project3_1/'"/>
            <input type="hidden" name="requestName" value="CodeRequest"/>
            <input id="code" type="button" value="Source Code" onClick="parent.location='http://dl.dropbox.com/u/22556225/SourceCode.rar'"/>
         </form>
      </div>
    </body>
</html>

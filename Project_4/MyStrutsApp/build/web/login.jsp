<%-- 
    Document   : Basket
    Created on : 23 Δεκ 2011, 8:53:50 μμ
    Author     : ioanna
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored ="false" %> 
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
  
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping Cart</title>
    </head>
   
    <body>
      
        <div id="title" align="center">Shopping Cart</div>
        <html:form action="/login">
                <logic:present cookie="cafeCookie">
                        <%
                        String C_current_value = "0.0";
           
                        if(request.getParameter("cafeQuantity")==""){
                            C_current_value = "0.0";
                        }
                        else if(request.getParameter("cafeQuantity") != null){
                            if(Double.parseDouble(request.getParameter("cafeQuantity")) < 0.0){
                                C_current_value = "0.0"; 
                            }
                            else{
                                C_current_value = request.getParameter("cafeQuantity");
                            }
                        }
                        else{
                            for(int i=0;i<request.getCookies().length;i++){
                                if(request.getCookies()[i].getName().equals("cafeCookie")){
                                    C_current_value = request.getCookies()[i].getValue();
                                    
                                    break;
                                }                                
                          }         
                        }
                        %>
                        <bean:define id="oldCafe" value='<%=C_current_value%>'/>
                       
                </logic:present>
                <logic:present cookie="sugarCookie">
                    <%
                     String S_current_value = "0.0";
                    
                     if(request.getParameter("sugarQuantity")==""){
                        S_current_value = "0.0"; 
                     }
                     else if(request.getParameter("sugarQuantity")!= null){
                       if(Double.parseDouble(request.getParameter("sugarQuantity")) < 0.0){
                            S_current_value = "0.0"; 
                       }
                       else{
                            S_current_value = request.getParameter("sugarQuantity");
                       }
                     }
                     else{
                            for(int i=0;i<request.getCookies().length;i++){
                                if(request.getCookies()[i].getName().equals("sugarCookie")){
                                    S_current_value = request.getCookies()[i].getValue();
                                    break;
                                }                                
                            }                 
                     }
                    %>
                    <bean:define id="oldSugar" value='<%=S_current_value%>'/>
                </logic:present>
                <logic:present cookie="waterCookie">
                    <%
                        String W_current_value="0.0";

                        if(request.getParameter("waterQuantity")==""){
                            W_current_value = "0.0";
                        }
                        else if(request.getParameter("waterQuantity")!= null){
                            if(Double.parseDouble(request.getParameter("waterQuantity")) < 0.0){
                                W_current_value = "0.0"; 
                            }
                            else{
                                W_current_value = request.getParameter("waterQuantity");
                            }
                        }
                        else{
                            for(int i=0;i<request.getCookies().length;i++){
                                if(request.getCookies()[i].getName().equals("waterCookie")){
                                    W_current_value = request.getCookies()[i].getValue();
                                    break;
                                }                                
                            }
                        }
                    %>
                    <bean:define id="oldWater" value='<%=W_current_value%>'/>

                </logic:present>
                <logic:notPresent cookie="cafeCookie">
                    <bean:define id="oldCafe" name="LoginForm" property="cafeQuantity"/>
                </logic:notPresent>
               <logic:notPresent cookie="sugarCookie">
                    <bean:define id="oldSugar" name="LoginForm" property="sugarQuantity"/>
                </logic:notPresent> 
                <logic:notPresent cookie="waterCookie">
                    <bean:define id="oldWater" name="LoginForm" property="waterQuantity"/>
                </logic:notPresent> 
   
            <table border="0">
                <tr><td><div><bean:write name="LoginForm" property="error" filter="false"/></div></td></tr>
                <thead> 
                        <th>Item</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>                 
                </thead>
                <tbody>
                    
                     <tr>
                            <td>Cafe</td>
                            <td><bean:write name="LoginForm" property="cafePrice" /></td>
                            <td><html:text property="cafeQuantity" value="${oldCafe}"/></td>
                            <td><bean:write name="LoginForm" property="totalC" /></td>
                      </tr>
                      <tr>
                            <td>Sugar</td>
                            <td><bean:write name="LoginForm" property="sugarPrice" /></td>
                            <td><html:text property="sugarQuantity" value="${oldSugar}"/></td>
                            <td><bean:write name="LoginForm" property="totalS" /></td>
                      </tr>
                      <tr>
                            <td>Water</td>
                            <td><bean:write name="LoginForm" property="waterPrice" /></td>
                            <td><html:text property="waterQuantity" value="${oldWater}"/></td>
                            <td><bean:write name="LoginForm" property="totalW" /></td>
                      </tr>
                      <tr>
                            <td>Total</td>
                            <td></td>
                            <td></td>
                            <td><bean:write name="LoginForm" property="total" /></td>
                      </tr>
                    
            </tbody>
            
        </table>
        <div align="center" id="submitButton">         
              <html:submit value="Submit" />
        </html:form> 
        </div>        
        <div id="RequestButtons" align="center">
          <form name="infoform" >
            <input type="hidden" name="requestName" value="InfoRequest"/>
            <input id="info" type="button" value="Info" onClick="parent.location='http://ioak89.wordpress.com/2012/01/10/project-4/'"/>
            <input type="hidden" name="requestName" value="CodeRequest"/>
            <input id="code" type="button" value="Source Code" onClick="parent.location=''"/>
         </form>
      </div>
    </body>   
</html>

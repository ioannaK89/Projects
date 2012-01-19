/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author ioanna
 */
public class LoginAction extends org.apache.struts.action.Action {

    private static final String SUCCESS = "success";
    private final static String FAILURE = "failure";


    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
    @Override
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
            LoginForm formBean = (LoginForm) form;
            double Wquantity = formBean.getWaterQuantity();
            double Squantity = formBean.getSugarQuantity();
            double Cquantity = formBean.getCafeQuantity();
            String cafeString = String.valueOf(Cquantity);
            String sugarString = String.valueOf(Squantity);
            String waterString = String.valueOf(Wquantity);
            String cafeQString = String.valueOf(formBean.getTotalC());
            String sugarQString = String.valueOf(formBean.getTotalS());
            String waterQString = String.valueOf(formBean.getTotalW());
            
            
            if (Wquantity <0 || Squantity<0 || Cquantity<0 )   // check if user give negative value
            {   
                if(Wquantity<0){formBean.setWaterQuantity(0.0);}
                if(Squantity<0){formBean.setSugarQuantity(0.0);}
                if(Cquantity<0){formBean.setCafeQuantity(0.0);}
                formBean.setError();
                return mapping.findForward(FAILURE);
            }
            else
            {   
                Cookie[] cook = request.getCookies();
                
                boolean find = false;
                boolean find2 = false;
                boolean find3 = false;
           
                
                for(int i=0;i<cook.length;i++){
                    if( cook[i].getName().equals("cafeCookie")){
                        find = true;
                    }
                    else if(cook[i].getName().equals("sugarCookie")){
                        find2 = true;
                    }
                    else if(cook[i].getName().equals("waterCookie")){
                        find3 = true;
                    }
                    
                }
                
                if(!find){
                        Cookie ck=new Cookie("cafeCookie",cafeString);
                        ck.setMaxAge(60*30);
                        response.addCookie(ck);
                       
                }
                else{
                    for(int i=0;i<cook.length;i++){
                        if( cook[i].getName().equals("cafeCookie") && !cafeString.equals("0.0") ){
                            cook[i].setValue(cafeString);
                            response.addCookie(cook[i]);  
                            break;
                        }
                    }
                    
                }

                if(!find2){
                        Cookie ck2=new Cookie("sugarCookie",sugarString);
                        ck2.setMaxAge(60*30);
                        response.addCookie(ck2);
                        
                }
                else{
                    for(int i=0;i<cook.length;i++){
                        if( cook[i].getName().equals("sugarCookie") && !sugarString.equals("0.0")){
                            cook[i].setValue(sugarString);
                            response.addCookie(cook[i]);
                            break;
                        }
                    }

                }
   
                  if(!find3){
                        Cookie ck3=new Cookie("waterCookie",waterString);
                        ck3.setMaxAge(60*30);
                        response.addCookie(ck3);

                }
                else{
                    for(int i=0;i<cook.length;i++){
                        if( cook[i].getName().equals("waterCookie") && !waterString.equals("0.0")){
                            cook[i].setValue(waterString);
                            response.addCookie(cook[i]);
                            break;
                        }
                    }

                }
               return mapping.findForward(SUCCESS);
                
            }
            
        
        
    }
}

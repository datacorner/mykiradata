<%-- 
    Document   : Spots here
    Created on : 5 mars 2016, 09:03:52
    Author     : benoit CAYLA
--%>

<%@tag description="Spots here" pageEncoding="UTF-8" import="com.joy.Joy, com.joy.mvc.Action, com.dgm.beans.UITaglibSpotDataBean, com.joy.common.JoyParameter" %>

<%@attribute name="tag"%>
<%@attribute name="panelcolor"%>
<%@attribute name="panelicon"%>
<%@attribute name="classbloc"%> <!-- example: col-lg-3 col-md-6 -->
<%
    
    try {
        Action actionform = (Action)Joy.CURRENT_ACTION(request);
        UITaglibSpotDataBean spotdata = (UITaglibSpotDataBean)actionform.getFormSingleEntry(tag).getValue();
        
        String myglyphe = "";
        JoyParameter glypheParam = Joy.PARAMETERS().getParameter("ApplicationIconsBSGlyphe").get(panelicon);
        if (glypheParam != null) 
            myglyphe = (String)glypheParam.getValue();
%>
<%-- Texts top: --%>

<div class="<%= classbloc %>"  style="padding: 0 0 0 0;">
    <div class="panel <%= panelcolor %>">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-3"><i class="fa <%= myglyphe %> fa-5x"></i></div>
                <div class="col-xs-9 text-right">
                    <a href="<%= spotdata.getLinkURL() %>">
                    <div class="huge"><%= spotdata.getBigshorttext() %></div>
                    <div><%= spotdata.getLittlelongtext() %></div>
                    </a>
                </div>
            </div>
        </div>

    </div>
</div>
<%
    } catch (Exception e) { 
%>
    <!-- Error !! -->
<%
    }
%>
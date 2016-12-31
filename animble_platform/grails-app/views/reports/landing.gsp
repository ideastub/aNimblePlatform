<%@ page import="com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper;com.nimble.domain.report.Report; com.nimble.controller.report.ReportsController;" %>

<g:set var="viewHelper" value="${request.viewHelper}" />

<div dojoType="dijit.layout.SplitContainer"
        orientation="horizontal"
        sizerWidth="7"
        activeSizing="true"
        style="float:left;background-color: #808080;height:80%;width:95%;">

        <div dojoType="dijit.layout.ContentPane" sizeMin="30" sizeShare="10" preload="true" preventCache="true"
            id="ReportTree" style="width:20%;height:100%;float:left;
            <% if(request.viewHelper.includeParams?.location?.equals("REPORTS")){ %>
            background-color: #808080;border:0px;
            <% } %>
            ">
			<% println(g.include(view:'/reports/menu.gsp', params:params)) %>
        </div>

        <div id="ReportView" dojoType="dijit.layout.ContentPane"
        	preventCache=true" sizeMin="70" sizeShare="40" style="border:0px;width:75%;float:left;
            <% if(request.viewHelper.includeParams?.location?.equals("REPORTS")){ %>
            background-color: #808080;border:0px;
            <% } %>
        	">
            &nbsp;
        </div>

</div>
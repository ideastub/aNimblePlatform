<%@ page import="com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper;com.nimble.domain.report.Report; com.nimble.controller.report.ReportsController;" %>

<g:set var="viewHelper" value="${request.viewHelper}" />

<html>
<head>
</head>
<body>

<div id="report_menu" style="background-color: #808080;float:left;">

<% 
if(request.viewHelper.includeParams?.location?.equals("REPORTS")){
	viewHelper.setSectionTitle('List Reports')
	println(g.include(view:'/layouts/header_block.gsp', params:params))
}
%>

		<div dojoType="dojo.data.ItemFileReadStore"
		     url="/${grailsApplication.metadata['app.name']}/reports/menu_tree?${System.currentTimeMillis()}&location=${request.viewHelper.includeParams?.location}" jsid="reportStore" preventCache="true"></div>
		<div dojoType="dijit.Tree" store="reportStore" labelAttr="name"
		     id="ReportsTree" label="Reports" preventCache="true" style="background-color: #FFFFFF;width:100%;">
		     <script type="dojo/method" event="onClick" args="item">
		        var thisURL = "/${grailsApplication.metadata['app.name']}/reports/show/"+  reportStore.getIdentity(item) + "?location=${request.viewHelper.includeParams?.location}";
		        if (reportStore.getIdentity(item) != null) {
	    			dijit.byId("ReportView").setHref(thisURL);
		        }
		    </script>
		</div>

<%
if(request.viewHelper.includeParams?.location?.equals("REPORTS")){
	println(g.include(view:'/layouts/footer_block.gsp', params:params))
}
%>
</div>
</body>
</html>
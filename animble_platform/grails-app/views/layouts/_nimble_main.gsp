<%@ page import="com.nimble.controller.project.*; com.nimble.controller.artifact.*; com.nimble.domain.artifact.*;com.nimble.utils.view.ViewHelper;grails.plugins.springsecurity.SecurityTagLib;" %>
<g:set var="viewHelper" value="${request.viewHelper}" />


<html>
<head>
<title>aNimble Platform</title>
    
<link rel="stylesheet" type="text/css" href="/${grailsApplication.metadata['app.name']}/js/dojoroot/dijit/themes/tundra/tundra.css" />    
<link rel="stylesheet" type="text/css" href="/${grailsApplication.metadata['app.name']}/js/dojoroot/dojo/resources/dojo.css" />
<link rel="stylesheet" type="text/css" href="/${grailsApplication.metadata['app.name']}/css/main.css" />
<script type="text/javascript" src="/${grailsApplication.metadata['app.name']}/js/dojoroot/dojo/dojo.js" djConfig="parseOnLoad: true"></script>
<script type="text/javascript">
   dojo.require("dojo.parser");
   dojo.require("dijit.layout.BorderContainer");
   dojo.require("dijit.layout.SplitContainer");
   dojo.require("dijit.layout.ContentPane");
   dojo.require("dijit.layout.TabContainer");
   dojo.require("dojo.data.ItemFileReadStore");
   dojo.require("dojo.data.ItemFileWriteStore");
   dojo.require("dijit.Tree");
   dojo.require("dijit.Menu");
   dojo.require("dijit.form.Form");
   dojo.require("dijit.form.Button");
   dojo.require("dijit.Tooltip");
   dojo.require("dijit.form.TextBox");
   dojo.require("dijit.form.CheckBox")
   dojo.require("dijit.form.DateTextBox");
   dojo.require("dijit.tree.dndSource");   
   dojo.require("dojo.store.JsonRest");   
</script>
<script type="text/javascript" src="/${grailsApplication.metadata['app.name']}/js/tiny_mce/tiny_mce.js"></script>
<script type="text/javascript" src="/${grailsApplication.metadata['app.name']}/js/jscalendar/mootools.v1.11.js"></script>
<script type="text/javascript" src="/${grailsApplication.metadata['app.name']}/js/jscalendar/DatePicker.js"></script>
<script type="text/javascript" src="/${grailsApplication.metadata['app.name']}/js/application.js"></script>
<script type="text/javascript">
	var serverURL = "/${grailsApplication.metadata['app.name']}";			
</script>


</head>


<body class="tundra">

<div id="logo_and_login" style="height:35px;width:100%;border-color:black;padding-right:10px;padding-left:10px;padding-bottom:0px;">

<table border="0" style="width:95%;padding-right:10px;padding-left:10px;" height="35px" cellpadding="0" cellspacing="0">
<tr>

<td width="50%">
<img src="/${grailsApplication.metadata['app.name']}/images/logo_magneto.png" border="0"/>
</td>

<td align="right" width="50%">
<span class="login">
<sec:ifLoggedIn>
Logged in as: <sec:username/>
</sec:ifLoggedIn>
<sec:ifNotLoggedIn>
<g:link controller='login' action='auth'>Login</g:link>
</sec:ifNotLoggedIn>
</span>

<span class="separator">
&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
</span>

<span class="logout">
<g:link controller='logout'>Logout</g:link>
</span>

</td>
</tr>
</table>
</div>

<div id="top_nav" style="padding-right:10px;padding-left:10px;top:0px;">

<div id="Menu" class="menu_bar" dojoType="dijit.layout.ContentPane" style="width: 100%;">
<%
println(g.include(view:'/menu.gsp'))
%>
</div>    

<div id="BreadCrumbs" class="breadcrumbs_background" dojoType="dijit.layout.ContentPane"
    preventCache=true" style="width: 100%; height: 25px; background-image:url(/${grailsApplication.metadata['app.name']}/images/breadcrumbs_background.png);padding-top:4px;padding-bottom:4px;">
    		&nbsp;
</div>

</div>    		

<br>

<div dojoType="dijit.layout.ContentPane" id="Landing" style="width: 100%; height: 85%;padding-right:10px;padding-left:10px;overflow:visible;" preventCache=true" >

<%
	if (viewHelper.includeView != null){
		if (viewHelper.includeParams != null){
%>
        <g:include view="${viewHelper.includeView}" params="${viewHelper.includeParams}"/>
<%
		} else {
%>
        <g:include view="${viewHelper.includeView}" />
<%        
    	}
    } else if (viewHelper.includeController != null && viewHelper.includeAction != null){
		if (viewHelper.includeId != null){
%>
	<g:include controller="${viewHelper.includeController}" action="${viewHelper.includeAction}" id="${viewHelper.includeId}" />		
<%
		} else {
%>
        <g:include controller="${viewHelper.includeController}" action="${viewHelper.includeAction}" params="${viewHelper.includeParams}"/>        
<%
		}
	}
%>



</div>

<div dojoType="dijit.layout.ContentPane" id="modal_window" style="position:absolute;left:0px;top:0px;height:100%;width:100%;z-index:-1;"></div>

</body>
</html>
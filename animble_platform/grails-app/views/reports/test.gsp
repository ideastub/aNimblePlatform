<%@ page import="com.nimble.domain.project.Project;com.nimble.utils.domain.report.ReportHelper;com.nimble.utils.domain.view.*;com.nimble.utils.view.SelectListTransport;" %>
<g:set var="reportHelper" value="${new ReportHelper()}" />

<script language="javascript" type="text/javascript">
function showMsg()		{
document.getElementById("msg").innerHTML = "Finished";
}
</script>

<table>
<tr>
<td>

      <script type="text/javascript">
        function submit_test2(link) {
          //link.parentNode._format.value = link.title;
          document.getElementById("msg").innerHTML = link.parentNode.action + "?_name=&_format=" + link.title + "&_file="+ link.parentNode._file.value + "&product_ref_id=" + link.parentNode.product_ref_id.value
          document.getElementById("reportFrame").src = link.parentNode.action + "?_name=&_format=" + link.title + "&_file="+ link.parentNode._file.value + "&product_ref_id=" + link.parentNode.product_ref_id.value;
          //document.getElementById("reportFrame").src = 'http://www.google.com';
          //return false;
        }
      </script>
        <form class="jasperReport" name="test2" action="/${grailsApplication.metadata['app.name']}/jasper/">
<input type="hidden" name="_format" />
<input type="hidden" name="_name" value="" />
<input type="hidden" name="_file" value="test2" />

<g:select name="product_ref_id" from="${reportHelper.getProjectsSelectList()}" optionKey="id"/>
 
<button title="HTML" onclick="return submit_test2(this)" type="button"><img border="0"  alt="HTML" src="/${grailsApplication.metadata['app.name']}/plugins/jasper-1.1.3/images/icons/HTML.gif" /> Preview</button>

        &nbsp;
        <a href="#" class="jasperButton" title="XLS" onclick="return submit_test2(this)">
        <img border="0"  alt="XLS" src="/${grailsApplication.metadata['app.name']}/plugins/jasper-1.1.3/images/icons/XLS.gif" /></a>
       &nbsp;
        <a href="#" class="jasperButton" title="PDF" onclick="submit_test2(this)">
        <img border="0"  alt="PDF" src="/${grailsApplication.metadata['app.name']}/plugins/jasper-1.1.3/images/icons/PDF.gif" /></a>
</form>

</td>
</tr>
</table>


<iframe id='reportFrame' onload="showMsg();" width="80%" height="60%" src="/${grailsApplication.metadata['app.name']}/jasper/?_name=&_format=HTML&_file=test2&product_ref_id=6094029"></iframe>
<div id="msg">Started downloading...</div>

class.path =${System.getProperty("java.class.path") }<br>

<% grailsApplication.metadata.each(){ %>
${it}<br>
<% } %>


<%@ page import="java.lang.management.*" %>
<%@ page import="java.util.*" %>

<span>JVM Memory Monitor</span><br><br>

<span>Memory MXBean</span><br>
<b>Heap Memory Usage:</b> <%= ManagementFactory.getMemoryMXBean().getHeapMemoryUsage() %><br>
<b>Non-Heap Memory Usage: </b><%= ManagementFactory.getMemoryMXBean().getNonHeapMemoryUsage() %><br>

<span>Memory Pool MXBeans</span><br>
<%
Iterator iter = ManagementFactory.getMemoryPoolMXBeans().iterator();

while (iter.hasNext()) {
MemoryPoolMXBean item = (MemoryPoolMXBean) iter.next();
%>

<div style="border-bottom: 1px solid #000000">
<b>- Name:</b> <%= item.getName() %><br>
<b>- Type:</b> <%= item.getType() %><br>
<b>- Usage:</b> <%= item.getUsage() %><br>
<b>- Peak Usage:</b> <%= item.getPeakUsage() %><br>
<b>- Collection Usage:</b> <%= item.getCollectionUsage() %><br>
</div>

<%
}
%>
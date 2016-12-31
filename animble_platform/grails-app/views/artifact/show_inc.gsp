<%@ page import="com.nimble.domain.artifact.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;" %>

        <g:set var="viewHelper" value="${request.viewHelper}" scope="request"/>
        <g:set var="artifactInstance" value="${request.viewHelper.artifact}" />
        <g:set var="refHelper" value="${new ReferenceHelper(application)}" />        
        <g:set var="entityName" value="${message(code: 'artifact.label', default: viewHelper.getArtifactClassName())}" />

<div class="body" style="width:95%;">

	<% if (!controllerName.equals('artifactHistory')) { %>
	
	        <div class="nav" style="width:100%;position:relative;">
			<% println(g.include(view:'/artifact/navigation.gsp', params:params)) %>      
	        </div>
	
	<% } else {
	 
		 if (viewHelper.artifactOverride != null) {
			artifactInstance = viewHelper.artifactOverride
		 }
	   }
	%>

	
	<div class="dialog" style="height:${(viewHelper.getArtifactHeightTotal(viewHelper.getArtifactClassName())*2)+60}px;width:100%;background-color: #FFFFFF;position:relative;">


<g:if test="${viewHelper.isViewControlActive('artifact_name')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('artifact_name')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="artifact_name"><g:message code="artifact.artifact_name.label" default="${viewHelper.getAppControlLabel('artifact_name')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'artifact_name', 'errors')}">
                                    ${artifactInstance.artifact_name}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('artifact_nbr')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('artifact_nbr')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="artifact_nbr"><g:message code="artifact.artifact_nbr.label" default="${viewHelper.getAppControlLabel('artifact_nbr')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'artifact_nbr', 'errors')}">
                                    ${artifactInstance.artifact_nbr}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('sprint')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('sprint')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="sprint"><g:message code="artifact.sprint.label" default="${viewHelper.getAppControlLabel('sprint')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'sprint', 'errors')}">
                                   ${artifactInstance?.sprint}
                                </td>
                                </tr></table>                                
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('release')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('release')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="release"><g:message code="artifact.release.label" default="${viewHelper.getAppControlLabel('release')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'release', 'errors')}">
                                   ${artifactInstance?.release}
                                </td>
                                </tr></table>                                
                            </div>
</g:if>


<g:if test="${viewHelper.isViewControlActive('status_ref')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('status_ref')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="status_ref"><g:message code="artifact.status_ref.label" default="${viewHelper.getAppControlLabel('status_ref')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'status_ref', 'errors')}">
                                    ${artifactInstance.status_ref}
                                </td>
                                </tr></table>                                
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('description')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('description')}px;">
                                <table><tr>                            
                                <td class="name" valign="top">
                                    <label for="description"><g:message code="artifact.description.label" default="${viewHelper.getAppControlLabel('description')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'description', 'errors')}">
                                <div style="height:${viewHelper.getAppControlHeight('description')}px;width:650px;overflow:auto;">
                                    ${artifactInstance.description}
                                    </div>
                                </td>
                                </tr></table>                                
                            </div>
</g:if>

<!--start here-->
<g:if test="${viewHelper.isViewControlActive('artifact_seq')}">                        
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('artifact_seq')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="artifact_seq"><g:message code="artifact.artifact_seq.label" default="${viewHelper.getAppControlLabel('artifact_seq')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'artifact_seq', 'errors')}">
                                    ${artifactInstance.artifact_seq}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('author_ref')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('author_ref')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="author_ref"><g:message code="artifact.author_ref.label" default="${viewHelper.getAppControlLabel('author_ref')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'author_ref', 'errors')}">
                                    ${artifactInstance.author_ref}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('planned_version_ref')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('planned_version_ref')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="planned_version_ref"><g:message code="artifact.planned_version_ref.label" default="${viewHelper.getAppControlLabel('planned_version_ref')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'planned_version_ref', 'errors')}">
                                    ${artifactInstance.planned_version_ref}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('version_ref')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('version_ref')}px;">
                                <table><tr>                                
                                <td class="name">
                                    <label for="version_ref"><g:message code="artifact.version_ref.label" default="${viewHelper.getAppControlLabel('version_ref')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'version_ref', 'errors')}">
                                     ${artifactInstance.version_ref}
                                </td>
                                </tr></table>                                
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('priority_ref')}">                        
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('priority_ref')}px;">
                                <table><tr>                            
                                <td class="name">
                                    <label for="priority_ref"><g:message code="artifact.priority_ref.label" default="${viewHelper.getAppControlLabel('priority_ref')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'priority_ref', 'errors')}">
                                     ${artifactInstance.priority_ref}
                                </td>
                                </tr></table>                                
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('effort')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('effort')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="effort"><g:message code="artifact.effort.label" default="${viewHelper.getAppControlLabel('effort')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'effort', 'errors')}">
                                    ${artifactInstance.effort}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('module_ref')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('module_ref')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="module_ref"><g:message code="artifact.module_ref.label" default="${viewHelper.getAppControlLabel('module_ref')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'module_ref', 'errors')}">
                                    ${artifactInstance.module_ref}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('complexity_ref')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('complexity_ref')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="complexity_ref"><g:message code="artifact.complexity_ref.label" default="${viewHelper.getAppControlLabel('complexity_ref')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'complexity_ref', 'errors')}">
                                    ${artifactInstance.complexity_ref}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('assigned_user')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('assigned_user')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="assigned_user"><g:message code="artifact.assigned_user.label" default="${viewHelper.getAppControlLabel('assigned_user')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'assigned_user', 'errors')}">
                                    ${artifactInstance.assigned_user}
                                </td
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('assigned_user_group')}">                        
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('assigned_user_group')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="assigned_user_group"><g:message code="artifact.assigned_user_group.label" default="${viewHelper.getAppControlLabel('assigned_user_group')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'assigned_user_group', 'errors')}">
                                    ${artifactInstance.assigned_user_group}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('origin')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('origin')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="origin"><g:message code="artifact.origin.label" default="${viewHelper.getAppControlLabel('origin')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'origin', 'errors')}">
                                    ${artifactInstance.origin}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('change_made')}">                        
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('change_made')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="change_made"><g:message code="artifact.change_made.label" default="${viewHelper.getAppControlLabel('change_made')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'change_made', 'errors')}">
                                    ${artifactInstance.change_made}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('change_reason')}">                        
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('change_reason')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="change_reason"><g:message code="artifact.change_reason.label" default="${viewHelper.getAppControlLabel('change_reason')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'change_reason', 'errors')}">
                                    ${artifactInstance.change_reason}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('component_type_ref')}">                        
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('component_type_ref')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="component_type_ref"><g:message code="artifact.component_type_ref.label" default="${viewHelper.getAppControlLabel('component_type_ref')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'component_type_ref', 'errors')}">
                                    ${artifactInstance.component_type_ref}
                                </td>
                                </tr></table>
                            </div>
</g:if>                        

<g:if test="${viewHelper.isViewControlActive('summary')}">                        
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('summary')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="summary"><g:message code="artifact.summary.label" default="${viewHelper.getAppControlLabel('summary')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'summary', 'errors')}">
                                    ${artifactInstance.summary}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('category_ref')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('category_ref')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="category_ref"><g:message code="artifact.category_ref.label" default="${viewHelper.getAppControlLabel('category_ref')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'category_ref', 'errors')}">
                                    ${artifactInstance.category_ref}
                                </td>
                                </tr></table>                                
                            </div>
</g:if>                        

<g:if test="${viewHelper.isViewControlActive('origin_category_ref')}">                        
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('origin_category_ref')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="origin_category_ref"><g:message code="artifact.origin_category_ref.label" default="${viewHelper.getAppControlLabel('origin_category_ref')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'origin_category_ref', 'errors')}">
                                    ${artifactInstance.origin_category_ref}
                                </td>
                                </tr></table>
                            </div>
</g:if>                        

<g:if test="${viewHelper.isViewControlActive('removed_ind')}">                        
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('removed_ind')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="removed_ind"><g:message code="artifact.removed_ind.label" default="${viewHelper.getAppControlLabel('removed_ind')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'removed_ind', 'errors')}">
                                    ${artifactInstance.removed_ind}
                                </td>
                                </tr></table>
                            </div>
</g:if>                        

<g:if test="${viewHelper.isViewControlActive('rationale')}">                        
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('rationale')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="rationale"><g:message code="artifact.rationale.label" default="${viewHelper.getAppControlLabel('rationale')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'rationale', 'errors')}">
                                    ${artifactInstance.rationale}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('goal')}">                        
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('goal')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="goal"><g:message code="artifact.goal.label" default="${viewHelper.getAppControlLabel('goal')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'goal', 'errors')}">
                                    ${artifactInstance.goal}
                                </td>
                                </tr></table>
                            </div>
</g:if>                        

<g:if test="${viewHelper.isViewControlActive('context')}">                        
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('context')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="context"><g:message code="artifact.context.label" default="${viewHelper.getAppControlLabel('context')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'context', 'errors')}">
                                    ${artifactInstance.context}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('precondition')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('precondition')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="precondition"><g:message code="artifact.precondition.label" default="${viewHelper.getAppControlLabel('precondition')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'precondition', 'errors')}">
                                    ${artifactInstance.precondition}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('postcondition')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('postcondition')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="postcondition"><g:message code="artifact.postcondition.label" default="${viewHelper.getAppControlLabel('postcondition')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'postcondition', 'errors')}">
                                    ${artifactInstance.postcondition}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('artifact_level_ref')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('artifact_level_ref')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="artifact_level_ref"><g:message code="artifact.artifact_level_ref.label" default="${viewHelper.getAppControlLabel('artifact_level_ref')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'artifact_level_ref', 'errors')}">
                                    ${artifactInstance.artifact_level_ref}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('external_references')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('external_references')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="external_references"><g:message code="artifact.external_references.label" default="${viewHelper.getAppControlLabel('external_references')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'external_references', 'errors')}">
                                    ${artifactInstance.external_references}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('custom_int1')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('custom_int1')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="custom_int1"><g:message code="artifact.custom_int1.label" default="${viewHelper.getAppControlLabel('custom_int1')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'custom_int1', 'errors')}">
                                    ${artifactInstance.custom_int1}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('custom_int2')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('custom_int2')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="custom_int2"><g:message code="artifact.custom_int2.label" default="${viewHelper.getAppControlLabel('custom_int2')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'custom_int2', 'errors')}">
                                    ${artifactInstance.custom_int2}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('custom_memo1')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('custom_memo1')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="custom_memo1"><g:message code="artifact.custom_memo1.label" default="${viewHelper.getAppControlLabel('custom_memo1')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'custom_memo1', 'errors')}">
                                    ${artifactInstance.custom_memo1}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('custom_memo2')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('custom_memo2')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="custom_memo2"><g:message code="artifact.custom_memo2.label" default="${viewHelper.getAppControlLabel('custom_memo2')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'custom_memo2', 'errors')}">
                                    ${artifactInstance.custom_memo2}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('custom_text1')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('custom_text1')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="custom_text1"><g:message code="artifact.custom_text1.label" default="${viewHelper.getAppControlLabel('custom_text1')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'custom_text1', 'errors')}">
                                    ${artifactInstance.custom_text1}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('custom_text2')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('custom_text2')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="custom_text2"><g:message code="artifact.custom_text2.label" default="${viewHelper.getAppControlLabel('custom_text2')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'custom_text2', 'errors')}">
                                    ${artifactInstance.custom_text2}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('custom_text3')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('custom_text3')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="custom_text3"><g:message code="artifact.custom_text3.label" default="${viewHelper.getAppControlLabel('custom_text3')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'custom_text3', 'errors')}">
                                    ${artifactInstance.custom_text3}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('custom_text4')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('custom_text4')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="custom_text4"><g:message code="artifact.custom_text4.label" default="${viewHelper.getAppControlLabel('custom_text4')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'custom_text4', 'errors')}">
                                    ${artifactInstance.custom_text4}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('custom1_ref')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('custom1_ref')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="custom1_ref"><g:message code="artifact.custom1_ref.label" default="${viewHelper.getAppControlLabel('custom1_ref')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'custom1_ref', 'errors')}">
                                    ${artifactInstance.custom1_ref}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('custom2_ref')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('custom2_ref')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="custom2_ref"><g:message code="artifact.custom2_ref.label" default="${viewHelper.getAppControlLabel('custom2_ref')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'custom2_ref', 'errors')}">
                                    ${artifactInstance.custom2_ref}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('custom3_ref')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('custom3_ref')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="custom3_ref"><g:message code="artifact.custom3_ref.label" default="${viewHelper.getAppControlLabel('custom3_ref')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'custom3_ref', 'errors')}">
                                    ${artifactInstance.custom3_ref}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('custom4_ref')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('custom4_ref')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="custom4_ref"><g:message code="artifact.custom4_ref.label" default="${viewHelper.getAppControlLabel('custom4_ref')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'custom4_ref', 'errors')}">
                                    ${artifactInstance.custom4_ref}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('custom_double1')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('custom_double1')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="custom_double1"><g:message code="artifact.custom_double1.label" default="${viewHelper.getAppControlLabel('custom_double1')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'custom_double1', 'errors')}">
                                    ${artifactInstance.custom_double1}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('custom_date1')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('custom_date1')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="custom_date1"><g:message code="artifact.custom_date1.label" default="${viewHelper.getAppControlLabel('custom_date1')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'custom_date1', 'errors')}">
                                    ${artifactInstance.custom_date1}
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('custom_date2')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('custom_date2')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="custom_date2"><g:message code="artifact.custom_date2.label" default="${viewHelper.getAppControlLabel('custom_date2')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'custom_date2', 'errors')}">
                                    ${artifactInstance.custom_date2}
                                </td>
                                </tr></table>
                            </div>
</g:if>

    
	</div>
            
</div>
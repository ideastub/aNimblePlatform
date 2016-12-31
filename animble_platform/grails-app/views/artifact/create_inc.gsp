<%@ page import="com.nimble.domain.artifact.*;com.nimble.domain.reference.*;com.nimble.utils.view.ViewHelper; com.nimble.utils.domain.ReferenceHelper;com.nimble.controller.artifact.*;com.nimble.domain.project.*;com.nimble.domain.release.*;" %>
        <g:set var="viewHelper" value="${request.viewHelper}" />
        <g:set var="artifactInstance" value="${request.viewHelper.artifact}" />
        <g:set var="refHelper" value="${new ReferenceHelper(application)}" />        
        <g:set var="entityName" value="${message(code: 'artifact.label', default: viewHelper.getArtifactClassName())}" />

<div class="body" style="width:95%;float:left;">

	<div style="width:100%;position:relative;">
	<%
	viewHelper.setSectionTitle('Add ' + viewHelper.getAppControlLabel('section_title'))
	println(g.include(view:'/layouts/header_block.gsp', params:params))
	%>
	
	</div>

    <g:if test="${flash.message}">
    <div class="message" style="position:relative;">${flash.message}</div>
    </g:if>
   <g:hasErrors bean="${artifactInstance}">
    <div class="errors" style="position:relative;">
        <g:renderErrors bean="${artifactInstance}" as="list" />
    </div>
    </g:hasErrors>

	<div class="nav" style="position:relative;">
		<% println(g.include(view:'/artifact/navigation.gsp', params:params)) %>
	</div>

<div class="dialog" style="height:${(viewHelper.getArtifactHeightTotal(viewHelper.getArtifactClassName())*2)+60}px;width:100%;background-color:#FFFFFF;position:relative;">

    <g:form method="post" name="myform" action="save"> 

                <g:hiddenField name="project.id" value="${viewHelper.projectId}" />
                <g:hiddenField name="artifactParentId" value="${viewHelper.getArtifactParentId()}" />

<g:if test="${viewHelper.isViewControlActive('artifact_name')}">
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('artifact_name')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="artifact_name"><g:message code="artifact.artifact_name.label" default="${viewHelper.getAppControlLabel('artifact_name')}" /></label>
                                </td>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'artifact_name', 'errors')}">
                                    <g:textField name="artifact_name" value="${artifactInstance?.artifact_name}" />
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
                                    <g:textField name="artifact_nbr" value="${artifactInstance.artifact_nbr}" />
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
                                   <g:select name="sprint.id" from="${SprintQuery.getAllSprintsForProject(session.curProject.id)}" optionKey="id" value="${artifactInstance?.sprint?.id}"  noSelection="['':'- Select -']"/>
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
                                   <g:select name="release.id" from="${ReleaseQuery.getAllReleasesForProject(session.curProject.id)}" optionKey="id" value="${artifactInstance?.release?.id}"  noSelection="['':'- Select -']"/>
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

	<g:if test="${artifactInstance instanceof DesignArtifact}">                                
                                    <g:select name="status_ref.id" from="${refHelper.getRefDataForCreateSelect(DesignStatusReference)}" optionKey="id" value="${artifactInstance?.status_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof FeatureArtifact}">                                
                                    <g:select name="status_ref.id" from="${refHelper.getRefDataForCreateSelect(FeatureStatusReference)}" optionKey="id" value="${artifactInstance?.status_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof ImplementationArtifact}">                                
                                    <g:select name="status_ref.id" from="${refHelper.getRefDataForCreateSelect(ImplementationStatusReference)}" optionKey="id" value="${artifactInstance?.status_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof RequirementArtifact}">                                
                                    <g:select name="status_ref.id" from="${refHelper.getRefDataForCreateSelect(RequirementStatusReference)}" optionKey="id" value="${artifactInstance?.status_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof TestCaseArtifact}">                                
                                    <g:select name="status_ref.id" from="${refHelper.getRefDataForCreateSelect(TestCaseStatusReference)}" optionKey="id" value="${artifactInstance?.status_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof ProductBacklogArtifact}">                                
                                    <g:select name="status_ref.id" from="${refHelper.getRefDataForCreateSelect(ProductBacklogStatusReference)}" optionKey="id" value="${artifactInstance?.status_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof TaskArtifact}">                                
                                    <g:select name="status_ref.id" from="${refHelper.getRefDataForCreateSelect(TaskStatusReference)}" optionKey="id" value="${artifactInstance?.status_ref?.id}"  />
	</g:if>

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
                                    <%--
                                    <textarea name="description2" width="200px"  plugins="['undo', 'redo', 'cut', 'copy', 'paste', 'selectall', 'delete', '|', 'insertOrderedList', 'insertUnorderedList', 'createlink', 'inserthtml', '|', 'indent', 'outdent','justifyCenter', 'justifyFull', 'justifyLeft', 'justifyRight','|', 'bold', 'italic', 'underline', 'strikethrough', 'subscript', 'superscript', 'removeFormat', 'forecolor', 'hilitecolor']" dojoType="dijit.Editor">${artifactInstance?.description}</textarea>
                                    <g:hiddenField name="description" value="" />
                                    --%>
                                    			<textarea id="description" name="description" rows="15" cols="80" style="width: 80%">
${artifactInstance?.description}
			</textarea>
                                    
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
                                    <g:textField name="artifact_seq" value="${fieldValue(bean: artifactInstance, field: 'artifact_seq')}" />
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
                                    <g:select name="author_ref.id" from="${com.nimble.domain.security.ApplicationUser.list()}" optionKey="id" value="${artifactInstance?.author_ref?.id}"  />
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
    <g:if test="${artifactInstance instanceof DesignArtifact}">                                
                                    <g:select name="planned_version_ref.id" from="${refHelper.getRefDataForCreateSelect(DesignVersionReference)}" optionKey="id" value="${artifactInstance?.planned_version_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof FeatureArtifact}">                                
                                    <g:select name="planned_version_ref.id" from="${refHelper.getRefDataForCreateSelect(FeatureVersionReference)}" optionKey="id" value="${artifactInstance?.planned_version_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof ImplementationArtifact}">                                
                                    <g:select name="planned_version_ref.id" from="${refHelper.getRefDataForCreateSelect(ImplementationVersionReference)}" optionKey="id" value="${artifactInstance?.planned_version_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof RequirementArtifact}">                                
                                    <g:select name="planned_version_ref.id" from="${refHelper.getRefDataForCreateSelect(RequirementVersionReference)}" optionKey="id" value="${artifactInstance?.planned_version_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof TestCaseArtifact}">                                
                                    <g:select name="planned_version_ref.id" from="${refHelper.getRefDataForCreateSelect(TestCaseVersionReference)}" optionKey="id" value="${artifactInstance?.planned_version_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof ProductBacklogArtifact}">                                
                                    <g:select name="planned_version_ref.id" from="${refHelper.getRefDataForCreateSelect(ProductBacklogVersionReference)}" optionKey="id" value="${artifactInstance?.planned_version_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof TaskArtifact}">                                
                                    <g:select name="planned_version_ref.id" from="${refHelper.getRefDataForCreateSelect(TaskVersionReference)}" optionKey="id" value="${artifactInstance?.planned_version_ref?.id}"  />
	</g:if>

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
    <g:if test="${artifactInstance instanceof DesignArtifact}">                                
                                    <g:select name="version_ref.id" from="${refHelper.getRefDataForCreateSelect(DesignVersionReference)}" optionKey="id" value="${artifactInstance?.version_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof FeatureArtifact}">                                
                                    <g:select name="version_ref.id" from="${refHelper.getRefDataForCreateSelect(FeatureVersionReference)}" optionKey="id" value="${artifactInstance?.version_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof ImplementationArtifact}">                                
                                    <g:select name="version_ref.id" from="${refHelper.getRefDataForCreateSelect(ImplementationVersionReference)}" optionKey="id" value="${artifactInstance?.version_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof RequirementArtifact}">                                
                                    <g:select name="version_ref.id" from="${refHelper.getRefDataForCreateSelect(RequirementVersionReference)}" optionKey="id" value="${artifactInstance?.version_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof TestCaseArtifact}">                                
                                    <g:select name="version_ref.id" from="${refHelper.getRefDataForCreateSelect(TestCaseVersionReference)}" optionKey="id" value="${artifactInstance?.version_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof ProductBacklogArtifact}">                                
                                    <g:select name="version_ref.id" from="${refHelper.getRefDataForCreateSelect(ProductBacklogVersionReference)}" optionKey="id" value="${artifactInstance?.version_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof TaskArtifact}">                                
                                    <g:select name="version_ref.id" from="${refHelper.getRefDataForCreateSelect(TaskVersionReference)}" optionKey="id" value="${artifactInstance?.version_ref?.id}"  />
	</g:if>

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
    <g:if test="${artifactInstance instanceof DesignArtifact}">                                
                                    <g:select name="priority_ref.id" from="${refHelper.getRefDataForCreateSelect(DesignPriorityReference)}" optionKey="id" value="${artifactInstance?.priority_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof FeatureArtifact}">                                
                                    <g:select name="priority_ref.id" from="${refHelper.getRefDataForCreateSelect(FeaturePriorityReference)}" optionKey="id" value="${artifactInstance?.priority_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof ImplementationArtifact}">                                
                                    <g:select name="priority_ref.id" from="${refHelper.getRefDataForCreateSelect(ImplementationPriorityReference)}" optionKey="id" value="${artifactInstance?.priority_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof RequirementArtifact}">                                
                                    <g:select name="priority_ref.id" from="${refHelper.getRefDataForCreateSelect(RequirementPriorityReference)}" optionKey="id" value="${artifactInstance?.priority_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof TestCaseArtifact}">                                
                                    <g:select name="priority_ref.id" from="${refHelper.getRefDataForCreateSelect(TestCasePriorityReference)}" optionKey="id" value="${artifactInstance?.priority_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof ProductBacklogArtifact}">                                
                                    <g:select name="priority_ref.id" from="${refHelper.getRefDataForCreateSelect(ProductBacklogPriorityReference)}" optionKey="id" value="${artifactInstance?.priority_ref?.id}"  />
	</g:if>
	<g:if test="${artifactInstance instanceof TaskArtifact}">                                
                                    <g:select name="priority_ref.id" from="${refHelper.getRefDataForCreateSelect(TaskPriorityReference)}" optionKey="id" value="${artifactInstance?.priority_ref?.id}"  />
	</g:if>

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
                                    <g:textField name="effort" value="${fieldValue(bean: artifactInstance, field: 'effort')}" />
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
                                    <g:select name="module_ref.id" from="${refHelper.getRefDataForCreateSelect(ModuleReference)}" optionKey="id" value="${artifactInstance?.module_ref?.id}"  />
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
                                    <g:select name="complexity_ref.id" from="${refHelper.getRefDataForCreateSelect(ComplexityReference)}" optionKey="id" value="${artifactInstance?.complexity_ref?.id}"  />
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
                                    <g:select name="assigned_user.id" from="${com.nimble.domain.security.ApplicationUser.list()}" optionKey="id" value="${artifactInstance?.assigned_user?.id}"  />
                                </td>
                                </tr></table>
                            </div>
</g:if>

<g:if test="${viewHelper.isViewControlActive('assigned_user_group')}">                        
                            <div class="prop" style="position:absolute;top:${viewHelper.getAppControlVertPos('assigned_user_group')}px;">
                                <table><tr>
                                <td class="name">
                                    <label for="assigned_user_group"><g:message code="artifact.assigned_user_group.label" default="${viewHelper.getAppControlLabel('assigned_user_group')}" /></label>
                                </div>
                                <td class="value ${hasErrors(bean: artifactInstance, field: 'assigned_user_group', 'errors')}">
                                    <g:select name="assigned_user_group.id" from="${com.nimble.domain.security.ApplicationUserGroup.list()}" optionKey="id" value="${artifactInstance?.assigned_user_group?.id}"  />
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
                                    <g:textField name="origin" value="${artifactInstance?.origin}" />
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
                                    <g:textField name="change_made" value="${artifactInstance?.change_made}" />
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
                                    <g:textField name="change_reason" value="${artifactInstance?.change_reason}" />
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
                                    <g:select name="component_type_ref.id" from="${refHelper.getRefDataForCreateSelect(ComponentTypeReference)}" optionKey="id" value="${artifactInstance?.component_type_ref?.id}"  />
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
                                    <g:textField name="summary" value="${artifactInstance?.summary}" />
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
                                    <g:select name="category_ref.id" from="${refHelper.getRefDataForCreateSelect(CategoryReference)}" optionKey="id" value="${artifactInstance?.category_ref?.id}"  />
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
                                    <g:select name="origin_category_ref.id" from="${refHelper.getRefDataForCreateSelect(OriginCategoryReference)}" optionKey="id" value="${artifactInstance?.origin_category_ref?.id}"  />
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
                                    <g:checkBox name="removed_ind" value="${artifactInstance?.removed_ind}" />
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
                                    <g:textField name="rationale" value="${artifactInstance?.rationale}" />
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
                                    <g:textField name="goal" value="${artifactInstance?.goal}" />
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
                                    <g:textField name="context" value="${artifactInstance?.context}" />
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
                                    <g:textField name="precondition" value="${artifactInstance?.precondition}" />
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
                                    <g:textField name="postcondition" value="${artifactInstance?.postcondition}" />
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
                                    <g:select name="artifact_level_ref.id" from="${refHelper.getRefDataForCreateSelect(ArtifactLevelReference)}" optionKey="id" value="${artifactInstance?.artifact_level_ref?.id}"  />
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
                                    <g:textField name="external_references" value="${artifactInstance?.external_references}" />
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
                                    <g:textField name="custom_int1" value="${fieldValue(bean: artifactInstance, field: 'custom_int1')}" />
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
                                    <g:textField name="custom_int2" value="${fieldValue(bean: artifactInstance, field: 'custom_int2')}" />
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
                                    <g:textField name="custom_memo1" value="${artifactInstance?.custom_memo1}" />
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
                                    <g:textField name="custom_memo2" value="${artifactInstance?.custom_memo2}" />
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
                                    <g:textField name="custom_text1" value="${artifactInstance?.custom_text1}" />
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
                                    <g:textField name="custom_text2" value="${artifactInstance?.custom_text2}" />
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
                                    <g:textField name="custom_text3" value="${artifactInstance?.custom_text3}" />
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
                                    <g:textField name="custom_text4" value="${artifactInstance?.custom_text4}" />
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
                                    <g:select name="custom1_ref.id" from="${refHelper.getRefDataForCreateSelect(CustomRef1Reference)}" optionKey="id" value="${artifactInstance?.custom1_ref?.id}"  />
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
                                    <g:select name="custom2_ref.id" from="${refHelper.getRefDataForCreateSelect(CustomRef2Reference)}" optionKey="id" value="${artifactInstance?.custom2_ref?.id}"  />
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
                                    <g:select name="custom3_ref.id" from="${refHelper.getRefDataForCreateSelect(CustomRef3Reference)}" optionKey="id" value="${artifactInstance?.custom3_ref?.id}"  />
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
                                    <g:select name="custom4_ref.id" from="${refHelper.getRefDataForCreateSelect(CustomRef4Reference)}" optionKey="id" value="${artifactInstance?.custom4_ref?.id}"  />
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
                                    <g:textField name="custom_double1" value="${fieldValue(bean: artifactInstance, field: 'custom_double1')}" />
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
                                    <g:datePicker name="custom_date1" precision="day" value="${artifactInstance?.custom_date1}"  />
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
                                    <g:datePicker name="custom_date2" precision="day" value="${artifactInstance?.custom_date2}"  />
                                </td>
                                </tr></table>
                            </div>
</g:if>





<%--				      
			<div id="ArtifactTree" dojoType="dijit.layout.ContentPane" preventCache="true" title="Modification History">


                        <table>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.last_updated_baseline.label" default="Last Updated Baseline" /></td>
                            
                            <td valign="top" class="value"><g:link controller="baseline" action="show" id="${artifactInstance?.last_updated_baseline?.id}">${artifactInstance?.last_updated_baseline?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${artifactInstance?.dateCreated}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.lastUpdate.label" default="Date Modified" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${artifactInstance?.lastUpdate}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.create_user.label" default="Created By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="applicationUser" action="show" id="${artifactInstance?.create_user?.id}">${artifactInstance?.create_user?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="artifact.update_user.label" default="Modified By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="applicationUser" action="show" id="${artifactInstance?.update_user?.id}">${artifactInstance?.update_user?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                        </table>

                        <table>
                        <tr>
                            <td valign="top" class="name"><g:message code="artifact.artifactHistories.label" default="Artifact Histories" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${artifactInstance.artifactHistories}" var="a">
                                    <li><g:link controller="artifactHistory" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                        </tr>
                        </table>
</div>
--%>                        
    

            
            </g:form>
	</div>         



	<div style="width:100%;position:relative;">
	<% println(g.include(view:'/layouts/footer_block.gsp', params:params)) %>
	</div>

</div>
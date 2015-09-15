
<%@ page import="xenbackup.Server" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'server.label', default: 'Server')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-server" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-server" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list server">
			
				<g:if test="${serverInstance?.ip}">
				<li class="fieldcontain">
					<span id="ip-label" class="property-label"><g:message code="server.ip.label" default="Ip" /></span>
					
						<span class="property-value" aria-labelledby="ip-label"><g:fieldValue bean="${serverInstance}" field="ip"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serverInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="server.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${serverInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${serverInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="server.user.label" default="User" /></span>
					
						<span class="property-value" aria-labelledby="user-label"><g:fieldValue bean="${serverInstance}" field="user"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:serverInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${serverInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>

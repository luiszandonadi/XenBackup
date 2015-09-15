<%@ page import="xenbackup.Server" %>



<div class="fieldcontain ${hasErrors(bean: serverInstance, field: 'ip', 'error')} required">
	<label for="ip">
		<g:message code="server.ip.label" default="Ip" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ip" required="" value="${serverInstance?.ip}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serverInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="server.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${serverInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: serverInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="server.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="user" required="" value="${serverInstance?.user}"/>

</div>


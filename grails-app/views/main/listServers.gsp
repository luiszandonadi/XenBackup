<%--
  Created by IntelliJ IDEA.
  User: luis
  Date: 14/09/15
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

</head>

<body>
<table>
    <tr>
        <th>IP</th>
        <th></th>
    </tr>
    <g:each in="${servers}">
        <tr>
            <td>${it.ip}</td>
            <td><a href="${createLink(action: 'showVMs',id: it.id)}"><g:message code="show.vms" /></a></td>
        </tr>
    </g:each>
</table>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: luis
  Date: 14/09/15
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title></title>
</head>
<body>
<table>
    <tr>
        <th>Name</th>
        <th>Uuid</th>
        <th></th>
    </tr>
    <g:each in="${vms}">
        <tr>
            <td>${it.name}</td>
            <td>${it.uuid}</td>
            <td><a href="${createLink(action: 'exportXva', params: [uuid: it.uuid,server:it.server])}">Export to XVA</a></td>
        </tr>
    </g:each>
</table>
</body>
</html>
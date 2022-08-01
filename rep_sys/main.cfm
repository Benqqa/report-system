<a href="/rep_sys/exit.cfm">Выход</a>
<cfif #cookie.rep_sys_token# eq ''>
    <cflocation url="/rep_sys/auth.cfm?noauth=1">
    <cfelse>
    <cfquery name="isAuth"  datasource="db">
        SELECT * FROM user WHERE token='#cookie.rep_sys_token#' 
	</cfquery>
    <cfoutput>
    </cfoutput>
</cfif>
<html> 
<head>
 <title>auth form</title>
<link href="/rep_sys/style/auth.css"  rel="stylesheet" type="text/css" />
</head> 
<body>
<div class="wrapper">
<div class="formm">
<cfform class="formm">
<a href="/rep_sys/create_error.cfm">Создать ошибку</a>
<a href="/rep_sys/show_errors_list.cfm">Список ошибок</a>
<a href="/rep_sys/edit_user.cfm">Редактировать юзера</a>
</cfform>
</div>
</div>
</body>
</html>
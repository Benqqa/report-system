<a href="/rep_sys/main.cfm">Назад</a>
<cfif #cookie.rep_sys_token# eq ''>
    <cflocation url="/rep_sys/auth.cfm?noauth=1">
    <cfelse>
    <cfquery name="isAyth"  datasource="db">
        SELECT * FROM user WHERE token='#cookie.rep_sys_token#' 
	</cfquery>
    <cfif isAyth.uid == ''>
        <cflocation url="/rep_sys/auth.cfm?noauth=1">
    </cfif>
</cfif>
<cfquery name="getUser"  datasource="db">
        SELECT * FROM user WHERE uid='#cookie.uid#' 
</cfquery>
<html> 
<head>
 <title>auth form</title>
<link href="/rep_sys/style/auth.css"  rel="stylesheet" type="text/css" />
</head> 
<body>
<div class="wrapper">
<div class="formm">
<cfoutput>
name = #getUser.name#,
surname = #getUser.surname#,
login = #getUser.login#
</cfoutput>
<cfform method="POST" action="insert_user.cfm"> 
<cfoutput>
<table>
<td>name:</td> 
<td><input type="Text" name="name" size="35" maxlength="50" value='#getUser.name#'></td> 
</tr> 
<tr> 
<td>surname:</td> 
<td><input type="Text" name="surname" size="35" maxlength="45" value=#getUser.surname# ></td> 
</tr> 
<tr> 
<td>login:</td> 
<td><input type="Text" name="login" size="35"value=#getUser.login# ></td>  
</tr> 
<tr> 
<td>password:</td> 
<td><input type="password" name="password" size="35" ></td>  
</tr> 
<tr>
<td><input type="Button" value="Submit"  onclick="this.form.submit()"></td> 
</tr>
</table>
</cfoutput>
</cfform>
</div>
</div>
</body>
</html>


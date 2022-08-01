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
<cfquery name="getUser" datasource="db"> 
    SELECT * FROM user WHERE uid='#cookie.uid#' 
</cfquery>
<cfscript>
    param name = 'url.success' default=0;
    isSuccess = url.success;
    myDate=DateFormat(now(),'yyyy-mm-dd');
</cfscript>
<html> 
<head>
 <title>auth form</title>
<link href="/rep_sys/style/auth.css"  rel="stylesheet" type="text/css" />
</head> 
<body>
<div class="wrapper">

<div class="formm">
<cfif isSuccess eq 1>
    Ошибка успешно создана!
</cfif>
<table> 

<!--- begin html form; 
put action page in the "action" attribute of the form tag. ---> 
<form action="insert_error.cfm" method="post"> 
<cfoutput>
<td>date:</td> 
<td><input type="date" name="date" size="35" maxlength="50" value='#myDate#' readonly></td> 
</tr> 
</cfoutput>

<tr> 
<td>description:</td> 
<td><input type="Text" name="description" size="35" maxlength="255"></td> 
</tr> 
<tr> 
<td>text:</td> 
<td><input type="Text" name="text" size="35" ></td>  
</tr> 
<tr> 
<td>status</td> 
<td><input type="text" name="status" size="35" maxlength="45" value="Новая" readonly></td>   
</tr> 
<tr> 
<td>urgency</td> 
<td>
    <select name="urgency"  >
        <option value="Очень срочно">Очень срочно</option>
        <option value="Срочно">Срочно</option>
        <option selected value="Несрочно">Несрочно</option>
        <option value="Совсем не срочно">Совсем не срочно</option>
    </select>
</td>   
</tr> 
<tr> 
<td>criticality</td> 
<td>
    <select name="criticality"  >
        <option value="Авария">Авария</option>
        <option value="Критичная">Критичная</option>
        <option selected value="Некритичная">Некритичная</option>
        <option value="Запрос на изменение">Запрос на изменение</option>
    </select>
</td>   
</tr> 
<tr>
<cfoutput>
<td>Автор вопроса:</td> 
<td>

 #getUser.name# #getUser.surname#

</td> 
<td><input type="text" name="uid" size="35" maxlength="45" value=#getUser.uid# readonly></td>
</cfoutput>    
</tr> 
<td>&nbsp;</td> 
<td><input type="Submit" value="Submit"></td> 
</tr> 
</form> 
<!--- end html form ---> 
</table> 
</div>
</div>
</body>
</html>
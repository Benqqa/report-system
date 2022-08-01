<a href="/rep_sys/main.cfm">На главную</a>
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
<cfquery name="getErrors" datasource="db"> 
    SELECT * FROM error 
</cfquery>
<html> 
<head>
 <title>auth form</title>
<link href="/rep_sys/style/auth.css"  rel="stylesheet" type="text/css" />
</head> 
<body>
<div class="wrapper">
<div class="formm">
<cfif structKeyExists(form, "one") and form.one neq "">
<cfif #form.one# neq 'Все'>
            <cfquery name="getErrors" datasource="db" >
              SELECT * FROM error WHERE status='#form.one#' 
            </cfquery>
<cfelse>

</cfif>
             <cfform method="POST" action="#cgi.script_name#"> 
                <select name="one" required="yes" onchange="this.form.submit()">
                <cfif '#form.one#' eq "Все">
                    <option selected value="Все">Все</option>
                <cfelse>
                    <option value="Все">Все</option>
                </cfif>
                <cfif '#form.one#' eq "Новая">
                    <option selected value="Новая">Новые</option>
                <cfelse>
                    <option value="Новая">Новые</option>
                </cfif>

                <cfif '#form.one#' eq "Открытая">
                    <option selected value="Открытая">Открытые</option>
                <cfelse>
                    <option value="Открытая">Открытые</option>
                </cfif>

                <cfif '#form.one#' eq "Решенная">
                    <option selected value="Решенная">Решенные</option>
                <cfelse>
                    <option value="Решенная">Решенные</option>
                </cfif>

                <cfif '#form.one#' eq "Закрытая">
                    <option selected value="Закрытая">Закрытые</option>
                <cfelse>
                    <option value="Закрытая">Закрытые</option>
                </cfif>
                </select>
            </cfform>
<cfelse>
 <cfform method="POST" action="#cgi.script_name#"> 
        <select name="one" required="yes" onchange="this.form.submit()">
          <option value="Все">Все</option>
          <option value="Новая">Новые</option>
          <option value="Открытая">Открытые</option>
          <option value="Решенная">Решенные</option>
          <option value="Закрытая">Закрытые</option>
        </select>
    </cfform>
</cfif>

   

<ul>
<cfloop query="#getErrors#">
	<cfquery name="getAuthor"  datasource="db">
        SELECT * FROM user WHERE uid='#getErrors.uid#' 
	</cfquery>
    <cfoutput>
    
    <li>
    <a href="/rep_sys/show_error.cfm?eid=#eid#" >ссылка</a>
     eid = #eid#,
    Дата = #date#,
    Короткое описание = #description#,
    Статус = #status#,
    Срочность = #urgency#,
    Критичность = #criticality#,
    Автор вопроса: #getAuthor.name#, #getAuthor.surname#
    
     </li>
     </cfoutput>
</cfloop>
</ul>
</div>
</div>
</body>
</html>
<a href="/rep_sys/show_errors_list.cfm">Назад</a>
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
    param name = 'url.eid' default=0;
    eid = url.eid;
</cfscript>
<cfif eid != 0>
    <cfquery name="getError" datasource="db"> 
        SELECT * FROM error WHERE eid='#eid#'
    </cfquery>
    <cfquery name="getAuthor" datasource="db"> 
        SELECT * FROM user WHERE uid='#getError.uid#'
    </cfquery>
    <cfquery name="getComments" datasource="db"> 
        SELECT * FROM comment WHERE eid='#eid#'
    </cfquery>
    
</cfif>
<cfscript>
    
</cfscript>



<html> 
<head>
 <title>auth form</title>
<link href="/rep_sys/style/auth.css"  rel="stylesheet" type="text/css" />
</head> 
<body>
<div class="wrapper">
<div class="formm">
<p>Error</p>
<cfoutput>


    eid = #getError.eid#,
    Дата = #getError.date#,
    Короткое описание = #getError.description#,
    Статус = #getError.status#,
    Срочность = #getError.urgency#,
    Критичность = #getError.criticality#,
    Автор = #getAuthor.name# #getAuthor.surname#
</cfoutput>
<cfscript>
support_text= '?eid=';
myDate=DateFormat(now(),'yyyy-mm-dd')
</cfscript>

<p>Edit Error</p>
<cfform method="POST" action="insert_comment.cfm#support_text##eid#"> 
<cfoutput>
<table>
<td>date:</td> 
<td><input type="date" name="date" size="35" maxlength="50" value='#myDate#' readonly></td> 
</tr> 
<tr> 
<td>description:</td> 
<td><input type="Text" name="description" size="35" maxlength="255" value=#getError.description# ></td> 
</tr> 
<tr> 
<td>text:</td> 
<td><input type="Text" name="text" size="35"value=#getError.text# ></td>  
</tr> 
<tr> 
<td>status</td> 
<td>
    <select name="status" value=#getError.status# >
    <cfif #getError.status# eq "Новая">
        <option selected value="Новая">Новая</option>
            <cfelse>
        <option value="Новая">Новая</option>
        </cfif>

        <cfif #getError.status# eq "Открытая">
        <option selected value="Открытая">Открытая</option>
            <cfelse>
        <option value="Открытая">Открытая</option>
        </cfif>

        <cfif #getError.status# eq "Решенная">
        <option selected value="Решенная">Решенная</option>
            <cfelse>
        <option value="Решенная">Решенная</option>
        </cfif>

        <cfif #getError.status# eq "Закрытая">
        <option selected value="Закрытая">Закрытая</option>
            <cfelse>
        <option value="Закрытая">Закрытая</option>
        </cfif>
    </select>
</td>  
</tr> 
<tr> 
<td>urgency</td> 
<td>
<select name="urgency" >
<cfif #getError.urgency# eq "Авария">
        <option selected value="Очень срочно">Очень срочно</option>
            <cfelse>
        <option value="Очень срочно">Очень срочно</option>
        </cfif>

        <cfif #getError.urgency# eq "Срочно">
        <option selected value="Срочно">Срочно</option>
            <cfelse>
        <option value="Срочно">Срочно</option>
        </cfif>

        <cfif #getError.urgency# eq "Несрочно">
        <option selected value="Несрочно">Несрочно</option>
            <cfelse>
        <option value="Несрочно">Несрочно</option>
        </cfif>

        <cfif #getError.urgency# eq "Совсем не срочно">
        <option selected value="Совсем не срочно">Совсем не срочно</option>
            <cfelse>
        <option value="Совсем не срочно">Совсем не срочно</option>
        </cfif>
    </select>
</td>   
</tr> 
<tr> 
<td>criticality</td> 
<td>
    <select name="criticality" >
        <cfif #getError.criticality# eq "Авария">
        <option selected value="Авария">Авария</option>
            <cfelse>
        <option value="Авария">Авария</option>
        </cfif>

        <cfif #getError.criticality# eq "Критичная">
        <option selected value="Критичная">Критичная</option>
            <cfelse>
        <option value="Критичная">Критичная</option>
        </cfif>

        <cfif #getError.criticality# eq "Некритичная">
        <option selected value="Некритичная">Некритичная</option>
            <cfelse>
        <option value="Некритичная">Некритичная</option>
        </cfif>

        <cfif #getError.criticality# eq "Запрос на изменение">
        <option selected value="Запрос на изменение">Запрос на изменение</option>
            <cfelse>
        <option value="Запрос на изменение">Запрос на изменение</option>
        </cfif>
    </select>
</td>   
</tr> 
<tr>

<td>Автор изменения вопроса:</td> 
<td>

 #getUser.name# #getUser.surname#

</td> 
  
</tr> 
<tr>

<td>Комментарий к изменению:</td> 
<td><input type="text" name="comment" size="35" maxlength="45"  required></td>
 
</tr> 

<td><input type="Button" value="Submit"  onclick="this.form.submit()"></td> 
</tr> 
       </table>    
       </cfoutput>
    </cfform>
<ul>
<p>История изменений</p>
<cfloop query="#getComments#">
	<cfquery name="getCommentAuthor" datasource="db"> 
        SELECT * FROM user WHERE uid='#getComments.uid#'
    </cfquery>
    <cfoutput>
    
    <li>
     eid = #eid#,
     body = #body#,
     action = #action#,
     Автор изменениея: #getCommentAuthor.name# #getCommentAuthor.surname#
     </li>
     </cfoutput>
</cfloop>
</ul>
</div>
</div>
</body>
</html>
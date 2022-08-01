<cfquery name="getUser" datasource="db"> 
    SELECT * FROM user WHERE uid='#cookie.uid#' 
</cfquery>
<html> 
<head> <title>Input form</title> </head> 
<body> 
<!--- If the Contractor check box is clear, 
set the value of the Form.Contract to "No" ---> 
<cfscript>
    param name = 'url.eid' default=0;
    eid = url.eid;
</cfscript>
<!--- Insert the new record ---> 
<cfif structKeyExists(form, "comment") and form.comment neq "" > 
    <cfquery name="updError" datasource="db"> 
        UPDATE error SET description='#form.description#', 
        date='#form.date#',
         text='#form.text#', 
         status='#form.status#', 
         urgency='#form.urgency#', 
         criticality='#form.criticality#' WHERE eid=#eid#;
    </cfquery>
    
    <cfquery name='insComment' datasource="db">
        INSERT INTO comment (date, action, body, eid, uid) VALUES ('#form.date#', '#form.status#', '#form.comment#', '#eid#', '#getUser.uid#'); 
    </cfquery>
    <cfquery name="getError" datasource="db"> 
        SELECT * FROM error WHERE eid='#eid#'
    </cfquery>
    <cfquery name="getAuthor" datasource="db"> 
        SELECT * FROM user WHERE uid='#getError.uid#'
    </cfquery>
    <cfquery name="getComments" datasource="db"> 
        SELECT * FROM comment WHERE eid='#eid#'
    </cfquery>
    
<cfelse>
</cfif>
<h1>Error Added</h1>
<cflocation url="/rep_sys/show_error.cfm?eid=#eid#">

</body> 
</html>

<cfquery name="getUser" datasource="db"> 
    SELECT * FROM user WHERE uid='#cookie.uid#' 
</cfquery>
<html> 
<head> <title>Input form</title> </head> 
<body> 
<!--- If the Contractor check box is clear, 
set the value of the Form.Contract to "No" ---> 
<cfscript>
    bin_password=Hash(form.password, "MD5");
</cfscript>

<cfset form.password = bin_password>
<!--- Insert the new record ---> 
    <cfscript>
     rep_sys_token = Hash(Form.login, "MD5");
</cfscript> 
 <cfquery name='insToken' datasource="db">
        UPDATE user SET token='#rep_sys_token#' where uid='#getUser.uid#'; 
    </cfquery>
    
<cfset cookie.rep_sys_token=rep_sys_token>
<cfset cookie.uid=getUser.uid>
    <cfif getUser.name neq form.name>
        <cfquery name="updUser" datasource="db"> 
        UPDATE user SET 
        name='#form.name#' WHERE uid='#cookie.uid#';
    </cfquery>  
    </cfif>
    <cfif getUser.surname neq form.surname>
    <cfquery name="updUser" datasource="db"> 
        UPDATE user SET 
        surname='#form.surname#' WHERE uid='#cookie.uid#';
    </cfquery>  
    </cfif>
    <cfif getUser.login neq form.login>
    <cfquery name="updUser" datasource="db"> 
        UPDATE user SET 
         login='#form.login#' WHERE uid='#cookie.uid#';
    </cfquery>  
    </cfif>
    <cfif getUser.password neq form.password>
    <cfquery name="updUser" datasource="db"> 
        UPDATE user SET 
         password='#form.password#' WHERE uid='#cookie.uid#';
    </cfquery>  
    </cfif>

<h1>User uptodate</h1>
<cflocation url="/rep_sys/edit_user.cfm">

</body> 
</html>
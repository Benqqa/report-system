<html> 
<head> <title>Auth</title> </head> 
<body> 
<!--- If the Contractor check box is clear, 
set the value of the Form.Contract to "No" ---> 

<cfscript> 
    bin_password=Hash(Form.password, "MD5");  

</cfscript> 
<cfset Form.password = #bin_password#> 
<cfquery name="GetUser" datasource="db"> 
    SELECT * FROM user WHERE login='#Form.login#' and password='#Form.password#' 
</cfquery>

<cfscript>
     rep_sys_token = Hash(Form.login, "MD5");
</cfscript> 
 <cfquery name='insToken' datasource="db">
        UPDATE user SET token='#rep_sys_token#' where uid='#GetUser.uid#'; 
    </cfquery>
<cfset cookie.rep_sys_token=rep_sys_token>
<cfset cookie.uid=GetUser.uid>
<cfoutput>#cookie.rep_sys_token#</cfoutput>
<!--- Insert the new record
<cfinsert datasource="db" tablename="user">  ---> 
<cfif rep_sys_token eq cookie.rep_sys_token and #GetUser.name# !=''>
    <cflocation url="/rep_sys/main.cfm">
<cfelse>
    <cflocation url="/rep_sys/auth.cfm?noauth=1">
</cfif>

<h1>Auth</h1> 
<cfoutput> You have added #GetUser.name# #GetUser.surname# to the employee database. 
</cfoutput> 
</body> 
</html>
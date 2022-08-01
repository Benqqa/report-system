<html> 
<head> <title>Input form</title> </head> 
<body> 
<!--- If the Contractor check box is clear, 
set the value of the Form.Contract to "No" ---> 
<cfscript> 
bin_password=Hash(Form.password, "MD5"); 

</cfscript> 
<cfset Form.password = #bin_password#> 
<!--- Insert the new record ---> 
<cfinsert datasource="db" tablename="user"> 
<h1>User Added</h1> 
<cfoutput> You have added #Form.name# #Form.surname# to the employee database. 
</cfoutput> 
<a href="/rep_sys/auth.cfm">Перейти в авторизацию</a>
</body> 
</html>
<html> 
<head> <title>Input form</title> </head> 
<body> 
<!--- If the Contractor check box is clear, 
set the value of the Form.Contract to "No" ---> 
<cfscript> 

</cfscript> 
<!--- Insert the new record ---> 
<cfinsert datasource="db" tablename="error"> 
<h1>Error Added</h1>
<cflocation url="/rep_sys/create_error.cfm?success=1">

</body> 
</html>
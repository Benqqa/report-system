<cfscript>
param name = 'url.noauth' default = 0;
isError = url.noauth;
</cfscript>
<html> 
<head>
 <title>auth form</title>
<link href="/rep_sys/style/auth.css"  rel="stylesheet" type="text/css" />
</head> 
<body>
<cfif isError == 1>
    <h1>Ошибка входа</h1>
    </cfif>
<div class="wrapper">
    
    <form action="insert_auth.cfm" method="post" class="formm"> 
    <tr> 
    <td>login:</td> 
    <td><input type="Text" name="login" size="35" maxlength="50"></td>  
    </tr> 
    <tr> 
    <td>password</td> 
    <td><input type="password" name="password" size="35" maxlength="50"></td>   
    </tr> 
    <td>&nbsp;</td> 
    <td><input type="Submit" value="Submit"></td> 
    </tr> 
    </form> 
</div>
</body> 

</html>
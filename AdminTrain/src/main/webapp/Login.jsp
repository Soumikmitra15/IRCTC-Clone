<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script
      src="https://kit.fontawesome.com/64d58efce2.js"
      crossorigin="anonymous"
    ></script>
<style>

body::before
{
    content: '';
    position: absolute;
    z-index: 0;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: #fee2f8;
background-image: linear-gradient(315deg, #fee2f8 0%, #dcf8ef 74%);

    clip-path: circle(30% at right 70%);
}
body::after
{
    content: '';
    position: absolute;
    z-index: 0;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: #d9e4f5;
background-image: linear-gradient(315deg, #d9e4f5 0%, #f5e3e6 74%);
    clip-path: circle(20% at 10% 10%);
}
body
{
    background: #5433FF;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #A5FECB, #20BDFF, #5433FF);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #A5FECB, #20BDFF, #5433FF); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

 display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}


.container_main {
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
    max-width: 1200px;
    flex-wrap: wrap;
    z-index: 1;
}

.container .input-group {
    margin-bottom: 10px; 
}


.card-body > div.text-center.pt-3 {
    text-align: center;
}

.glass-card {
     position: relative;
    width: 30vw;
    height: 50vh;
    margin: 30px;
    box-shadow: 20px 20px 50px rgba(0, 0, 0,0.5);
    border-radius: 15px;
    background: rgba(255, 255, 255, 0.1);
    overflow: hidden;
    display: flex;
    align-items: center;
    justify-content: center;
    border-top: 1px solid rgba(255, 255, 255, 0.3);
    border-left: 1px solid rgba(255, 255, 255, 0.3);
    backdrop-filter: blur(5px);
}
</style>
</head>
<body>
    <div class="container_main">
        <div class="glass-card" id="glassCard">
            <div class="card-body p-4">
                                        
              <div class="text-center mb-4">
                  <h4 class="text-uppercase mt-0" >Admin Login</h4>
               </div>
         <form class="container text-center pt-4" action="Login" method="post">
	          <div class="row align-items-start g-3">
	        <div class="col input-group flex-wrap">
	            <span class="input-group-text" id="addon-wrapping"><i class="fas fa-envelope"></i></span>
	            <input type="email" class="form-control" placeholder="Enter EmailId" name="email" aria-label="email">
	        </div>
	        </div>	  
	        <div class="row align-items-start g-3">
	        <div class="col input-group flex-wrap">
	            <span class="input-group-text" id="addon-wrapping"><i class="fas fa-lock"></i></span>
	            <input type="password" class="form-control" placeholder="Enter your password" name="password" aria-label="password">
	        </div>
	        
	    </div >
	    <div class="pt-3">
	    <button class="btn btn-primary" type="submit">Sign-In</button>
	    </div>
	</form>
	<div class="text-center pt-3">
	<span>New Here? <a href="Register.jsp" style="color:white">Sign-up</a></span>
	</div>
	
             </div> <!-- end card-body -->
        </div>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script>
    <%-- Check if the errorMessage attribute exists --%>
    <% if (request.getAttribute("errorMessage") != null) { %>
        <%-- Display an alert with the error message --%>
        alert("${errorMessage}");
    <% } %>
</script>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.ibm.Station" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin | Add Stations</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script>

<style>
@import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";


body {
    font-family: 'Poppins', sans-serif;
    background: #fafafa;
    margin: 0;
      padding: 0;
}

    .container-fluid {
      padding: 0;
    }

    .card {
      margin: 0;
    }

p {
    font-family: 'Poppins', sans-serif;
    font-size: 1.1em;
    font-weight: 300;
    line-height: 1.7em;
    color: #999;
}

a, a:hover, a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
}

#sidebar {
    /* don't forget to add all the previously mentioned styles here too */
    background: #7386D5;
    color: #fff;
    transition: all 0.3s;
}

#sidebar .sidebar-header {
    padding: 20px;
    background: #6d7fcc;
}

#content
{
width:100vw;
}

#sidebar ul.components {
    padding: 20px 0;
    border-bottom: 1px solid #47748b;
}

#sidebar ul p {
    color: #fff;
    padding: 10px;
}

#sidebar ul li a {
    padding: 10px;
    font-size: 1.1em;
    display: block;
}
#sidebar ul li a:hover {
    color: #7386D5;
    background: #fff;
}

#sidebar ul li.active > a, a[aria-expanded="true"] {
    color: #fff;
    background: #6d7fcc;
}
ul ul a {
    font-size: 0.9em !important;
    padding-left: 30px !important;
    background: #6d7fcc;
}
.wrapper {
    display: flex;
    align-items: stretch;
}

#sidebar {
    min-width: 250px;
    max-width: 250px;
}

#sidebar.active {
    margin-left: -250px;
}

#sidebar {
    min-width: 250px;
    max-width: 250px;
    min-height: 100vh;
}

a[data-toggle="collapse"] {
    position: relative;
}

.dropdown-toggle::after {
    display: block;
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
}

@media (max-width: 768px) {
    #sidebar {
        margin-left: -250px;
    }
    #sidebar.active {
        margin-left: 0;
    }
}

.container {
position:relative;
    display: flex;
    justify-content: space-around;
    align-items: center;
    max-width: 1280px;
    flex-wrap: wrap;
    z-index: 1;
}

</style>

</head>
<body>
<!-- Login successful<br><br>-->
<c:set var="user" value="" />
 <c:forEach var="cookies" items="${cookie}">
        <c:choose>
    <c:when test="${cookies.key eq 'user'}">
      <c:set var="user" value="${cookies.value.value}" />
    </c:when>
  </c:choose>
 </c:forEach>
<div class="wrapper">
    <!-- Sidebar -->
    <nav id="sidebar" class="active">
      <div class="sidebar-header">
        <h4>Welcome</h4>
        <h5><c:out value="${user}"></c:out></h5>
      </div>

      <ul class="list-unstyled components">
        <li >
          <a href="Dashboard.jsp">Dashboard</a>
        </li>
        <li class="active">
          <a href="AddStations.jsp">Add Station</a>
        </li>
        <li>
          <a href="AddTrain.jsp">Add Train</a>
        </li>
        <li>
          <a href="ViewBookings.jsp">Bookings</a>
        </li>
      </ul>
    </nav>

    <div id="content">
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <button type="button" id="sidebarCollapse" class="btn btn-info">
            <i class="fas fa-align-left"></i>
            <span>Toggle Sidebar</span>
          </button>
        </div>
      </nav>

      <div class="container-fluid mt-5">
  <div class="topbar container mt-3 mb-4 d-flex justify-content-between">
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
      Add Station
    </button>
    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="Dashboard.jsp">Admin</a></li>
        <li class="breadcrumb-item active" aria-current="page">Stations</li>
      </ol>
    </nav>
  </div>
        <div class="card">
        <div class="card-body">
          <div class="row">
            <div class="col-12">
            <table class="table">
  <thead class="bg-info" style="color:white">
    <tr>
      <th scope="col">Station Code</th>
      <th scope="col">Station Name</th>
      <th scope="col">State</th>
    </tr>
  </thead>
   <tbody>
                                    <sql:setDataSource var="dataSource" driver="oracle.jdbc.driver.OracleDriver"
                                        url="jdbc:oracle:thin:@localhost:1521:XE" user="javaweb" password="javaweb" />

                                    <sql:query dataSource="${dataSource}" var="result">
                                        SELECT * FROM station
                                    </sql:query>

                                    <c:forEach var="station" items="${result.rows}">
                                        <tr>
                                            <td><c:out value="${station.code}" /></td>
                                            <td><c:out value="${station.name}" /></td>
                                            <td><c:out value="${station.state}" /></td>
                                        </tr>
                                    </c:forEach>

</table>

            </div>
          </div>
         </div>
         </div>
      </div>

    </div>
  </div>


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Add a Railway Station</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="AddStation" method="post">
      <div class="modal-body" >
       <div class="row g-3">
            <div class="col-md-6">
            	<div class="input-group flex-wrap mt-3 mr-3">
                    <span class="input-group-text" id="addon-wrapping-lastname"><i class="fas fa-train"></i></span>
                    <input type="text" class="form-control" placeholder="Enter Station Code" name="code" aria-label="code" required="required">
                </div>
                
            </div>
            <div class="col-md-6">
                <div class="input-group flex-wrap mt-3 ">
                    <span class="input-group-text" id="addon-wrapping-firstname"><i class="fas fa-building"></i></span>
                    <input type="text" class="form-control" placeholder="Enter Station Name" name="stationName" aria-label="stationName" required="required">
                </div>
            </div>
        </div>
        <div class="row g-3">
            <div class="col-md-6">
                <div class="input-group flex-wrap mt-3">
                    <span class="input-group-text" id="addon-wrapping-username"><i class="fas fa-map-marker-alt"></i></span>
                    <input type="text" class="form-control" placeholder="Enter State" name="state" aria-label="state" required="required">
                </div>
            </div>
            <div class="col-md-6">
              
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Add Station</button>
      </div>
      
      </form>
    </div>
  </div>
</div>
<!-- jQuery CDN - Slim version (=without AJAX) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
    
     <script>
    $(document).ready(function () {
      $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
      });
    });
  </script>
    
    
</body>
</html>
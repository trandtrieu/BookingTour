<%-- 
    Document   : single
    Created on : May 21, 2023, 12:22:04 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Single Tour Detail</title>
        <%@include file="includes/head.jsp" %>

    </head>


    <body>
        <%@include file="includes/topbar.jsp" %>
        <!-- Packages Start -->



        <div class="container py-5">

                <div class="row">
                    <div class="col-md-6">
                        <img src="img/${detail.imageTour}" alt="Tour Image" class="tour-image">

                    </div>
                        


                    <div class="col-md-6">
                        <h2>${detail.tourName}</h2>
                        <p><strong>Price:</strong> $${detail.price}</p>
                        <p><strong>Departure Date:</strong> ${detail.dateStart}</p>
                        <p><strong>Return Date:</strong> ${detail.dateEnd}</p>
                        <p><strong>Hotel:</strong> Spring Hotel (5 stars)</p>
                        <p><strong>Transportation:</strong> Private bus</p>
                        <p><strong>Sales:</strong> Contact our sales representative</p>
                        <p><strong>Destination:</strong> Đài Loan, Việt Nam</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vitae elit id risus scelerisque consectetur. Proin vulputate malesuada lacinia. Aliquam volutpat velit id lorem viverra lacinia.</p>
                        <h4 class="mb-3">Itinerary:</h4>
                        <ul class="list-group">
                            <li class="list-group-item">Day 1: detail.schedule}</li>
                            <li class="list-group-item">Day 2: Visit Taipei 101 and National Palace Museum</li>
                            <li class="list-group-item">Day 3: Explore Jiufen Old Street and Shifen Waterfall</li>
                            <li class="list-group-item">Day 4: Enjoy the scenic beauty of Taroko Gorge</li>
                            <li class="list-group-item">Day 5: Visit Sun Moon Lake and Wenwu Temple</li>
                            <li class="list-group-item">Day 6: Relax at Kenting Beach</li>
                            <li class="list-group-item">Day 7: Departure</li>
                        </ul>
                        <a href="#" class="btn btn-primary mt-4">Book Now</a>
                    </div>
            </div>
        </div>
        <!-- Packages End -->
                <%@include file="includes/footer.jsp" %>

    </body>
    <%@include file="includes/foot.jsp" %>

</html>


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
                    <p><strong>Price:</strong> ${detail.price} <span style="color: red">$</span></p>
                    <p><strong>Departure Date:</strong> ${detail.dateStart}</p>
                    <p><strong>Return Date:</strong> ${detail.dateEnd}</p>
                    <p><strong>Hotel:</strong> ${detail.hotelName}</p>
                    <p><strong>Transportation:</strong> Private bus</p>
                    <p><strong>Sales:</strong> Contact our sales representative</p>
                    <p><strong>Place:</strong> ${detail.placeName}</p>
                    <p>${detail.detailTour}</p>
                    <h4 class="mb-3">Itinerary:</h4>
                    <ul class="list-group">
                        <li class="list-group-item">Day 1: detail.schedule</li>
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

        <div class="container-fluid py-5">
            <div class="container py-5">
                <div class="row">
                    <div class="col-lg-8">
                        <!-- Comment List Start -->
                        <div class="bg-white" style="padding: 30px; margin-bottom: 30px;">
                            <h4 class="text-uppercase mb-4" style="letter-spacing: 5px;">3 Comments</h4>
                            <div class="media mb-4">
                                <img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                <div class="media-body">
                                    <h6><a href="">John Doe</a> <small><i>01 Jan 2045</i></small></h6>
                                    <p>Diam amet duo labore stet elitr invidunt ea clita ipsum voluptua, tempor labore
                                        accusam ipsum et no at. Kasd diam tempor rebum magna dolores sed sed eirmod ipsum.
                                        Gubergren clita aliquyam consetetur sadipscing, at tempor amet ipsum diam tempor
                                        consetetur at sit.</p>
                                    <button class="btn btn-sm btn-outline-primary">Reply</button>
                                </div>
                            </div>
                            <div class="media">
                                <img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                <div class="media-body">
                                    <h6><a href="">John Doe</a> <small><i>01 Jan 2045</i></small></h6>
                                    <p>Diam amet duo labore stet elitr invidunt ea clita ipsum voluptua, tempor labore
                                        accusam ipsum et no at. Kasd diam tempor rebum magna dolores sed sed eirmod ipsum.
                                        Gubergren clita aliquyam consetetur sadipscing, at tempor amet ipsum diam tempor
                                        consetetur at sit.</p>
                                    <button class="btn btn-sm btn-outline-primary">Reply</button>
                                    <div class="media mt-4">
                                        <img src="img/user.jpg" alt="Image" class="img-fluid mr-3 mt-1"
                                             style="width: 45px;">
                                        <div class="media-body">
                                            <h6><a href="">John Doe</a> <small><i>01 Jan 2045</i></small></h6>
                                            <p>Diam amet duo labore stet elitr invidunt ea clita ipsum voluptua, tempor
                                                labore accusam ipsum et no at. Kasd diam tempor rebum magna dolores sed sed
                                                eirmod ipsum. Gubergren clita aliquyam consetetur sadipscing, at tempor amet
                                                ipsum diam tempor consetetur at sit.</p>
                                            <button class="btn btn-sm btn-outline-primary">Reply</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Comment List End -->
                        <div class="mb-5">
                            <h4 class="text-uppercase mb-4" style="letter-spacing: 5px;">Some new tours</h4>
                            <c:forEach var="r" items="${tRelated}" varStatus="status">
                                <div class="d-flex align-items-center text-decoration-none bg-white mb-3">
                                    <img class="img-fluid" src="img/${r.imageTour}" alt="" width="100" height="100">
                                    <div class="pl-3">
                                        <h6 class="m-1" id="tour-${r.tourId}" onclick="redirectToDetail('${r.tourId}')" style="cursor: pointer">${r.tourName}</h6>
                                        <small>Jan 01, 2050</small>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                    </div>




                </div>
            </div>
        </div>
        <!-- Blog End -->

        <%@include file="includes/footer.jsp" %>

    </body>
    <script>
        function redirectToDetail(tourId) {
            window.location.href = "detail?tid=" + tourId;
        }
    </script>
    <%@include file="includes/foot.jsp" %>

</html>


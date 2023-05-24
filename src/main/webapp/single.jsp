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
        <style>
            .tour-image {
                width: 100%;
                height: auto;
            }
        </style>
    </head>
    <body>
        <%@include file="includes/topbar.jsp" %>
        <div class="container py-5">
            <div class="row">
                <div class="col-md-6">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="img/destination-1.jpg" class="d-block w-100" alt="Image 1">
                            </div>
                            <div class="carousel-item">
                                <img src="img/destination-2.jpg" class="d-block w-100" alt="Image 2">
                            </div>
                            <div class="carousel-item">
                                <img src="img/destination-3.jpg" class="d-block w-100" alt="Image 3">
                            </div>
                            <div class="carousel-item">
                                <img src="img/destination-4.jpg" class="d-block w-100" alt="Image 4">
                            </div>
                            <div class="carousel-item">
                                <img src="img/destination-5.jpg" class="d-block w-100" alt="Image 5">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>



                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#home">Lịch trình</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#menu1">Chi tiết tour</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#menu2">Điều khoản và chính sách</a>
                        </li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div id="home" class="container tab-pane active"><br>
                            <h3>Schedule</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        </div>
                        <div id="menu1" class="container tab-pane fade"><br>
                            <h3>Menu 1</h3>
                            <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                        </div>
                                <%@include file="includes/policies.jsp" %>

                        
                    </div>
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
                        <li class="list-group-item">Day 1:</li>
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
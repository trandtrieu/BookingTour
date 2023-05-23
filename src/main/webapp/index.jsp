<%-- 
    Document   : index.jsp
    Created on : May 20, 2023, 9:55:05 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home </title>
        <%@include file="includes/head.jsp" %>

    </head>
    <style>

    </style>
    <body>
        <%@include file="includes/topbar.jsp" %>
        <%@include file="includes/carousel.jsp" %>
        <%@include file="includes/search.jsp" %>

        <div id="demo" class="carousel slide" data-ride="carousel">


            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
            </ul>
            <div class="container banner-container carousel-inner">

                <div class="carousel-item active">
                    <img src="img/quaaa-3238.gif" alt="Banner Image" class="banner-image">
                </div>
                <div class="carousel-item ">
                    <img src="img/banner-he-roi-di-thoi-4090.gif" alt="Banner Image" class="banner-image">
                </div>

            </div>
        </div>


        <%@include file="includes/aboutus.jsp" %>
        <div class="container-fluid py-5">
            <div class="container pt-5 pb-3">
                <div class="text-center mb-3 pb-3">
                    <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Destination</h6>
                    <h1>Explore Top Destination</h1>
                </div>
                <div class="row">
                    <c:forEach var="r" items="${myRegions}" varStatus="status">

                        <div class="col-lg-3 col-md-3 mb-3">
                            <div class="destination-item position-relative overflow-hidden mb-2">
                                <img class="img-fluid" src="img/${r.regionImage}" alt="">
                                <a class="destination-overlay text-white text-decoration-none" href="">
                                    <h5 class="text-white">${r.regionName}</h5>
                                    <span>100 Cities</span>
                                </a>
                            </div>
                        </div> 
                    </c:forEach>
                </div>
            </div>


        </div>
        <!-- Packages Start -->
        <div class="container-fluid py-5">
            <div class="container pt-5 pb-3">
                <div class="text-center mb-3 pb-3">
                    <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Packages</h6>
                    <h1>Pefect Tour Packages</h1>
                </div>


                <div class="row">
                    <c:set var="itemsPerPage" value="6" /> <!-- Số lượng mục hiển thị trên mỗi trang -->
                    <c:set var="currentPage" value="${param.pageNumber eq null ? 1 : param.pageNumber}" /> <!-- Trang hiện tại, mặc định là trang 1 -->
                    <c:set var="totalPages" value="${(myTours.size() + itemsPerPage - 1) / itemsPerPage}" /> <!-- Tổng số trang -->

                    <c:forEach var="t" items="${myTours}" varStatus="status">
                        <c:if test="${status.index >= (currentPage - 1) * itemsPerPage && status.index < currentPage * itemsPerPage}">
                            <div class="col-lg-4 col-md-6 mb-4" >
                                <div class="package-item bg-white mb-2">
                                    <img class="img-fluid" src="img/${t.imageTour}" alt="">
                                    <div class="p-4">
                                        <div class="d-flex justify-content-between mb-3">
                                            <small class="m-0"><i class="fa fa-map-marker-alt text-primary mr-2"></i>${t.placeName}                                            
                                            </small>
                                            <small class="m-0"><i class="fa fa-user text-primary mr-2"></i>2 Person</small>
                                        </div>
                                        <div class="d-flex justify-content-between mb-3">
                                            <small class="m-0"><i class="fa fa-calendar-alt text-primary mr-2"></i>${t.dateStart}</small>
                                            <small class="m-0"><i class="fa fa-calendar-alt text-primary mr-2 "></i>${t.dateEnd}</small>


                                        </div>
                                        <div class="d-flex justify-content-between mb-3">
                                            <small class="m-0"><i class="fa fa-calendar-alt text-primary mr-2"></i>${t.hotelName}</small>
                                            <small class="m-0"><i class="fa fa-calendar-alt text-primary mr-2"></i>${t.regionName}</small>



                                        </div>
                                        <a class="h5 text-decoration-none" href="detail?tid=${t.tourId}">${t.tourName}  <span class="badge badge-danger">HOT</span></a>

                                        <div class="border-top mt-4 pt-4">
                                            <div class="d-flex justify-content-between">
                                                <h6 class="m-0"><i class="fa fa-star text-primary mr-2"></i>4.5 <small>(250)</small></h6>
                                                <h5 class="m-0">$${t.price}</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>

                <!-- Hiển thị phân trang -->
                <c:if test="${myTours.size() > itemsPerPage}">
                    <ul class="pagination justify-content-center mt-4">
                        <li class="page-item${currentPage eq 1 ? ' disabled' : ''}">
                            <a class="page-link" href="?pageNumber=${currentPage - 1}">&laquo; Previous</a>
                        </li>
                        <c:forEach var="page" begin="1" end="${totalPages}">
                            <c:url var="pageURL" value="?pageNumber=${page}" />
                            <li class="page-item${page eq currentPage ? ' active' : ''}">
                                <a class="page-link" href="${pageURL}">${page}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item${currentPage eq totalPages ? ' disabled' : ''}">
                            <a class="page-link" href="?pageNumber=${currentPage + 1}">Next &raquo;</a>
                        </li>
                    </ul>
                </c:if>

                <div class="hotline-container">
                    <a href="tel:0789458707" class="hotline-link">Hotline: 0789458707</a>
                </div>
            </div>
        </div>



        <!-- Destination Start -->

    </div>
</div>
<!-- Destination Start -->

<!-- Packages End -->
<%@include file="includes/footer.jsp" %>

</body>
<%@include file="includes/foot.jsp" %>

</html>

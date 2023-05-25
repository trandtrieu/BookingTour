<%-- 
    Document   : searchResult
    Created on : May 24, 2023, 11:17:31 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Result </title>
        <%@include file="includes/head.jsp" %>

    </head>

    <body>
        <%@include file="includes/topbar.jsp" %>


        


      
        <!-- Packages Start -->
        <div class="container-fluid py-5">
            <div class="container pt-5 pb-3">
                <div class="text-center mb-3 pb-3">
                    <h6 class="text-primary text-uppercase" style="letter-spacing: 5px;">Khám phá</h6>
                    <h1>Danh sách tua</h1>
                </div>


                <div class="row">
                  
                    <c:forEach var="t" items="${listS}" varStatus="status">
                            <div class="col-lg-4 col-md-6 mb-4" >
                                <div class="package-item bg-white mb-2">
                                    <img class="img-fluid" src="img/${t.imageTour}" alt="">
                                    <div class="p-4">
                                        <div class="d-flex justify-content-between mb-3">
                                            <small class="m-0"><i class="fa fa-map-marker-alt text-primary mr-2"></i>${t.placeName}                                            
                                            </small>
                                            <small class="m-0"><i class="fa fa-user text-primary mr-2"></i>1 Person</small>
                                        </div>

                                        <div class="d-flex justify-content-between mb-3">
                                            <small class="m-0"><i class="fa fa-calendar-alt text-primary mr-2"></i>${t.dateStart}</small>
                                            <small class="m-0"><i class="fa fa-calendar-alt text-primary mr-2 "></i>${t.dateEnd}</small>
                                        </div>

                                        <div class="d-flex justify-content-between mb-3">
                                            <small class="m-0"><i class="fa fa-hotel text-primary mr-2"></i>${t.hotelName}</small>
                                            <small class="m-0"><i class="fa fa-map text-primary mr-2"></i>${t.regionName}</small>


                                        </div>

                                        <a class="h5 text-decoration-none" href="detail?tid=${t.tourId}">${t.tourName}  <span class="badge badge-danger">HOT</span></a>

                                        <div class="border-top mt-4 pt-4">
                                            <div class="d-flex justify-content-between">
                                                <h5 class="m-0">${t.price} VND</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </c:forEach>
                </div>

                <!-- Hiển thị phân trang -->
               


                <div class="container">
                    <!-- Các mã HTML khác -->
                    <div class="hotline-container">
                        <a href="tel:0789458707" class="hotline-link">Đường dây nóng 0789458707</a>
                    </div>
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


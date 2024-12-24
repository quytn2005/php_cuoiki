<?php
include_once('../model/db.classes.php');
include_once('../model/product.classes.php');
include_once('../model/user.classes.php');
include_once('../model/category.classes.php');
include_once('../model/bill.classes.php');
include_once('../model/search.classes.php');
// tìm kiếm sản phẩm
if(isset($_POST['searchProduct']) && isset($_POST['page']) && isset($_POST['limit'])) {
    $Product = new Product(); // Tạo đối tượng Product.
    $page = $_POST['page']; // Lấy số trang từ yêu cầu POST.
    $limit = $_POST['limit']; // Lấy giới hạn số sản phẩm mỗi trang.
    $value = $_POST['searchProduct']; // Lấy từ khóa tìm kiếm.
    $resultQuery = $Product->searchProduct($value, $page, $limit); // Gọi phương thức tìm kiếm sản phẩm.
    
    // Tách kết quả trả về:
    $countTotalProduct = $resultQuery['countTotalProduct']; // Tổng số sản phẩm tìm được.
    $data = $resultQuery['data']; // Dữ liệu sản phẩm.
    $countPagination = ceil($countTotalProduct / $limit); // Tính số trang dựa trên tổng sản phẩm và giới hạn.

    // Tạo kết quả trả về:
    $result = ["pagination" => $countPagination, "data" => $data];
    echo json_encode($result); // Trả về dữ liệu JSON.
}
// tìm kiếm người dùng
if(isset($_POST['searchUser']) && isset($_POST['page']) && isset($_POST['limit'])) {
    $User = new User();
    $page = $_POST['page'];
    $limit = $_POST['limit'];
    $value = $_POST['searchUser'];
    $resultQuery = $User->searchUser($value,$page,$limit);
    $countTotalUser = $resultQuery['countTotalUser'];
    $data = $resultQuery['data'];
    $countPagination = ceil($countTotalUser / $limit);

    $result = ["pagination" => $countPagination,
    "data" => $data];
    echo json_encode($result);
}
// tìm kiếm danh mục
if(isset($_POST['searchCategory']) && isset($_POST['page']) && isset($_POST['limit'])) {
    $Category = new Category();
    $page = $_POST['page'];
    $limit = $_POST['limit'];
    $value = $_POST['searchCategory'];
    $resultQuery = $Category->searchCategory($value,$page,$limit);
    $countTotalCategory = $resultQuery['countTotalCategory'];
    $data = $resultQuery['data'];
    $countPagination = ceil($countTotalCategory / $limit);

    $result = ["pagination" => $countPagination,
    "data" => $data];
    echo json_encode($result);
}
// tìm kiếm hóa đơn
if(isset($_POST['searchBill']) && isset($_POST['page']) && isset($_POST['limit'])) {
    $Bill = new Bill();
    $page = $_POST['page'];
    $limit = $_POST['limit'];
    $value = $_POST['searchBill'];
    $resultQuery = $Bill->searchBill($value,$page,$limit);
    $countTotalBill = $resultQuery['countTotalBill'];
    $data = $resultQuery['data'];
    $countPagination = ceil($countTotalBill / $limit);

    $result = ["pagination" => $countPagination,
    "data" => $data];
    echo json_encode($result);
}
// tìm kiếm năng cao trên trang chủ
if(isset($_POST['searchHomePage'])) {
    $Search = new Search();
    $array = $_POST['searchHomePage'];
    $search = $array['search'];
    $range = $array['range'];
    $page = $array['page'];
    $limit = $array['limit'];
    $category = $array['category'];
    $size = $array['size'];
    $resultQuery = $Search->searchProductHomePage($search,$range,$category,$size,$page,$limit);
    $countTotalProduct = $resultQuery['countTotalProduct'];
    $data = $resultQuery['data'];
    $countPagination = ceil($countTotalProduct / $limit);

    $result = ["pagination" => $countPagination,
    "data" => $data];
    echo json_encode($result);
    // echo json_encode($resultQuery);
}
?>
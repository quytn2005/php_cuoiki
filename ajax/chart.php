<?php
include_once('../model/db.classes.php');
include_once('../model/bill.classes.php');
include_once('../model/product.classes.php');
include_once('../model/category.classes.php');

if(isset($_POST['action']) && $_POST['action'] == 'fetchChart') {
    $Bill = new Bill();
    $Product = new Product();
    $Category = new Category();
    $dataBill = $Bill->getDataChart();
    $dataProduct = $Product->getBestSellerProducts(5);
    $dataCategory = $Category->getBestSellerCategory(5);
    $result = ["bill" => $dataBill, "product" => $dataProduct, "category" => $dataCategory];
    //Dữ liệu từ ba nguồn ($dataBill, $dataProduct, $dataCategory) được kết hợp vào một mảng liên kết $result. 
    //Mỗi loại dữ liệu sẽ được gán với một khóa tương ứng là "bill", "product", và "category".
    echo json_encode($result);
    //huyển mảng $result thành chuỗi JSON và trả về cho phía client. 
    //Dữ liệu này có thể được sử dụng để cập nhật biểu đồ hoặc các phần tử giao diện người dùng trên trang web thông qua JavaScript.
}
?>
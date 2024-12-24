<?php
class Bill extends DB {
    //Lấy danh sách hóa đơn kèm theo thông tin người dùng.

    public function getBillsWithUser() {
        $sql = "SELECT * FROM `bill` inner join user on `bill`.id_user = `user`.`id_user`";
        $stmt = $this->connect()->query($sql);
        return $stmt->fetchAll();
    }
    //Lấy danh sách hóa đơn kèm thông tin người dùng với giới hạn số lượng.

    public function getBillsWithUserLimit($start,$count) {
        $sql = "SELECT * FROM `bill` inner join user on `bill`.id_user = `user`.`id_user` ORDER BY id_bill DESC LIMIT $start, $count ";
        $stmt = $this->connect()->query($sql);
        return $stmt->fetchAll();
    }
    //Lấy danh sách hóa đơn của một người dùng cụ thể.

    public function getBillOfUser($id_user) {
        $sql = "SELECT * FROM `bill` WHERE id_user = $id_user";
        $stmt = $this->connect()->query($sql);
        return $stmt->fetchAll();
    }
    //Lấy chi tiết hóa đơn theo id_bill.

    public function getBillById($id) {
        $sql = "SELECT * FROM `bill` WHERE id_bill = $id";
        $stmt = $this->connect()->query($sql);
        return $stmt->fetchAll();
    }
    //Đếm tổng số hóa đơn
    public function getCountBills() {
        $sql = "Select * from bill";
        $stmt = $this->connect()->query($sql);
        return $stmt->rowCount();
    }
    //Đếm số hóa đơn chưa được duyệt
    public function getCountBillsDontAcp() {
        $sql = "Select * from bill where status = 0";
        $stmt = $this->connect()->query($sql);
        return $stmt->rowCount();
    }
    //Thêm một hóa đơn mới.
    public function insertBill($address,$phone,$name,$pointUsed,$totalMoney,$totalPay) {
        $id_user = Session::getValueSession('user');
        $sql = "INSERT INTO `bill` (`delivery_address`, `receiver_phone`, `receiver_name`,
         `payment_method`, `point_used`, `total_money`, `total_pay`, `status`, `id_user`)
        VALUES (?, ?, ?, '0', ?, ?, ?, '0', ?)";
        $stmt = $this->connect()->prepare($sql);
        $stmt->execute([$address,$phone,$name,$pointUsed,$totalMoney,$totalPay,$id_user]);
        $id_bill = $this->getLastIdBill();
        return $id_bill;
    }
    // Cập nhật thông tin hóa đơn.
    public function updateBill($address,$phone,$fullname,$status,$id_bill) {
        $sql = "UPDATE `bill` SET `delivery_address` = ?, `receiver_phone` = ?, `receiver_name` = ?, `status` = ? 
        WHERE `bill`.`id_bill` = ?";
        $stmt = $this->connect()->prepare($sql);
        $stmt->execute([$address,$phone,$fullname,$status,$id_bill]);
        header("Location:index.php?quanly=admin&action=manageCart");
    }
    //Cập nhật trạng thái hóa đơn.
    public function updateStatusBill($id_bill,$status) {
        $sql = "UPDATE `bill` SET `status` = $status WHERE `bill`.`id_bill` = $id_bill";
        $stmt = $this->connect()->query($sql);
    }
    //Xóa một hóa đơn theo ID.

    public function deleteBill($id) {
        $sql = "DELETE FROM bill WHERE id_bill = ?";
        $stmt = $this->connect()->prepare($sql);
        $stmt->execute([$id]);
    }
    //Lấy ID của hóa đơn vừa được thêm gần nhất.

    public function getLastIdBill() {
        $sql = "SELECT MAX(id_bill) FROM bill";
        $stmt = $this->connect()->query($sql);
        $arr = $stmt->fetch();
        $id_bill = $arr[0];
        return $id_bill;
    }
    //Tìm kiếm hóa đơn theo tên người nhận, địa chỉ, hoặc ID hóa đơn.

    public function searchBill($name,$page,$limit) {
        $start = ($page -1) * $limit;
        $sql = "Select * from bill WHERE receiver_name LIKE '%$name%' OR delivery_address LIKE '%$name%' OR id_bill = '$name'";
        $sqlResult = "Select * from bill WHERE receiver_name LIKE '%$name%' OR delivery_address LIKE '%$name%' OR id_bill = '$name' LIMIT $start,$limit";
        $stmt = $this->connect()->prepare($sql);
        $stmt->execute();
        $countTotalBill = $stmt->rowCount();
        $stmt = $this->connect()->prepare($sqlResult);
        $stmt->execute();
        $result = $stmt->fetchAll();
        return ["countTotalBill" => $countTotalBill, "data" => $result];
    }
    //Lấy dữ liệu thống kê số lượng hóa đơn theo ngày.
    public function getDataChart() {
        $result = [];
        $sql = "SELECT COUNT(*) as soluong,DATE_FORMAT(date_pay,'%d/%m/%Y') as ngay from `bill` GROUP BY date_pay";
        $stmt = $this->connect()->query($sql);
        $fetchResult = $stmt->fetchAll();
        // foreach($fetchResult as $item) {

        // }
        return $fetchResult;
    }
}
?>
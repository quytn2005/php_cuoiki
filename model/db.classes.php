<?php
class DB {
    private $servername = "localhost";
    private $username = "root";
    private $password = '';
    private $dbname = "lld";
    private $port = 3307; // Thêm cổng ở đây

    protected function connect () {
        try {
            $conn = new PDO('mysql:host='.$this->servername.';port='.$this->port.';dbname='.$this->dbname, $this->username, $this->password);
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $conn;
        }catch(PDOException $e) {
            echo "Kết nối thất bại: " . $e->getMessage();
        }
    }

    protected function addImageToFolder($image) {
        $target_dir = "./assets/images/";
        $target_file = $target_dir . basename($image["name"]);
        $uploadOk = true;
        $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
 
        if (file_exists($target_file)) {
            echo "File đã tồn tại.";
            $uploadOk = false;
        }

        if ($image["size"] > 1000000) {
            echo "Dung lượng file quá lớn.";
            $uploadOk = false;
            return;
        }

        if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "webp") {
            echo "Sai định dạng ảnh.";
            $uploadOk = false;
            return;
        }

        if (!$uploadOk) {
            echo "Upload không thành công.";
        } else {
            if (move_uploaded_file($image["tmp_name"], $target_file)) {
                echo "File " . htmlspecialchars(basename($image["name"])) . " đã được upload.";
            } else {
                echo "Có lỗi xảy ra khi upload.";
            }
        }
        return $target_file;
    }
}
?>

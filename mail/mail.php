<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;


require 'PHPMailer/src/Exception.php';//nhúng thư viện vào để dùng, sửa lại đường dẫn cho đúng nếu bạn lưu vào chỗ khác
require 'PHPMailer/src/PHPMailer.php';//nhúng thư viện vào để dùng, sửa lại đường dẫn cho đúng nếu bạn lưu vào chỗ khác
require 'PHPMailer/src/SMTP.php';//nhúng thư viện vào để dùng, sửa lại đường dẫn cho đúng nếu bạn lưu vào chỗ khác
// //Create an instance; passing `true` enables exceptions
// $mail = new PHPMailer(true);// khởi tạo đối tượng
// $mail->CharSet = "utf-8";


function sendRequestCode($userName,$gmail,$randomCode) {
    $mail = new PHPMailer(true);
    $mail->CharSet = "utf-8";

    $message = '
    <html>
        <body style="text-align: center;">
            <h4 style="color: #1a1a17;margin: 0;font-size: 28px;">Mã xác nhận của bạn là :</h4>
            <h2 style="color: #d03c3c;margin: 0;font-size: 38px;">'.$randomCode.'</h3>
        </body>
    </html>                        
    ';


try {
    //Server settings
    // $mail->SMTPDebug = SMTP::DEBUG_SERVER; chế độ debug
    $mail->SMTPDebug = 0;  // Tắt chế độ debug
                     
    $mail->isSMTP();                                            //gửi qua smtp
    $mail->Host       = 'smtp.gmail.com';                     // địa chỉ máy chủ smtp
    $mail->SMTPAuth   = true;                                   //bật xác thực smtp
    $mail->Username   = 'tranngocquy746@gmail.com';                     //địa chỉ email ứng dụng
    $mail->Password   = 'kdeb lzcg ibbw xzur';                               //mâtj khẩu ứng dụng
    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //bạt mã hóa
    $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`

    //Recipients
    $mail->setFrom('tranngocquy746@gmail.com', 'tranngocquy');//địa chỉ và tên người gửi
    $mail->addAddress($gmail, $userName);     // Add a recipient
    //Content
    $mail->isHTML(true);                                  // Set email format to HTML
    $mail->Subject = 'BẠN CÓ MỘT MÃ XÁC NHẬN TỪ VKU';
    $mail->Body    = $message;
    // $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';
 
    $mail->send();
} catch (Exception $e) {
    echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
}
}
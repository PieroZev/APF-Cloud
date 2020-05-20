<?php

require 'PHPMailer/PHPMailerAutoload.php';

$mail = new PHPMailer();
$mail->isSMTP();
$mail->SMTPAuth = true;
$mail->SMTPSecure='tls';
$mail->Host = 'smtp.gmail.com';
$mail->Port = '587';
$mail->Username='pzevallose94@gmail.com';
$mail->Password='Alvaro845!';

$mail->setFrom('pzevallose94@gmail.como','Nuevo Pedido');

$mail->addAddress('pvaristop@gmail.com','Piero Zevallos');

$mail->Subject = 'Nuevo Pedido de AsperoPacificFoods';
$mail->Body = 'Tienes un nuevo pedido';

if($mail->send()){
echo 'Enviado';
} else{
echo 'Error';
}

?>
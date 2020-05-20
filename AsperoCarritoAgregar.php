<?php
header('Access-Control-Allow-Origin: *');
$cn = mysqli_connect("localhost","root","","asperopacificfoods");
$num= $_POST["num"];
$cod= $_POST["cod"];
$nom= $_POST["nom"];
$pre= $_POST["pre"];
$rs=mysqli_query($cn,"insert into producto_pedido (IdPedido,IdProducto,Cantidad,Precio,Subtotal,NomProducto) values($num,$cod,1,$pre,$pre*1,'".$nom."')");

echo mysqli_insert_id($cn);

mysqli_close($cn);

?>
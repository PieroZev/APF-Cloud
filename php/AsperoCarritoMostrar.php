<?php
	header('Access-Control-Allow-Origin: *');
	$idp=$_POST["idp"];
	$cn = mysqli_connect("localhost","root","","asperopacificfoods");
	$sql = "select * from producto_pedido PP
	inner join productos PR on PR.IdProducto=PP.IdProducto
	where PP.IdPedido=".$idp;
	$rs = mysqli_query($cn, $sql);
	while($row=mysqli_fetch_assoc($rs)){
		$res[]=array_map("utf8_encode",$row);
	}
	echo json_encode($res);
	mysqli_close($cn);
?>

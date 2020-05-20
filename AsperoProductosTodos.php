<?php
	header('Access-Control-Allow-Origin: *');
	$IdCat=$_POST["IdCat"];
	$cn = mysqli_connect("localhost","root","","asperopacificfoods");
	$rs = mysqli_query($cn,"select P.IdProducto,P.Nombre,P.Precio,P.imagen from productos P inner join categorias C on P.IdCategoria=C.IdCategoria where C.IdCategoria=".$IdCat);
	while($row=mysqli_fetch_assoc($rs)){
		$res[]=array_map("utf8_encode",$row);
	}
	echo json_encode($res);
	mysqli_close($cn);
?>

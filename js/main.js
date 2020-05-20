// JavaScript Document

$(document).ready(function(){
	
	mostrarCategorias();
	
	function mostrarCategorias(){
		$.ajax({
		url:"http://localhost/php/AsperoCategorias.php",
		method:"POST",
		dataType:"json"
		
	}).done(function(data){
		
		$("#nav-productos").html("");	
		
		$.each(data,function(index,value){
			
			$("#nav-productos").append("<a class='dropdown-item' id='"+value.IdCategoria+"' href='#'>"+value.NomCategoria+"</a>");
			
		});
			
			$("#nav-productos .dropdown-item, .selec-prod").click(function(){
		var IdCat=$(this).attr("id");
		
		window.location.href= "tienda.html?Idcat="+IdCat;
		
	});
			});
	}
	
		
	});
	
	
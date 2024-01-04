$(document).ready(function(){
	
	var arrVariables = location.search.substring(1,location.search.length);
	
  var arrVariableActual = arrVariables.split("=");
	
     var NumPedido=arrVariableActual[1].substring(0,arrVariableActual[1].length-3);
     var Total =arrVariableActual[2];


        $.ajax({
		url:"http://localhost/php/AsperoDistritos.php",
		method:"POST",
		dataType:"json"}).done(function(data){
		    
		    	$.each(data,function(index,value){
			$("#inputDistrito").append("<option value='"+value.nomDistrito+"'>"+value.nomDistrito+"</option>");
			
				
		});
		    
		});
		
		$('#inputDistrito').change(function(){ 
		    
		    $("#inputDistrito option[value=3]").attr('selected', 'selected');
            
            
            
        });
	

        
        
		$("#confirmar").click(function(){
		   
		    var empresa=document.getElementById("inputEmpresa").value;
            var ruc = document.getElementById("inputRUC").value;
            var nombre =document.getElementById("inputNombre").value;
            var telefono = document.getElementById("inputTelefono").value;
            var email = document.getElementById("inputEmail").value;
            var direccion = document.getElementById("inputAddress").value +" "+ document.getElementById("inputAddress2").value;
            var sede =document.getElementById("inputSede").value;
            if(document.getElementById("#inputDistrito")!=null)
            var distrito =document.getElementById("#inputDistrito").value;
            else distrito = "LIMA";
        
        
            if(Total!=0&&NumPedido!=0){
                if(empresa.trim()!=""&&ruc.trim()!=""&&ruc.length==11&&nombre!=""&&telefono.trim()!=""&&email.trim()!=""&&direccion.trim()!=""&&sede.trim()!=""&&distrito.trim()!=""){
            $.ajax({
		url:"http://localhost/php/EnviarCorreo.php",
		method:"POST",
		dataType:"json",
		data:{emp:empresa,ruc:ruc,nom:nombre,tel:telefono,ema:email,dir:direccion,sede:sede,dis:distrito,num:NumPedido,tot:Total}
		
	});
	
        window.location.href="success.html";
            }
            else {
            alert("Se debe ingresar todos los campos");
            
            }
        }
       else{
            alert("No se ha realizado ningún pedido");
       }
       
		});
			
	
	
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
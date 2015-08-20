<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<title>formCliente.jsp</title>
</head>
<body>
	<div class="container">
		  <div class="row">
			<c:if test="${empty cliente.id}">
			<h1>Adicionar Cliente</h1>
				<form action="<c:url value='/cliente/adicionaCliente' />"  method="post">
				  <div class="form-group">
				    <label for="inputNome">Nome</label>
				    <input type="text" class="form-control" name="cliente.nome" value="${cliente.nome}" required>
				  </div>
				  <div class="form-group">
				    <label for="inputTelefone">Telefone</label>
				    <input type="text" class="form-control" name="cliente.telefone" value="${cliente.telefone}" id="txttelefone" pattern="\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4,5}" required>
				  </div>
				  <div class="form-group">
				    <label for="inputValor">Endereço</label>
				    <input type="text" class="form-control" name="cliente.endereco" value="${cliente.endereco}" required>
				  </div>
				  <button type="submit" class="btn btn-default">Salvar</button>
				</form>
			</c:if>
			<c:if test="${not empty cliente.id}">
				<h1>Alterar Cliente</h1>
					<form action="<c:url value="/cliente/update"/>" method="POST">
				      <input type="hidden" name="cliente.id" value="${cliente.id}">
				      <div class="form-group">
					    <label for="inputNome">Nome</label>
					    <input type="text" class="form-control" name="cliente.nome" value="${cliente.nome}" required>
					  </div>
					  <div class="form-group">
					    <label for="inputTelefone">Telefone</label>
					    <input type="text" class="form-control" name="cliente.telefone" value="${cliente.telefone}" id="txttelefone" pattern="\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4,5}" required>
					  </div>
					  <div class="form-group">
					    <label for="inputValor">Endereço</label>
					    <input type="text" class="form-control" name="cliente.endereco" value="${cliente.endereco}" required>
					  </div>
			         <button class="btn btn-warning" name="_method" value="PUT">
			           Alterar
			         </button>
				  </form>
			</c:if>
		</div>
		 <footer class="row">
			<c:forEach items="${errors}" var="erro" >
				<div class="alert alert-danger" role="alert"><c:out value="${erro.message}"/></div>
			</c:forEach>
		</footer>
	</div>
<script src="<%=request.getContextPath()%>/js/jquery-2.1.4.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery.mask.min.js"></script>
<script>
$(document).ready(function(){
	$("#txttelefone").mask("(00) 0000-00009");
});
</script>
</body>
</html>
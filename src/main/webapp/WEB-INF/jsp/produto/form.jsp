<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
	<title>produto - form.jsp</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<c:if test="${empty produto.id}">
			 <h1>Incluir Produto</h1>
				<form action="<c:url value='/produto/adiciona' />"  method="post">
				  <div class="form-group">
				    <label for="inputNome">Nome</label>
				    <input type="text" class="form-control" name="produto.nome" required>
				  </div>
				  <div class="form-group">
				    <label for="inputValor">Valor</label>
				    <input type="text" class="form-control" id="valor" name="produto.valor" required>
				  </div>
				  <button type="submit" class="btn btn-default">Adicionar</button>
				</form>
			</c:if>
			<c:if test="${not empty produto.id}">
				<h1>Alterar Produto</h1>
					<form action="<c:url value="/produto/update"/>" method="POST">
				    <input type="hidden" name="produto.id" value="${produto.id}">
				      <div class="form-group">
					    <label for="inputNome">Nome</label>
					    <input type="text" class="form-control" name="produto.nome" value="${produto.nome}" required>
					  </div>
					  <div class="form-group">
					    <label for="inputValor">Valor</label>
					    <input type="text" class="form-control" id="valor" name="produto.valor" value="${produto.valor}" required>
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
<script src="<%=request.getContextPath()%>/js/jquery.maskMoney.js"></script>
<script>
$(document).ready(function(){
    $("#valor").maskMoney({showSymbol:true, symbol:"R$", decimal:",", thousands:"."});
});
</script>
</body>
</html>
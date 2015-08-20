<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<title>formPedido.jsp</title>
</head>
<body>
	<div class="container">
		  <div class="row">
			<c:if test="${empty pedido.id}">
			<h1>Adicionar Pedido</h1>
				<form action="<c:url value='/pedido/adicionaPedido' />"  method="post">
                   <div class="form-group">
                       <label for="cliente">Cliente</label>
                         <select class="form-control" name="pedido.cliente.id" id="selCliente" required>
                             <option value="0"></option>
                             <c:forEach var="cliente" items="${clienteList}">
                                   <option value="${cliente.id}">${cliente.nome}</option>
                             </c:forEach>
                          </select>
                     </div>
                   	<div class="form-group">
                       <label for="cliente">Produtos</label>
                         <select multiple class="form-control" name="produtos" id="selProduto" required>
                             <c:forEach var="produto" items="${produtoList}">
                                   <option value="${produto.id}">${produto.nome}</option>
                             </c:forEach>
                          </select>
                     </div>
				  <button type="submit" class="btn btn-default">Salvar</button>
				</form>
			</c:if>
		</div>
		 <footer class="row">
			<c:forEach items="${errors}" var="erro" >
				<div class="alert alert-danger" role="alert"><c:out value="${erro.message}"/></div>
			</c:forEach>
		</footer>
	</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-2.1.4.min.js"></script>
</body>
</html>
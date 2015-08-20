<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<title>produtos - lista.jsp</title>
</head>
<body>
<div class="container">
	<header class="row">
		<h2>Produtos</h2>
	</header>
	<div class="row">
		<div class="col-md-4">
			<div class="btn-group-vertical" role="group">
				<a class="btn btn-warning" href="${linkTo[PedidoController].listaPedido()}" role="button">Voltar</a>
			</div>
		</div>
		<div class="col-md-8">
			<a class="btn btn-primary" href="${linkTo[ProdutoController].form()}" role="button">Adicionar</a>
			<table class="table table-stripped table-hover table-bordered">
				<thead>
					<tr>
						<th>Nome</th>
						<th>Valor</th>
						<th>Consultar</th>
						<th>Alterar</th>
						<th>Remover</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${produtoList}" var="produto">
						<tr>
							<td>${produto.nome}</td>
							<td>${produto.valor}</td>
							<td>
								<a class="btn btn-default" href="${linkTo[ProdutoController].ver()}${produto.id}" role="button">Consultar</a>
							</td>
							<td>
								<a class="btn btn-primary" href="${linkTo[ProdutoController].editar()}${produto.id}" role="button">Alterar</a>
							</td>
							<td>	
								<form action="<c:url value="/produto/${produto.id}"/>" method="POST">
						         <button class="btn btn-danger" onclick="return confirm('Deseja realmente remover este produto?');" name="_method" 
						           value="DELETE">
						           Remover
						         </button>
						       </form>
							</td>
						</tr>			
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<footer class="row">
		<c:if test="${mensagem != '' && !empty mensagem}">
			<div class="alert alert-success" role="alert"><c:out value="${mensagem}"/></div>
		</c:if>
	</footer>
</div>
</body>
</html>
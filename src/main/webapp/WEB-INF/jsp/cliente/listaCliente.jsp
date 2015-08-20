<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
<title>listaCliente.jsp</title>
</head>
<body>
	<div class="container">
		<header class="row">
			<a class="btn btn-primary" href="${linkTo[PedidoController].listaPedido()}" role="button">Pedidos</a>
			<a class="btn btn-warning" href="${linkTo[ClienteController].formCliente()}" role="button">Adicionar</a>
   		</header>
   		<div class="row">
			<table class="table table-stripped table-hover table-bordered">
				<thead>
					<tr>
						<th>Nome</th>
						<th>Telefone</th>
						<th>Endereço</th>
						<th>Consultar</th>
						<th>Alterar</th>
						<th>Excluir</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${clienteList}" var="cliente">
						<tr>
							<td>${cliente.nome}</td>
							<td>${cliente.telefone}</td>
							<td>${cliente.endereco}</td>
							<td>
								<a class="btn btn-default" href="${linkTo[ClienteController].verCliente()}${cliente.id}" role="button">Consultar</a>
							</td>
							<td>
								<a class="btn btn-primary" href="${linkTo[ClienteController].editarCliente()}${cliente.id}" role="button">Alterar</a>
							</td>
							<td>
								<form action="<c:url value="/cliente/${cliente.id}"/>" method="POST">
						         <button class="btn btn-danger" onclick="return confirm('Deseja realmente remover esse cliente?');" name="_method" 
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
		<footer class="row">
       		<c:if test="${mensagem != '' && !empty mensagem}">
			<div class="alert alert-success" role="alert"><c:out value="${mensagem}"/></div>
		</c:if>
   		</footer>
	</div>
</body>
</html>
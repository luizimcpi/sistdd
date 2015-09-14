<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="ls-theme-green">
  <head>
    <title>SisTDD - formCliente.jsp</title>

    <meta charset="utf-8">
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="description" content="Insira aqui a descri��o da p�gina.">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/locastyle.css">
    <link rel="icon" sizes="192x192" href="<%=request.getContextPath()%>/images/ico-boilerplate.png">
    <link rel="apple-touch-icon" href="<%=request.getContextPath()%>/images/ico-boilerplate.png">
  </head>
  <body>
    <div class="ls-topbar">

      <!-- Notification bar -->
      <div class="ls-notification-topbar">
        <!-- User details -->
        <div data-ls-module="dropdown" class="ls-dropdown ls-user-account">
          <a href="#" class="ls-ico-user">
          	Usu�rio Logado:	${usuarioLogado.usuario.nome}
          </a>
          <nav class="ls-dropdown-nav ls-user-menu">
            <ul>
              <li><a href="${linkTo[UsuarioController].logout()}">Logout</a></li>
            </ul>
          </nav>
        </div>
      </div>

      <span class="ls-show-sidebar ls-ico-menu"></span>

      <!-- Nome do produto/marca -->
      <h1 class="ls-brand-name"><a class="ls-ico-screen" href="#">SisTDD</a></h1>
    </div>

    <main class="ls-main ">
      <div class="container-fluid">
        <h1 class="ls-title-intro ls-ico-user">Cliente</h1>
          <section class="container">
                <div class="container">
                	 <c:if test="${empty cliente.id}">
	                	<h1>Adicionar Cliente</h1>
	                	<form action="<c:url value='/cliente/adicionaCliente' />"  method="post">
						  <fieldset>
							  <label class="ls-label col-md-3">
							    <b class="ls-label-text">Nome: </b>
							    <input type="text" class="form-control" name="cliente.nome" required>
							  </label>
							  <label class="ls-label col-md-3">
							    <b class="ls-label-text">Telefone: </b>
							    <input type="text" class="form-control" name="cliente.telefone" id="txttelefone" pattern="\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4,5}" required>
							  </label>
							  <label class="ls-label col-md-3">
							    <b class="ls-label-text">Endere�o: </b>
							    <input type="text" class="form-control" name="cliente.endereco" required>
							  </label>
						  </fieldset>
						  <div class="ls-actions-btn">
							  <button type="submit" class="ls-btn-primary ls-ico-checkmark">Salvar</button>
							  <a class="ls-btn-danger ls-ico-close" href="${linkTo[ClienteController].listaCliente()}" >Cancelar</a>
						  </div>
						</form>
					</c:if>
					<c:if test="${not empty cliente.id}">
					<h1>Alterar Cliente</h1>
						<form action="<c:url value="/cliente/update"/>" method="POST">
				     	 <input type="hidden" name="cliente.id" value="${cliente.id}">
						 <fieldset>
							  <label class="ls-label col-md-3">
							    <b class="ls-label-text">Nome:</b>
							   <input type="text" class="form-control" name="cliente.nome" value="${cliente.nome}" required>
							  </label>
							  <label class="ls-label col-md-3">
							    <b class="ls-label-text">Telefone:</b>
							    <input type="text" class="form-control" name="cliente.telefone" value="${cliente.telefone}" id="txttelefone" pattern="\([0-9]{2}\)[\s][0-9]{4}-[0-9]{4,5}" required>
							  </label>
							  <label class="ls-label col-md-3">
							    <b class="ls-label-text">Endere�o:</b>
							    <input type="text" class="form-control" name="cliente.endereco" value="${cliente.endereco}" required>
							  </label>
						  </fieldset>
						  <div class="ls-actions-btn">
							<button class="ls-btn-dark ls-ico-pencil" name="_method" value="PUT">
			          		 Alterar
			         		</button>
							<a class="ls-btn-danger ls-ico-close" href="${linkTo[ClienteController].listaCliente()}" >Cancelar</a>
						  </div>
						</form>
					</c:if>
                </div> <!-- /container -->
            </section>
      </div>
	  <c:forEach items="${errors}" var="erro" >
			<div class="ls-alert-danger" role="alert"><c:out value="${erro.message}"/></div>
	  </c:forEach>
    </main>

    <aside class="ls-sidebar">
      <!-- Defails of user account -->
      <div data-ls-module="dropdown" class="ls-dropdown ls-user-account">
        <a href="#" class="ls-ico-user">
        	Usu�rio Logado:	${usuarioLogado.usuario.nome}
        </a>
        <nav class="ls-dropdown-nav ls-user-menu">
            <ul>
              <li><a href="${linkTo[UsuarioController].logout()}">Logout</a></li>
            </ul>
          </nav>
      </div>

      <nav class="ls-menu">
        <ul>
          <li><a href="${linkTo[ClienteController].listaCliente()}" class="ls-ico-users">Clientes</a></li>
        </ul>
        <ul>
      	  <li><a href="${linkTo[ProdutoController].lista()}" class="ls-ico-cart">Produtos</a></li>
        </ul>
        <ul>
      	  <li><a href="${linkTo[PedidoController].listaPedido()}" class="ls-ico-docs">Pedidos</a></li>
        </ul>
      </nav>
    </aside>

    <script src="<%=request.getContextPath()%>/js/jquery-2.1.4.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/locastyle.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.mask.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#txttelefone").mask("(00) 0000-00009");
		});
	</script>
  </body>
</html>

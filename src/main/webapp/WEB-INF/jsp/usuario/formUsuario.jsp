<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html class="ls-theme-green">
  <head>
    <title>SisTDD - formUsuario.jsp</title>

    <meta charset="utf-8">
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <meta name="description" content="Insira aqui a descrição da página.">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/locastyle.css">
    <link rel="icon" sizes="192x192" href="<%=request.getContextPath()%>/images/ico-boilerplate.png">
    <link rel="apple-touch-icon" href="<%=request.getContextPath()%>/images/ico-boilerplate.png">
  </head>
  <body>
    <div class="ls-topbar">


      <!-- Nome do produto/marca -->
      <h1 class="ls-brand-name"><a class="ls-ico-screen" href="#">SisTDD</a></h1>
    </div>

    <main class="ls-main ">
      <div class="container-fluid">
        <h1 class="ls-title-intro ls-ico-user">Cadastro de Usuários</h1>
          <section class="container">
                <div class="container">
	                <c:if test="${empty usuario.id}">
	                <h1>Adicionar Usuário</h1>
	                	<form action="<c:url value='/usuario/adicionaUsuario' />"  method="post" class="ls-form row">
						  <fieldset>
							  <label class="ls-label col-md-3">
							    <b class="ls-label-text">Nome de Usuário</b>
							      <input type="text" class="form-control" name="usuario.nome" value="${usuario.nome}" required>
							  </label>
							  <label class="ls-label col-md-3">
							    <b class="ls-label-text">Senha</b>
							       <input type="password" class="form-control" name="usuario.senha" value="${usuario.senha}" required>
							  </label>
						  </fieldset>
						  <div class="ls-actions-btn">
							  <button type="submit" class="ls-btn-primary">Salvar</button>
							  <a class="ls-btn-danger" href="${linkTo[LoginController].formularioLogin()}" >Cancelar</a>
						  </div>
						</form>
					</c:if>
					<c:if test="${not empty usuario.id}">
					<h1>Alterar Usuário</h1>
						<form action="<c:url value="/usuario/update"/>" method="POST" class="ls-form row">
						 <input type="hidden" name="usuario.id" value="${usuario.id}">
						 <fieldset>
							  <label class="ls-label col-md-3">
							    <b class="ls-label-text">Nome de Usuário</b>
							      <input type="text" class="form-control" name="usuario.nome" value="${usuario.nome}" required>
							  </label>
							  <label class="ls-label col-md-3">
							    <b class="ls-label-text">Senha</b>
							       <input type="password" class="form-control" name="usuario.senha" value="${usuario.senha}" required>
							  </label>
						  </fieldset>
						  <div class="ls-actions-btn">
							<button class="ls-btn-dark" name="_method" value="PUT">
			          		 Alterar
			         		</button>
							<a class="ls-btn-danger" href="${linkTo[LoginController].formularioLogin()}" >Cancelar</a>
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

    <script src="<%=request.getContextPath()%>/js/jquery-2.1.4.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/locastyle.js"></script>
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="ls-theme-green">
<head>
  <meta charset="utf-8">
  <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
  <title>formularioLogin.jsp</title>
  <meta name="description" content="" />
  <meta name="keywords" content="" />
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/locastyle.css">
</head>
<body class="documentacao documentacao_exemplos documentacao_exemplos_login-screen documentacao_exemplos_login-screen_index">

<div class="ls-login-parent">
  <div class="ls-login-inner">
    <div class="ls-login-container">
      <div class="ls-login-box">
        <h1 class="ls-login-logo"><img title="Logo login" src="<%=request.getContextPath()%>/images/atendente.png" /></h1>
        <div class="doc-intro-content">
          <center><h1>SisTDD</h1></center>
        </div>
        <form role="form" class="ls-form ls-login-form" action="<c:url value='/login/autentica' />"  method="post">
          <fieldset>

            <label class="ls-label">
              <b class="ls-label-text ls-hidden-accessible">Usuário</b>
              <input class="ls-login-bg-user ls-field-lg" type="text" name="usuario.nome" placeholder="Usuário" required autofocus>
            </label>

            <label class="ls-label">
              <b class="ls-label-text ls-hidden-accessible">Senha</b>
              <div class="ls-prefix-group">
                <input id="password_field" class="ls-login-bg-password ls-field-lg" name="usuario.senha" type="password" placeholder="Senha" required>
                <a class="ls-label-text-prefix ls-toggle-pass ls-ico-eye" data-toggle-class="ls-ico-eye, ls-ico-eye-blocked" data-target="#password_field" href="#"></a>
              </div>
            </label>

            <input type="submit" value="Login" class="ls-btn-primary ls-btn-block ls-btn-lg">
            <a class="ls-btn-default ls-btn-block ls-btn-lg ls-ico-users" href="${linkTo[UsuarioController].formUsuario()}" >Cadastro</a>
          </fieldset>
        </form>
      </div>
    </div>
		<c:forEach items="${errors}" var="erro" >
			<div class="ls-alert-danger"><strong><c:out value="${erro.message}"/></strong></div>
		</c:forEach>
		<c:if test="${mensagem != '' && !empty mensagem}">
			<div class="ls-alert-success"><c:out value="${mensagem}"/></div>
		</c:if>
  </div>
</div>

<script src="<%=request.getContextPath()%>/js/jquery-2.1.4.min.js"></script>
<script src="<%=request.getContextPath()%>/js/locastyle.js"></script>

</body>
</html>

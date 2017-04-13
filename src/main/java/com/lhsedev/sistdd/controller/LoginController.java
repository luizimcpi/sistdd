package com.lhsedev.sistdd.controller;

import javax.inject.Inject;

import com.lhsedev.sistdd.dao.UsuarioDao;
import com.lhsedev.sistdd.model.Usuario;
import com.lhsedev.sistdd.sessao.UsuarioLogado;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.I18nMessage;
import br.com.caelum.vraptor.validator.Validator;

@Controller
public class LoginController {
	
	@Inject private UsuarioDao usuarioDao;
	@Inject private Validator validator;
	@Inject private Result result;
	@Inject private UsuarioLogado usuarioLogado;
	
	@Get("/") 
	public void formularioLogin(){
		
	}
	
	@Post 
	public void autentica(Usuario usuario){
		if(!usuarioDao.existe(usuario)){
			validator.add(new I18nMessage("login","login.invalido"));
			validator.onErrorUsePageOf(this).formularioLogin();
		}
		usuarioLogado.setUsuario(usuario);
		result.redirectTo(PedidoController.class).listaPedido();
	}
}

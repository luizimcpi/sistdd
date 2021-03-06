package com.lhsedev.sistdd.controller;

import javax.inject.Inject;

import com.lhsedev.sistdd.dao.UsuarioDao;
import com.lhsedev.sistdd.model.Usuario;
import com.lhsedev.sistdd.sessao.UsuarioLogado;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Put;
import br.com.caelum.vraptor.Result;

@Controller
public class UsuarioController {
	
	@Inject private UsuarioDao usuarioDao;
	@Inject private Result result;
	@Inject private UsuarioLogado usuarioLogado;
	
	@Get 
	public void listaUsuario(){
		result.include("usuarioList", usuarioDao.listaUsuario());
	}
	
	@Get 
	public void formUsuario(){
	}
	
	@Post
	public void adicionaUsuario(Usuario usuario){
		usuarioDao.adicionaUsuario(usuario);
		result.include("mensagem", "Usuário Adicionado com Sucesso!");
		result.redirectTo(LoginController.class).formularioLogin();
	}
	
	@Get("/usuario/editarUsuario/{usuario.id}") 
	public Usuario editarUsuario(Usuario usuario){
		return usuarioDao.buscarPorId(usuario.getId());
	}
	
	@Put("/usuario/update")
	public void update(Usuario usuario) {
		usuarioDao.atualizar(usuario);
		result.redirectTo(this).verUsuario(usuario);
	}
	
	@Delete("/usuario/{usuario.id}")
	public void remove(Usuario usuario) {
		usuarioDao.excluir(usuario);
		result.include("mensagem", "Usuario Removido com Sucesso!");
		result.redirectTo(this).listaUsuario();
	}
	
	@Get("/usuario/verUsuario/{usuario.id}") 
	public Usuario verUsuario(Usuario usuario) {
		return usuarioDao.buscarPorId(usuario.getId());
	}
	
	@Path("/logout")
	public void logout() {
	  usuarioLogado.logout();
	  result.redirectTo(LoginController.class).formularioLogin();
	}
	
}

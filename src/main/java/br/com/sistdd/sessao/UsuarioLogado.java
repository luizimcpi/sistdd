package br.com.sistdd.sessao;

import java.io.Serializable;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

import br.com.sistdd.model.Usuario;

@SessionScoped
@Named("usuarioLogado")
public class UsuarioLogado implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Usuario usuario;

	public Usuario getUsuario() {
		return usuario;
	}
	
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	
	public boolean isLogado(){
		return usuario != null;
	}
	
	public void logout() {
	    this.usuario = null;
	}
	
}

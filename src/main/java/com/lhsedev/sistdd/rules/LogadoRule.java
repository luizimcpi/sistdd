package com.lhsedev.sistdd.rules;

import javax.inject.Inject;

import com.lhsedev.sistdd.sessao.UsuarioLogado;

import br.com.caelum.brutauth.auth.annotations.HandledBy;
import br.com.caelum.brutauth.auth.rules.CustomBrutauthRule;

@HandledBy(LogadoHandler.class)
public class LogadoRule implements CustomBrutauthRule{
	
	@Inject UsuarioLogado usuarioLogado;

	public boolean isAllowed(){
		return usuarioLogado.isLogado();
	}

}

package com.lhsedev.sistdd.rules;

import javax.inject.Inject;

import com.lhsedev.sistdd.controller.LoginController;

import br.com.caelum.brutauth.auth.handlers.RuleHandler;
import br.com.caelum.vraptor.validator.I18nMessage;
import br.com.caelum.vraptor.validator.Validator;

public class LogadoHandler implements RuleHandler{

	@Inject Validator validator;

	@Override
	public void handle() {
		validator.add(new I18nMessage("login","login.sem.acesso"));
		validator.onErrorUsePageOf(LoginController.class).formularioLogin();
	}

}

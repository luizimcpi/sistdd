package br.com.sistdd.rules;

import javax.inject.Inject;

import br.com.caelum.brutauth.auth.handlers.RuleHandler;
import br.com.caelum.vraptor.validator.I18nMessage;
import br.com.caelum.vraptor.validator.Validator;
import br.com.sistdd.controller.LoginController;

public class LogadoHandler implements RuleHandler{

	@Inject Validator validator;

	@Override
	public void handle() {
		validator.add(new I18nMessage("login","login.sem.acesso"));
		validator.onErrorUsePageOf(LoginController.class).formularioLogin();
	}

}

package com.lhsedev.sistdd.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import com.lhsedev.sistdd.dao.ClienteDao;
import com.lhsedev.sistdd.model.Cliente;
import com.lhsedev.sistdd.rules.LogadoRule;
import com.lhsedev.sistdd.sessao.UsuarioLogado;

import br.com.caelum.brutauth.auth.annotations.CustomBrutauthRules;
import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Put;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.validator.Validator;

@Controller
@CustomBrutauthRules(LogadoRule.class)
public class ClienteController {
	
	@Inject private ClienteDao clienteDao;
	@Inject private Result result;
	@Inject private Validator validator;
	@Inject private UsuarioLogado usuarioLogado;
    private List<Cliente> clientes = new ArrayList<Cliente>();  

	
	@Get
	public void listaCliente(){
		result.include("clienteList", clienteDao.listaCliente());
	}
	
	@Get
	public void formCliente(){
	}
	
	@Post
	public void adicionaCliente(Cliente cliente){
       String mensagem ="";
        if(!isClienteMesmoNome(cliente.getNome())){
            clienteDao.adicionaCliente(cliente);
            mensagem = "Cliente Adicionado com Sucesso!";
        }else{
            mensagem = "Já existe um cliente cadastrado com o mesmo nome!";
        }
        result.include("mensagem", mensagem);
        result.redirectTo(this).listaCliente();
	}
	
	@Get("/cliente/editarCliente/{cliente.id}")
	public Cliente editarCliente(Cliente cliente){
		return clienteDao.buscarPorId(cliente.getId());
	}
	
	@Put("/cliente/update")
	public void update(Cliente cliente) {
		clienteDao.atualizar(cliente);
		result.redirectTo(this).verCliente(cliente);
	}
	
	@Delete("/cliente/{cliente.id}")
	public void remove(Cliente cliente) {
		try{
			clienteDao.excluir(cliente);
			result.include("mensagem", "Cliente Removido com Sucesso!");
			result.redirectTo(this).listaCliente();
		}catch (Exception e) {
			result.include("mensagem", "");
			result.include("erro", "Erro! - Cliente não pode ser Excluído!");
			result.redirectTo(this).listaCliente();
		}
		
		
	}
	
	@Get("/cliente/verCliente/{cliente.id}")
	public Cliente verCliente(Cliente cliente) {
		return clienteDao.buscarPorId(cliente.getId());
	}
	
    //Método Antes da refatoração
    public boolean isClienteMesmoNomePrimeiroRefactor(String nomeProcura, ClienteDao clienteDao){
       boolean flag = false;
        if(clienteDao.listaCliente() != null && clienteDao.listaCliente().size()> 0){
            for (Cliente clienteLista : clienteDao.listaCliente()) {
                if(nomeProcura.equalsIgnoreCase(clienteLista.getNome())){
                    flag = true;
                    break;
                }
            }
        }  
        return flag;
    }
    
      //Método refatorado pela primeira vez
      public boolean isClienteMesmoNomeSegundoRefactor(String nomeProcura){
        if(clienteDao.listaCliente() != null && clienteDao.listaCliente().size()> 0){
            for (Cliente clienteLista : clienteDao.listaCliente()) {
                if(nomeProcura.equalsIgnoreCase(clienteLista.getNome())){
                   return true;
                }
            }
        }  
        return false;
    }
      
      //Método refatorado pela segunda vez
      public boolean isClienteMesmoNome(String nomeProcura){
          if(this.getClientes() == null || this.getClientes().size() == 0){
              this.setClientes(clienteDao.listaCliente());
          }
          
          if(this.getClientes() != null && this.getClientes().size()> 0){
            for(Cliente clienteLista : this.getClientes()) {
                if(nomeProcura.equalsIgnoreCase(clienteLista.getNome())){
                   return true;
                }
            }
        }  
        return false;
    }
         
        public List<Cliente> getClientes() {
            return clientes;
        }

        public void setClientes(List<Cliente> clientes) {
            this.clientes = clientes;
        }
        
}

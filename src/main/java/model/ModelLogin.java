package model;

import jakarta.persistence.*;

import java.io.Serial;
import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Entity
public class ModelLogin implements Serializable {

	@Serial
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	private String nome;
	private String sobrenome;
	private String cpf;
	private String sexo;
	private Date dataNascimento;

	private String cep;
	private String logradouro;
	private String bairro;
	private String localidade;
	private String cidade;
	private String uf;
	private String numero;


	private Double rendaMensal;

	@OneToMany
	private List<ModelTelefone> telefones = new ArrayList<ModelTelefone>();


	public boolean isNovo() {

		if (this.id == null) {
			return true; /* Inserir um novo */
		} else if (this.id > 0) {
			return false; /* Atualizar */
		}

		return false;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getLogradouro() {
		return logradouro;
	}

	public void setLogradouro(String logradouro) {
		this.logradouro = logradouro;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}


	public List<ModelTelefone> getTelefones() {
		return telefones;
	}

	public void setTelefones(List<ModelTelefone> telefones) {
		this.telefones = telefones;
	}


	public String getMostraTelefoneRel() {

		String fone = "";

		for (ModelTelefone telefone : telefones) {
			fone += telefone.getNumero() + "\n";
		}
		return fone;
	}
}


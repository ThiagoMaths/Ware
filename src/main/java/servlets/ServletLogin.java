package servlets;

import java.io.IOException;

import dao.DAOLoginRepository;
import dao.DAOUsuarioRepository;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelLogin;

@WebServlet("/ServletLogin")/*Mapeamento de URL que vem da tela*/
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private final DAOLoginRepository daoLoginRepository = new DAOLoginRepository();
	private final DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();
	
    public ServletLogin() {
        ;
    }

	/*Recebe os dados pela url em parametros*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String acao = request.getParameter("acao");
		
		if (acao != null && acao.equalsIgnoreCase("logout")) {
			
			request.getSession().invalidate(); //invalidar a sessão
			RequestDispatcher redirecionar = request.getRequestDispatcher("index.jsp");
			redirecionar.forward(request, response);
		} else {

			doPost(request, response);
		}
	}

	/*Recebe os dados enviados por um formulario*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String url = request.getParameter("url");

		try {
		
				if (login != null && !login.isEmpty() && senha != null && !senha.isEmpty()) {
					
					ModelLogin modelLogin = new ModelLogin();
					modelLogin.setLogin(login);
					modelLogin.setSenha(senha);
					
					if (daoLoginRepository.validarAutenticacao(modelLogin)) { /*Simulando login*/
						
						modelLogin = daoUsuarioRepository.consultaUsuarioLogado(login);
						
						request.getSession().setAttribute("usuario", modelLogin.getLogin());
						request.getSession().setAttribute("perfil", modelLogin.getPerfil());

						if (url == null || url.equals("null")) {
							url = "principal/dashboard.jsp";
						}
						
						RequestDispatcher redirecionar = request.getRequestDispatcher(url);
						redirecionar.forward(request, response);
						
					}else {

						RequestDispatcher redirecionar = request.getRequestDispatcher("/index.jsp");
						request.setAttribute("msg", "Informe o login e senha corretamente!");
						redirecionar.forward(request, response);
					}
					
				}else {

					RequestDispatcher redirecionar = request.getRequestDispatcher("index.jsp");
					request.setAttribute("msg", "Informe o login e senha corretamente!");
					redirecionar.forward(request, response);
				}
		
		}catch (Exception e) {

			e.printStackTrace();
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}
		
	}

}
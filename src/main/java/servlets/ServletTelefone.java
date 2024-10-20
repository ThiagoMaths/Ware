package servlets;

import dao.DAOTelefoneRepository;
import dao.DAOUsuarioRepository;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ModelLogin;
import model.ModelTelefone;

import java.io.IOException;
import java.io.Serial;
import java.util.List;


@WebServlet("/ServletTelefone")
public class ServletTelefone extends ServletGenericUtil {
    @Serial
    private static final long serialVersionUID = 1L;

    private DAOUsuarioRepository daoUsuario = new DAOUsuarioRepository();
    private DAOTelefoneRepository daoTelefone = new DAOTelefoneRepository();

    public ServletTelefone() {
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String acao = request.getParameter("acao");

            if (acao != null && !acao.isEmpty() && acao.equals("excluir")) {

                String idfone = request.getParameter("id");
                daoTelefone.deleteFone(Long.parseLong(idfone));

                String userpai = request.getParameter("userpai");

                ModelLogin modelLogin = daoUsuario.consultaUsuarioID(Long.parseLong(userpai));

                List<ModelTelefone> telefones = daoTelefone.listFone(modelLogin.getId());
                request.setAttribute("msg", "Telefone excluido com sucesso!");
                request.setAttribute("modelTelefones", telefones);
                request.setAttribute("modelLogin", modelLogin);
                request.getRequestDispatcher("principal/telefone.jsp").forward(request, response);

                return;
            }

            String iduser = request.getParameter("iduser");

            if (iduser != null && !iduser.isEmpty()) {

                ModelLogin modelLogin = daoUsuario.consultaUsuarioID(Long.parseLong(iduser));

                List<ModelTelefone> telefones = daoTelefone.listFone(modelLogin.getId());
                request.setAttribute("modelTelefones", telefones);
                request.setAttribute("modelLogin", modelLogin);
                request.getRequestDispatcher("principal/telefone.jsp").forward(request, response);


            } else {
                List<ModelLogin> modelLogins = daoUsuarioRepository
                        .consultaUsuarioList(this.getUserLogado(request));
                request.setAttribute("modelLogins", modelLogins);
                request.setAttribute("totalPagina", daoUsuarioRepository.totalPagina(this.getUserLogado(request)));
                request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {


            String usuario_pai_id = request.getParameter("id");
            String numero = request.getParameter("numero");

            if (!daoTelefone.existeFone(numero, Long.valueOf(usuario_pai_id))) {

                ModelTelefone modelTelefone = new ModelTelefone();
                modelTelefone.setNumero(numero);
                modelTelefone.setUsuario_pai_id(daoUsuario.consultaUsuarioID(Long.parseLong(usuario_pai_id)));
                modelTelefone.setUsuario_cad_id(super.getUserLogadoObject(request));

                daoTelefone.gravaTelefone(modelTelefone);

                request.setAttribute("msg", "Salvo com sucesso!");

            } else {

                request.setAttribute("msg", "Telefone ja existe!");

            }

            List<ModelTelefone> telefones = daoTelefone.listFone(Long.parseLong(usuario_pai_id));
            ModelLogin modelLogin = daoUsuario.consultaUsuarioID(Long.parseLong(usuario_pai_id));
            request.setAttribute("modelLogin", modelLogin);
            request.setAttribute("modelTelefones", telefones);
            request.getRequestDispatcher("principal/telefone.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

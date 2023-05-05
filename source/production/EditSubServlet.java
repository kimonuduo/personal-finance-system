package production;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/editsub")
public class EditSubServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //接受客户端传递的参数
        String stime = req.getParameter("stime");
        String stype = req.getParameter("stype");
        String sprice = req.getParameter("sprice");

        //判断订阅时间是否为空
        if (stime == null || "".equals(stime.trim())){
            //提示用户信息
            req.setAttribute("msg","订阅时间不能为空");
            //跳转到sub_acc_editBills.jsp
            req.getRequestDispatcher("sub_acc_editSub.jsp").forward(req,resp);
            return;
        }

        //判断订阅种类是否为空
        if (stype == null || "".equals(stype.trim())){
            //提示用户信息
            req.setAttribute("msg","订阅种类不能为空");
            //跳转到sub_acc_editBills.jsp
            req.getRequestDispatcher("sub_acc_editSub.jsp").forward(req,resp);
            return;
        }

        //判断订阅价格是否为空
        if (sprice == null || "".equals(sprice .trim())){
            //提示用户信息
            req.setAttribute("msg","订阅价格不能为空");
            //跳转到sub_acc_editBills.jsp
            req.getRequestDispatcher("sub_acc_editSub.jsp").forward(req,resp);
            return;
        }

        //订单添加成功
        resp.sendRedirect("sub_accountBook.jsp");
    }
}

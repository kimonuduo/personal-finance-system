package production;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/editbills")
public class EditBillsServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //接受客户端传递的参数
        String btime = req.getParameter("btime");
        String btype = req.getParameter("btype");
        String bprice = req.getParameter("bprice");

        //判断订单时间是否为空
        if (btime == null || "".equals(btime.trim())){
            //提示用户信息
            req.setAttribute("msg","订单时间不能为空");
            //跳转到sub_acc_editBills.jsp
            req.getRequestDispatcher("sub_acc_editBills.jsp").forward(req,resp);
            return;
        }

        //判断订单种类是否为空
        if (btype == null || "".equals(btype.trim())){
            //提示用户信息
            req.setAttribute("msg","订单种类不能为空");
            //跳转到sub_acc_editBills.jsp
            req.getRequestDispatcher("sub_acc_editBills.jsp").forward(req,resp);
            return;
        }

        //判断订单价格是否为空
        if (bprice == null || "".equals(bprice .trim())){
            //提示用户信息
            req.setAttribute("msg","订单价格不能为空");
            //跳转到sub_acc_editBills.jsp
            req.getRequestDispatcher("sub_acc_editBills.jsp").forward(req,resp);
            return;
        }

        //订单添加成功
        resp.sendRedirect("sub_accountBook.jsp");
    }
}

package com.hr.sm.controller;

import com.hr.sm.util.CodeTools;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
public class YanzmController {
    @RequestMapping("/YanzmServlet")
    public String Yanzm(HttpServletRequest req, HttpServletResponse resp){
        System.out.println("验证码");
        int width = 65;
        int height = 40;

        BufferedImage bi = new BufferedImage(width, height, 1);


        Graphics g = bi.getGraphics();


        g.setColor(Color.white);
        g.fillRect(0, 0, width, height);


        g.setColor(Color.blue);


        CodeTools ct = new CodeTools();
        String str = ct.getValidateCode();

        HttpSession session = req.getSession();
        session.setAttribute("yzm", str);

        g.setFont(new Font("宋体", 3, 26));
        g.drawString(str, 6, 24);


        g.dispose();

        ServletOutputStream os = null;
        try {
            os = resp.getOutputStream();
            ImageIO.write(bi, "jpg", os);
            os.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "login";
    }
}

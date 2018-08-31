package com.finance.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class ValidateCode {

	@RequestMapping(value = "/getValidateCode.do",method = RequestMethod.GET)
    private void generateCode(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
    	Random random = new Random();

        // 定义验证码的位数
        int size = 5;

        // 定义变量保存生成的验证码
        String vCode = "";
        char c;
        // 产生验证�?
        for (int i = 0; i < size; i++) {
            // 产生�?�?26以内的随机整�?
            int number = random.nextInt(26);
            // 如果生成的是偶数，则随机生成�?个数�?
            if (number % 2 == 0) {
                c = (char) ('0' + (char) ((int) (Math.random() * 10)));
                // 如果生成的是奇数，则随机生成�?个字�?
            } else {
                c = (char) ((char) ((int) (Math.random() * 26)) + 'A');
            }
            vCode = vCode + c;
        }

        // 保存生成�?5位验证码
        request.getSession().setAttribute("vCode", vCode);

        // 验证码图片的生成
        // 定义图片的宽度和高度
        int width = (int) Math.ceil(size * 20);
        int height = 50;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        // 获取图片的上下文
        Graphics gr = image.getGraphics();
        // 设定图片背景颜色
        gr.setColor(Color.WHITE);
        gr.fillRect(0, 0, width, height);
        // 设定图片边框
        gr.setColor(Color.GRAY);
        gr.drawRect(0, 0, width - 1, height - 1);
        // 画十条干扰线
        for (int i = 0; i < 5; i++) {
            int x1 = random.nextInt(width);
            int y1 = random.nextInt(height);
            int x2 = random.nextInt(width);
            int y2 = random.nextInt(height);
            gr.setColor(randomColor());
            gr.drawLine(x1, y1, x2, y2);
        }
        // 设置字体，画验证�?
        gr.setColor(randomColor());
        gr.setFont(randomFont());
        gr.drawString(vCode, 10, 22);
        // 图像生效
        gr.dispose();
        // 输出到页�?
        ImageIO.write(image, "JPEG", response.getOutputStream());

    }
    

	// 生成随机的颜�?
    private Color randomColor() {
        int red = r.nextInt(150);
        int green = r.nextInt(150);
        int blue = r.nextInt(150);
        return new Color(red, green, blue);
    }

    private String[] fontNames = { "宋体", "华文楷体", "黑体", "微软雅黑", "楷体_GB2312" };
    private Random r = new Random();
	
    // 生成随机的字�?
    private Font randomFont() {
        int index = r.nextInt(fontNames.length);
        String fontName = fontNames[index];// 生成随机的字体名�?
        int style = r.nextInt(4);
        int size = r.nextInt(3) + 24; // 生成随机字号, 24 ~ 28
        return new Font(fontName, style, size);
    }
}

package com.wdhcr.servlet;

import com.wdhcr.bean.Stock;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class ActionServlet extends HttpServlet{
    public void service(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        System.out.println("service()");
        //获得请求路径
        String uri=request.getRequestURI();
        System.out.println(uri);
        //分析请求路径
        String action=uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
        System.out.println(action);
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        if("/quoto".equals(action)){
            //模拟生成几支股票信息
            List<Stock> stocks=new ArrayList<Stock>();
            Random r=new Random();
            for(int i=0;i<8;i++){
                Stock s=new Stock();
                s.setCode("600877"+r.nextInt(10));
                s.setName("中国嘉陵"+r.nextInt(100));
                s.setPrice(10+r.nextInt(1000));
                stocks.add(s);
            }
            //fromObject方法的参数可以是属猪或者结合
            JSONArray jsonArr=JSONArray.fromObject(stocks);
            String jsonStr=jsonArr.toString();
            System.out.println(jsonStr);
            out.println(jsonStr);
        }
    }
}

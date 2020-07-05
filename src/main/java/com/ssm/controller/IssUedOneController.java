package com.ssm.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.entity.MainModel;
import com.ssm.service.MainModelService;



@Controller
public class IssUedOneController {
	@Autowired		
	private MainModelService mainModelService;
	
	@RequestMapping("/issuedmaterial")
	public String printOne(Model model,String para) throws IOException{
		List<MainModel> list = mainModelService.selectOrderManagement();
		
		//客户端请求与本机在20006端口建立TCP连接
		 Socket client = new Socket("127.0.0.1", 10000);  
	     client.setSoTimeout(10000);
	     //获取Socket的输出流，用来发送数据到服务端    
	     PrintStream out = new PrintStream(client.getOutputStream());  
	     //获取Socket的输入流，用来接收从服务端发送过来的数据    
	     BufferedReader buf =  new BufferedReader(new InputStreamReader(client.getInputStream()));
	     
	     int i=0;
	     for (MainModel mainModel : list) {
	        	if (mainModel.getBom_descCH().equals(para)) {
	        	i=i+1;
	        	String Co_no = mainModel.getCo_no();
	        	String All_no = mainModel.getAll_no();
	        	String Bom_Pn = mainModel.getBom_PN();
	        	out.println(i);
	        	out.println(Co_no);
			    out.println(All_no);
			    out.println(Bom_Pn);
			    out.println(1);
			    try{  
		             //从服务器端接收数据有个时间限制（系统自设，也可以自己设置），超过了这个时间，便会抛出该异常  
			    	String echo = buf.readLine(); 
				    String echo1 = buf.readLine();
				    String echo2 = buf.readLine();
				    String echo3 = buf.readLine();
				    String echo4 = buf.readLine();
				    System.out.println("序号"+echo);
		            System.out.println("车身号"+echo1);
		            System.out.println("车型"+echo2);
		            System.out.println("零件号"+echo3);
		            System.out.println("数量"+echo4);  
		         }catch(SocketTimeoutException e){  
		             System.out.println("Time out, No response");  
		         }
	        	}
			}
	     if(client != null){  
	            //如果构造函数建立起了连接，则关闭套接字，如果没有建立起连接，自然不用关闭  
	            client.close(); //只关闭socket，其关联的输入输出流也会被关闭  
	       }
	     
	     
		return "issuedsuccess";
	}
}

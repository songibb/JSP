package co.micol.notice;


import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.micol.notice.common.Command;
import co.micol.notice.product.service.ProductService;
import co.micol.notice.product.service.ProductVO;
import co.micol.notice.product.serviceImpl.ProductServiceImpl;

public class ProductInsert implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 제품 등록 처리 및 파일 업로드
		ProductService ps = new ProductServiceImpl();
		ProductVO vo = new ProductVO();
		
//		String saveDir = "c:/temp/";   
		String saveDir = "upload/"; 
		int maxSize = 100 * 1024 * 1024;  //최대 100mb까지 파일 전송 (디폴트는 200mb까지 전송)
		
		try {
			MultipartRequest multi = new MultipartRequest(request, saveDir, 
										maxSize, "utf-8", new DefaultFileRenamePolicy());
			String pfile = multi.getFilesystemName("pfile");   //메모리에 있던 것이 물리적인 경로(saveDir)에 들어감
			pfile = saveDir + pfile;  //물리적 저장 위치를 정확히 알기 위해. (다운르도시 필요)
			String ofile = multi.getOriginalFileName("pfile");  
			
			vo.setProductId(multi.getParameter("productId"));
			//System.out.println(vo.getProductId());
			vo.setProductName(multi.getParameter("productName"));
			if(ofile != null) {  //null이 아니면 첨부파일이 존재
				vo.setProductImage(ofile);
				vo.setProductDir(pfile);
			}
			ps.productInsert(vo);
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		//vo.setProductName(request.getParameter("productName"));
		//System.out.println(vo.getProductName());   //request객체는 못 읽음
		return "productList.do";

		
	}

}

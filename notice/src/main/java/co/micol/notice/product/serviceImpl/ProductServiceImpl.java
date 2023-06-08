package co.micol.notice.product.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.micol.notice.common.DataSource;
import co.micol.notice.product.service.ProductMapper;
import co.micol.notice.product.service.ProductService;
import co.micol.notice.product.service.ProductVO;

public class ProductServiceImpl implements ProductService{
	
	SqlSession sqlSession = DataSource.getInstance().openSession(true);  //DAO 선언. 자동 commit을 위해 true
	ProductMapper map = sqlSession.getMapper(ProductMapper.class);  //mapper 선언.
	
	@Override
	public List<ProductVO> productSelectList() {
		return map.productSelectList();
	}

	@Override
	public ProductVO productSelect(ProductVO vo) {
		return map.productSelect(vo);
	}

	@Override
	public int productInsert(ProductVO vo) {
		return map.productInsert(vo);
	}

	@Override
	public int productUpdate(ProductVO vo) {
		return map.productUpdate(vo);
	}

	@Override
	public int productDelete(ProductVO vo) {
		return map.productDelete(vo);
	}

}

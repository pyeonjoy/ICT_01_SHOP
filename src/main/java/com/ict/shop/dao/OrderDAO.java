package com.ict.shop.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.CartListVO;
import com.ict.shop.dao.vo.OrderVO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<OrderVO> getAddrlist(OrderVO ovo) {
		try {
			return sqlSessionTemplate.selectList("order.addrlist",ovo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public List<CartListVO> getCartList(String user_idx) {
		try {
			return sqlSessionTemplate.selectList("order.cartlist", user_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public int getCartlistDelete(String cartlist_idx) {
		try {
			return sqlSessionTemplate.delete("order.cartlist_delete", cartlist_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	public int getCartlistEdit(CartListVO cvo) {
		try {
			return sqlSessionTemplate.update("order.cartlist_edit", cvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	public List<CartListVO> getCartlistOrderIdx() {
		try {
			return sqlSessionTemplate.selectList("order.cartlist_order_list");
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public int getCartlistPass(CartListVO cvo) {
		try {
			return sqlSessionTemplate.insert("order.cartlist_pass", cvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	}

	public CartListVO getCartlistSelect(String cartlist_idx) {
		try {
			return sqlSessionTemplate.selectOne("order.cartlist_select", cartlist_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public CartListVO getCartListAddr(String user_idx) {
		try {
			return sqlSessionTemplate.selectOne("order.cartlist_addr", user_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}


	// order_pay
	public List<OrderVO> orderaddrproduct(OrderVO ovo) {
		try {
			return sqlSessionTemplate.selectList("order.orderaddrproduct", ovo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;

	}

	// 1을 0으로 변경
	public int getaddrcheckedmin(AddrVO avo) {
		try {
			return sqlSessionTemplate.update("order.ordercheckmin", avo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	// addr_idx에 해당하는 base를 1로 set
	public int getaddrchecked(AddrVO avo) {
		try {
			return sqlSessionTemplate.update("order.ordercheck", avo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public int getOrderSuccess(String order_idx) {
		try {
			return sqlSessionTemplate.update("order.orderSuccess", order_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	public int orderupdate1(String order_idx) {
		try {
			return sqlSessionTemplate.delete("mypage.orderupdate1",order_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	

	// order_success
	public List<OrderVO> getOrderSuccessPage(String order_idx) {
		try {
			return sqlSessionTemplate.selectList("order.odersuccess_page", order_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}


}

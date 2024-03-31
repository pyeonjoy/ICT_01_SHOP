package com.ict.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.shop.dao.LoginDAO;
import com.ict.shop.dao.MypageDAO;
import com.ict.shop.dao.OrderDAO;
import com.ict.shop.dao.ProductDAO;
import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.HeartVO;
import com.ict.shop.dao.vo.OrderVO;
import com.ict.shop.dao.vo.ProductVO;
import com.ict.shop.dao.vo.UserVO;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private LoginDAO ldao;
	@Autowired
	private MypageDAO mdao;
	@Autowired
	private OrderDAO odao;
	@Autowired
	private ProductDAO pdao;

	// 주인없음
	@Override
	public UserVO getUserDetail(String idx) {
		return null;
	}

// login============================================================================================
	@Override
	public int getShop_Insert(UserVO vo) {
		return ldao.getShopInsert(vo);

	}

	@Override
	public UserVO getShop_Login(UserVO vo) {
		return ldao.getShopLogin(vo);
	}

	@Override
	public UserVO find_id(UserVO vo) {
		System.out.println("여긴들리니..섭스임플" + vo.getUser_name());
		System.out.println("여긴들리니..섭스임플" + vo.getUser_email());
		return ldao.find_id(vo);
	}

//mypage============================================================================================

	//mypage_addr
	@Override
	public int getAddrInsert(AddrVO avo) {
		return mdao.getAddrInsert(avo);
	}

	@Override
	public AddrVO getAddrDetail(AddrVO avo) {
		return mdao.getAddrDetail(avo);
	}

	@Override
	public List<AddrVO> getAddrList() {
		return mdao.getAddrlist();
	}
	
	@Override
	public int getAddrEdit(AddrVO avo) {
		return mdao.getAddrEdit(avo);
	}
	
	@Override
	public OrderVO getOrderDetail(String order_idx) {
		return mdao.getOrderDetail(order_idx);
	}

	@Override
	public ProductVO getProductDetail(String product_idx) {
		return mdao.getProductDetail(product_idx);
	}

	@Override
	public int getChangePwd(UserVO uvo) {
		return mdao.getChangePwd(uvo);
	}

	
	//mypage_order
	public List<OrderVO> getShopOrderList() {
		return mdao.getShopOrderList();
	}
	 @Override
	    public List<OrderVO> getOrderList(String order_idx, String product_idx) {
	        return mdao.getOrderList(order_idx, product_idx);
	    }
	
	//mypage_firstchk
	@Override
	public UserVO firstchk(String user_id) {

		return mdao.firstchk(user_id);
	}
	
	//mypage_heart
		@Override
		public List<HeartVO> getShopHeartList() {
			return mdao.getShopHeartList();
		}
		
		
//order============================================================================================
	@Override
	public List<ProductVO> getProductList() {
		return odao.getProductList();
	}

	@Override
	public List<UserVO> getUserList() {
		return odao.getUserList();
	}

	


//product============================================================================================


}

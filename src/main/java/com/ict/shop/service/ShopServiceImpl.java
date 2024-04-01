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
	@Override
	public UserVO find_pwd(UserVO uvo) {
		return ldao.find_pwd(uvo);
	}
	@Override
	public int reset_pwd(UserVO uvo) {
		return ldao.reset_pwd(uvo);
	}

//mypage============================================================================================

	@Override
	public OrderVO getOrderDetail(String order_idx) {
		return mdao.getOrderDetail(order_idx);
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


		@Override
		public List<UserVO> getUserList() {
			// TODO Auto-generated method stub
			return null;
		}
		

	//mypage_addr
		@Override
		public int getAddrInsert(AddrVO avo) {
			return mdao.getAddrInsert(avo);
		}
		
		@Override
		public AddrVO getAddrDetail(AddrVO avo) {
			System.out.println("서비스임플: "+avo.getAddr_addr());
			return mdao.getAddrDetail(avo);
		}
		
		@Override

		public UserVO getUser_id(String user_id) {
			return mdao.getUser_id(user_id);
		}
		
		@Override
		public UserVO getMypage_Info(String user_id) {
			return mdao.getMypage_Info(user_id);
		}
		@Override
		public int Mypage_Info_Change(String user_id) {
			return mdao.Mypage_Info_Change(user_id);
		}

		public List<AddrVO> getAddrList() {
			return mdao.getAddrlist();
		}
		
		@Override
		public int getAddrEdit(AddrVO avo) {
			return mdao.getAddrEdit(avo);
		}

		


//order============================================================================================
		//order_pay
		@Override
		public OrderVO getAddrProductOrder(String user_idx) {
			return odao.getAddrProductOrder(user_idx);
		}

		
//product============================================================================================

	@Override
	public List<CartListVO> getCartList(String user_idx) {
		return odao.getCartList(user_idx);
	}

	@Override
	public int getCartlistDelete(String cartlist_idx) {
		return odao.getCartlistDelete(cartlist_idx);
	}
	
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
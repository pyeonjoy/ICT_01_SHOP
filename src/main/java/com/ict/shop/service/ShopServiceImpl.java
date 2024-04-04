package com.ict.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.shop.dao.LoginDAO;
import com.ict.shop.dao.MypageDAO;
import com.ict.shop.dao.OrderDAO;
import com.ict.shop.dao.ProductDAO;
import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.CartListVO;
import com.ict.shop.dao.vo.HeartVO;
import com.ict.shop.dao.vo.OrderVO;
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

	@Override
	public String getShopIdChk(String user_id) {
		return ldao.getShopIdChk(user_id);
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

	// mypage_order
	public List<OrderVO> getShopOrderList() {
		return mdao.getShopOrderList();
	}

	@Override
	public List<OrderVO> getOrderList(String user_idx) {
		return mdao.getOrderList(user_idx);
	}

	// mypage_firstchk
	@Override
	public UserVO firstchk(String user_id) {

		return mdao.firstchk(user_id);
	}

	
	//mypage_heart
		@Override
		public List<HeartVO> getShopHeartList() {
			return mdao.getShopHeartList();
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
		public int getAddrDelete(String addr_idx) {
			return mdao.getAddrDelete(addr_idx);
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
		public int Mypage_Info_Change(UserVO uvo) {
			return mdao.Mypage_Info_Change(uvo);
		}

		public List<AddrVO> getAddrList(String user_idx) {
			return mdao.getAddrlist(user_idx);
		}
		
		@Override
		public int getAddrEdit(AddrVO avo) {
			return mdao.getAddrEdit(avo);
		}


//order============================================================================================
	@Override
	public List<CartListVO> getCartList(String user_idx) {
		return odao.getCartList(user_idx);
	}

	@Override
	public int getCartlistDelete(String cartlist_idx) {
		return odao.getCartlistDelete(cartlist_idx);
	}

	@Override
	public int getCartlistEdit(CartListVO cvo) {
		return odao.getCartlistEdit(cvo);
	}

	@Override
	public int getCartlistPass(CartListVO cvo) {
		return odao.getCartlistPass(cvo);
	}

	@Override
	public List<OrderVO> getCartlistOrderIdx() {
		return odao.getCartlistOrderIdx();
	}

	@Override
	public CartListVO getCartlistSelect(String cartlist_idx) {
		return odao.getCartlistSelect(cartlist_idx);
	}

	@Override
	public List<OrderVO> orderaddrproduct(String order_idx) {
		return odao.orderaddrproduct(order_idx);
	}

	@Override
	public List<UserVO> getUserList() {
		return null;
	}

}

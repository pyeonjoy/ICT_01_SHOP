package com.ict.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ict.shop.dao.LoginDAO;
import com.ict.shop.dao.MypageDAO;
import com.ict.shop.dao.OrderDAO;
import com.ict.shop.dao.ProductDAO;
import com.ict.shop.dao.vo.AddrVO;
import com.ict.shop.dao.vo.CartListVO;
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

	@Override
	public String getShopIdChk(String user_id) {
		return ldao.getShopIdChk(user_id);
	}

	@Override
	public int getShop_Insert_addr(UserVO vo) {
		return ldao.getShop_Insert_addr(vo);
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
	public List<OrderVO> getShopOrderList(String user_idx) {
		return mdao.getShopOrderList(user_idx);
	}

	@Override
	public List<OrderVO> getOrderList(String user_idx) {

		return mdao.getOrderList(user_idx);
	}

	@Override
	public int getDeliveryStatus(List<OrderVO> ovo) {
		return mdao.getDeliveryStatus(ovo);
	}

	@Override
	public List<OrderVO> getOrderList2(String user_idx) {
		return mdao.getOrderList2(user_idx);
	}

	// mypage_firstchk
	@Override
	public UserVO firstchk(String user_id) {

		return mdao.firstchk(user_id);
	}

	// mypage_heart
	@Override
	public List<OrderVO> getShopHeartList(String user_idx) {
		return mdao.getShopHeartList(user_idx);
	}

	// mypage_addr
	@Override
	public int getAddrInsert(AddrVO avo) {
		return mdao.getAddrInsert(avo);
	}

	@Override
	public AddrVO getAddrDetail(AddrVO avo) {
		System.out.println("서비스임플: " + avo.getAddr_addr());
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

	public List<OrderVO> getAddrList(OrderVO ovo) {
		return mdao.getAddrlist(ovo);
	}

	public List<AddrVO> getMyAddrList(String user_idx) {
		return mdao.getMyAddrlist(user_idx);
	}

	@Override
	public int getAddrEdit(AddrVO avo) {
		return mdao.getAddrEdit(avo);
	}

	@Override
	public int getCartListAdd(OrderVO ovo) {

		return mdao.getCartListAdd(ovo);
	}

//order============================================================================================
	@Override
	public int orderupdate1(String order_idx) {
		return odao.orderupdate1(order_idx);
	}

	@Override
	public int orderupdate2(String order_idx) {
		return mdao.orderupdate2(order_idx);
	}

	@Override
	public int orderupdate3(String order_idx) {
		return mdao.orderupdate3(order_idx);
	}

	@Override
	public int orderupdate4(String order_idx) {
		return mdao.orderupdate4(order_idx);
	}

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
	public List<CartListVO> getCartlistOrderIdx() {
		return odao.getCartlistOrderIdx();
	}

	@Override
	public CartListVO getCartListAddr(String user_idx) {
		return odao.getCartListAddr(user_idx);
	}

	@Override
	public CartListVO getCartlistSelect(String cartlist_idx) {
		return odao.getCartlistSelect(cartlist_idx);
	}

	@Override
	public List<OrderVO> orderaddrproduct(OrderVO ovo) {
		return odao.orderaddrproduct(ovo);
	}

	@Transactional
	@Override
	public int getaddrchecked(AddrVO avo) {
		int result2 = odao.getaddrcheckedmin(avo); // 1을 0으로
		int result1 = odao.getaddrchecked(avo); // addr_idx의 base를 1로
		System.out.println("result2 : " + result2);
		System.out.println("result1 : " + result1);
		// 각 데이터베이스 작업이 성공하면 1을 반환, 그렇지 않으면 -1을 반환
		if (result1 == 1 && result2 == 1) {
			return 1; // 성공
		} else {
			return -1; // 실패
		}
	}

	@Override
	public int getOrderSuccess(String order_idx) {
		return odao.getOrderSuccess(order_idx);
	}


	@Override
	public List<OrderVO> getOrderSuccessPage(String order_idx) {
		return odao.getOrderSuccessPage(order_idx);
	}

	// product detail
	@Override
	public List<ProductVO> productDetailList() throws Exception {
		return pdao.productDetailList();
	}

	@Override
	public ProductVO productDetailInfo(String product_idx) throws Exception {
		return pdao.productDetailInfo(product_idx);
	}

	@Override
	public int getProductDetailAddCart(ProductVO pvo) throws Exception {
		return pdao.getProductDetailAddCart(pvo);
	}
	
	//product
	 

    @Override
    public List<ProductVO> getShopList(ProductVO pvo)throws Exception {
        return pdao.getShopList(pvo);
    }
    @Override
    public ProductVO getShopDetail(String product_idx)throws Exception {
        return pdao.getShopDetail(product_idx);
    }
    @Override
    public CartListVO getCartChk(String user_idx, String product_idx) {
        return pdao.getCartChk(user_idx, product_idx);
    }


    @Override
    public int cartUpdate(CartListVO cvo){
        return pdao.cartUpdate(cvo);
    }

	@Override
	public int getRemoveHeart(String product_idx, String user_idx, String heart_idx) {
		return mdao.getRemoveHeart(product_idx, user_idx, heart_idx);
	}
	
	@Override
	public int getAddHeart(String product_idx, String user_idx) {
		return mdao.getAddHeart(product_idx, user_idx);
	}
    
	public List<ProductVO> getShopListbalm(ProductVO pvo) {
		return pdao.getShopListbalm(pvo);
	}
	@Override
	public int ProductAddCart(String product_idx, String user_idx,String product_price) {
		return pdao.ProductAddCart(product_idx,user_idx,product_price);
	}

}

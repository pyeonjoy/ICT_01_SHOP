package com.ict.shop.service.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.shop.dao.BoardDAO;
import com.ict.shop.dao.vo.BoardVO;
import com.ict.shop.dao.ReviewDAO;
import com.ict.shop.dao.vo.ReviewVO;
import com.ict.shop.service.board.BoardService;
import com.ict.shop.service.review.ShopReviewService;

@Service
public class ShopReviewServiceImpl implements ShopReviewService {
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public int getTotalCount() {
		return reviewDAO.getTotalCount();
	}

	@Override
	public List<ReviewVO> getReviewList(int offset, int limit, String user_idx) {
		return reviewDAO.getReviewList(offset, limit, user_idx);
	}

	@Override
	public int getReviewInsert(ReviewVO rvo) {
		return reviewDAO.getReviewInsert(rvo);
	}

	@Override
	public int getReviewHit(String re_idx) {
		return reviewDAO.getReviewHit(re_idx);
	}

	@Override
	public ReviewVO getReviewDetail(String re_idx) {
		return reviewDAO.getReviewDetail(re_idx);
	}

	@Override
	public int getLevUpdate(Map<String, Integer> map) {
		return reviewDAO.getLevUpdate(map);
	}

	@Override
	public int getAnsInsert(ReviewVO rvo) {
		return reviewDAO.getAnsInsert(rvo);
	}

	@Override
	public int getReviewDelete(ReviewVO rvo) {
		return reviewDAO.getReviewDelete(rvo);
	}

	@Override
	public int getReviewUpdate(ReviewVO rvo) {
		return reviewDAO.getReviewUpdate(rvo);
	}
}

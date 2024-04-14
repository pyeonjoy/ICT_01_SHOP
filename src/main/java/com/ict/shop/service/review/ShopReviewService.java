package com.ict.shop.service.review;

import java.util.List;
import java.util.Map;

import com.ict.shop.dao.vo.BoardVO;
import com.ict.shop.dao.vo.ReviewVO;

public interface ShopReviewService {
	public int getTotalCount();

	public List<ReviewVO> getReviewList(int offset, int limit, String user_idx);

	public int getReviewInsert(ReviewVO rvo);

	public int getReviewHit(String re_idx);

	public ReviewVO getReviewDetail(String re_idx);

	public int getLevUpdate(Map<String, Integer> map);

	public int getAnsInsert(ReviewVO rvo);

	public int getReviewDelete(ReviewVO rvo);

	public int getReviewUpdate(ReviewVO rvo);
}

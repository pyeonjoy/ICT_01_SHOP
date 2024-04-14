package com.ict.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.shop.dao.vo.BoardVO;
import com.ict.shop.dao.vo.ReviewVO;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int getTotalCount() {
		try {
		 return sqlSessionTemplate.selectOne("review.count");	
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public List<ReviewVO> getReviewList(int offset, int limit, String user_idx) {
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("offset", offset);
			map.put("limit", limit);
			map.put("user_idx", user_idx);
		return sqlSessionTemplate.selectList("review.review_list", map );
		}catch (Exception e) {
		System.out.println(e);
	}
		return null;
	}

	public int getReviewInsert(ReviewVO rvo) {
		try {
			return sqlSessionTemplate.insert("review.review_insert", rvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public int getReviewHit(String re_idx) {
		try {
			return sqlSessionTemplate.update("review.review_hit", re_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public ReviewVO getReviewDetail(String re_idx) {
		try {
			return sqlSessionTemplate.selectOne("review.review_detail", re_idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}

	public int getLevUpdate(Map<String, Integer> map) {
		try {
			return sqlSessionTemplate.update("review.lev_update", map);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

	public int getAnsInsert(ReviewVO rvo) {
		try {
			return sqlSessionTemplate.insert("review.ans_insert", rvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public int getReviewDelete(ReviewVO rvo) {
		try {
			
			if(rvo.getStep().equals("0")) {
				return sqlSessionTemplate.update("review.review_delete", rvo);
			}else {
				return sqlSessionTemplate.delete("review.review_ans_delete", rvo);
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}
	
	public int getReviewUpdate(ReviewVO rvo) {
		try {
			return sqlSessionTemplate.update("review.review_update", rvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return -1;
	}

}











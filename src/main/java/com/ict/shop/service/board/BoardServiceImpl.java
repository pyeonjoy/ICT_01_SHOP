package com.ict.shop.service.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.shop.dao.BoardDAO;
import com.ict.shop.dao.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public int getTotalCount() {
		return boardDAO.getTotalCount();
	}

	@Override
	public List<BoardVO> getBoardList(int offset, int limit, String user_idx) {
		return boardDAO.getBoardList(offset, limit, user_idx);
	}

	@Override
	public int getBoardInsert(BoardVO bovo) {
		return boardDAO.getBoardInsert(bovo);
	}

	@Override
	public int getBoardHit(String bo_idx) {
		return boardDAO.getBoardHit(bo_idx);
	}

	@Override
	public BoardVO getBoardDetail(String bo_idx) {
		return boardDAO.getBoardDetail(bo_idx);
	}

	@Override
	public int getLevUpdate(Map<String, Integer> map) {
		return boardDAO.getLevUpdate(map);
	}

	@Override
	public int getAnsInsert(BoardVO bovo) {
		return boardDAO.getAnsInsert(bovo);
	}

	@Override
	public int getBoardDelete(BoardVO bovo) {
		return boardDAO.getBoardDelete(bovo);
	}

	@Override
	public int getBoardUpdate(BoardVO bovo) {
		return boardDAO.getBoardUpdate(bovo);
	}
}

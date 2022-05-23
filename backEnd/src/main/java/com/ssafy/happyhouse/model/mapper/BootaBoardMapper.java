package com.ssafy.happyhouse.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ssafy.happyhouse.model.dto.BootaBoardDto;

import io.swagger.v3.oas.annotations.Parameter;

@Mapper
public interface BootaBoardMapper {
	public BootaBoardDto selectOne(int btbno);
	public List<BootaBoardDto> selectList(@Param("start")int start, @Param("count")int count);
	public List<BootaBoardDto> searchList(@Param("start")int start, @Param("count")int count, @Param("keyword")String keyword);
	public int selectTotalCount();
	public int selectSearchCount(@Param("keyword")String keyword);
	public int updateReadCount(int btbno);
	public int insertBoard(BootaBoardDto board);
	public int updateBoard(BootaBoardDto board);
	public int deleteBoard(int btbno,int btb_pw);
}

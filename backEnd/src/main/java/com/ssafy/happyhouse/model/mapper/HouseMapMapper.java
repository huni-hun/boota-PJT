package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.HouseInfoDto;
import com.ssafy.happyhouse.model.dto.SidoGugunCodeDto;

@Mapper
public interface HouseMapMapper {
	List<SidoGugunCodeDto> getSido() throws SQLException;
	List<SidoGugunCodeDto> getGugunInSido(String sido) throws SQLException;
	List<HouseInfoDto> getDongInGugun(String gugun) throws SQLException;
	List<HouseInfoDto> getAptInDong(String dong) throws SQLException;
	List<SidoGugunCodeDto> getSidoName(String sido) throws SQLException;
	List<SidoGugunCodeDto> getGugunName(String gugun) throws SQLException;
}
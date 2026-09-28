package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.MemberDTO;


@Repository
public class MemberDAO {

	@Autowired
	private JdbcTemplate jdbc;
	
	public int insert(MemberDTO dto) {
		String sql = "insert into member set(id, pw, name, phone, email, zipcode, address1, address2, regdate)"
					+ " values (?, ?, ?, ?, ?, ?, ?, ?, current_timestamp)";
		return jdbc.update(sql, 
				dto.getId(), 
				dto.getPw(), 
				dto.getName(), 
				dto.getPhone(), 
				dto.getEmail(),
				dto.getZipcode(), 
				dto.getAddress1(), 
				dto.getAddress2());
	}
	
	public boolean idCheck(String id) {
		String sql = "SELECT COUNT(*) FROM members WHERE id = ?";
		
		int count = jdbc.queryForObject(sql, Integer.class, id);
		return count > 0 ;
	}
	
	public boolean login(String id, String pw) {
		String sql = "select * from members where id=? and pw = ?";
		
		return !jdbc.query(sql, 
				new BeanPropertyRowMapper<>(MemberDTO.class), 
				id, pw).isEmpty();
	}
	
	public MemberDTO listAll(String id) {
		String sql = "select * from members where id=?";
		return jdbc.queryForObject(sql, new BeanPropertyRowMapper<>(MemberDTO.class), id);
	}
}

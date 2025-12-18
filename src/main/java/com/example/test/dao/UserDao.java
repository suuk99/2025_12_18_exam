package com.example.test.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.test.dto.User;

@Mapper
public interface UserDao {

	@Select("""
			SELECT COUNT(id)
				FROM `user`
				WHERE loginId = #{loginId}
			""")
	int getUsersId(String loginId);

	@Insert("""
			INSERT INTO `user`
				SET loginId = #{loginId},
					pw = #{pw},
					`name` = #{name}
			""")
	void doJoin(String loginId, String pw, String name);

	@Select("""
			SELECT * 
				FROM `user`
				WHERE loginId = #{loginId}
			""")
	User getLoginUser(String loginId);

	@Update("""
			UPDATE `user`
				SET pw = #{newPw}
				WHERE loginId = #{loginId}
			""")
	void updatePw(String newPw, String loginId);

}

package xin.yiliya.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import xin.yiliya.pojo.User;
@Repository
public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User userLogin(@Param("num") String registNum, @Param("pass") String password);

    User getUserInfo(Integer userId);

    int selectUserIdByRegistNum(String registNum);
}
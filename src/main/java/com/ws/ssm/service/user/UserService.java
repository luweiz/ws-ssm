package com.ws.ssm.service.user;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.abel533.entity.Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ws.ssm.bean.EasyUIResult;
import com.ws.ssm.mapper.UserMapper;
import com.ws.ssm.pojo.Pager;
import com.ws.ssm.pojo.User;
import com.ws.ssm.utils.PageUtils;
import com.ws.ssm.utils.SystemContext;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;
    

    public Pager<User> queryUserList() {
        Integer rows = SystemContext.getPageSize();
        Integer page = SystemContext.getPageOffset();
        // 设置分页参数
        PageHelper.startPage(page, rows);
        // 设置查询条件
        Example example = new Example(User.class);
        example.setOrderByClause("created DESC"); // 设置排序条件
        List<User> users = this.userMapper.selectByExample(example);
        PageInfo<User> pageInfo = new PageInfo<User>(users);
        Pager<User> pages = new Pager<User>();
        pages.setDatas(pageInfo.getList());
        pages.setTotal(pageInfo.getTotal());
        pages.setSize(pageInfo.getPageSize());
        pages.setPageNumber(pageInfo.getPages());
        return pages;
    }
    
    public EasyUIResult queryUserListEasyUi(Integer page, Integer rows) {
        // 设置分页参数
        PageHelper.startPage(page, rows);

        // 设置查询条件
        Example example = new Example(User.class);
        example.setOrderByClause("created DESC"); // 设置排序条件
        List<User> users = this.userMapper.selectByExample(example);

        PageInfo<User> pageInfo = new PageInfo<User>(users);
        return new EasyUIResult(pageInfo.getTotal(), pageInfo.getList());
    }


    public User queryUserById(Long id) {
        return this.userMapper.selectByPrimaryKey(id);
    }

    public void saveUser(User user) {
        user.setCreated(new Date());
        user.setUpdated(new Date());
        this.userMapper.insertSelective(user);
    }

    public void updateUser(User user) {
        this.userMapper.updateByPrimaryKeySelective(user);
    }

    public void deleteUserById(Long id) {
        this.userMapper.deleteByPrimaryKey(id);
    }

}

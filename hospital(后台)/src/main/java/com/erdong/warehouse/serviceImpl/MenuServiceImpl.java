package com.erdong.warehouse.serviceImpl;

import com.erdong.warehouse.mapper.AuthMapper;
import com.erdong.warehouse.model.TreeNode;
import com.erdong.warehouse.pojo.LayResult;
import com.erdong.warehouse.pojo.Menu;
import com.erdong.warehouse.pojo.Role;
import com.erdong.warehouse.service.MenuService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.common.collect.Lists;
import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import static java.util.stream.Collectors.toList;

import java.util.Date;
import java.util.List;
import java.util.Objects;

import static java.util.stream.Collectors.toList;

/**
 * @author Levin
 */
@Service
@Transactional
public class MenuServiceImpl  implements MenuService {

    private final AuthMapper authMapper;

    private static final Logger logger = LoggerFactory.getLogger(MenuServiceImpl.class);
    
    @Autowired
    public MenuServiceImpl(AuthMapper authMapper) {
        this.authMapper = authMapper;
    }

    /**
     * 数据重新封装
     * @param menus
     * @param pid
     * @return
     */
    private List<TreeNode> createTree(List<Menu> menus, Integer pid) {
        return menus.stream().filter(m -> m.getPaterId() != null && Objects.equals(pid, m.getPaterId()))
                .map(m -> new TreeNode(m.getId(), m.getName(), "/send"+"?"+"url="+m.getId())).collect(toList());
    }

    @Override
    public List<TreeNode> listTree(Integer roleId) {
        List<TreeNode> trees = com.google.common.collect.Lists.newArrayList();
        List<Menu> menus = this.authMapper.listMenuByRoleId(roleId);
        menus.stream().filter(m -> m.getPaterId() == null).forEach(m -> {
            List<TreeNode> tree = createTree(menus, m.getId());
            if (CollectionUtils.isNotEmpty(tree)) {
                trees.add(new TreeNode(m.getId(), m.getName(), m.getIcon(), tree));
            }
        });
        return trees;
    }
    @Override
    public  String selectUrl(Integer url){
        return authMapper.selectUrl(url);
    }
    @Override
    public LayResult<Role> selectRols(){
        LayResult<Role> result=new LayResult();
        result.setData(authMapper.selectRols());
        result.setCount(authMapper.selectRolsAmout());
        result.setCode("0");
        return result;
    }


}

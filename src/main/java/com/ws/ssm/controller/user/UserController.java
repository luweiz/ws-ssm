package com.ws.ssm.controller.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ws.ssm.bean.EasyUIResult;
import com.ws.ssm.pojo.Pager;
import com.ws.ssm.pojo.User;
import com.ws.ssm.service.user.UserService;
import com.ws.ssm.utils.DateProcessor;


@RequestMapping("admin/user")
@Controller
public class UserController {

    @Autowired
    private UserService userService;
    
    @RequestMapping(value = "init", method = RequestMethod.GET)
    public String init() {
        return "user/list";
    }
    
    @RequestMapping(value = "listEasyUi", method = RequestMethod.GET)
    @ResponseBody
    public EasyUIResult queryUserListEasyUi(@RequestParam(value = "page", defaultValue = "1") Integer page,
            @RequestParam(value = "rows", defaultValue = "5") Integer rows) {
        return this.userService.queryUserListEasyUi(page, rows);
    }
    
    @RequestMapping(value = "list", method = RequestMethod.GET)
    @ResponseBody
    public JSONObject queryUserList() {
        JSONObject jsonObj = new JSONObject();
        try {
            Pager<User> pagemode = this.userService.queryUserList();
            JsonConfig jsonConfig = new JsonConfig();
            jsonConfig.registerJsonValueProcessor(java.util.Date.class, new DateProcessor("yyyy-MM-dd HH:mm"));
            JSONObject jsonObject = JSONObject.fromObject(pagemode, jsonConfig);
            jsonObj.put("state", true);
            jsonObj.put("result", jsonObject);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            jsonObj.put("state", false);
            jsonObj.put("msg", "数据加载出错");
        }
        return jsonObj;
    }

    /**
     * 根据用户id查询用户数据
     * 
     * @param id
     * @return
     */
    @RequestMapping(value = "{id}", method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<User> queryUserById(@PathVariable("id") Long id) {
        try {
            User user = this.userService.queryUserById(id);
            if (null == user) {
                // 资源不存在，响应404
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
            }
            // 200
            // return ResponseEntity.status(HttpStatus.OK).body(user);
            return ResponseEntity.ok(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 500
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }
    

    @RequestMapping(value = "add", method = RequestMethod.GET)
    public ModelAndView toAdd(@RequestParam(value = "id", defaultValue = "0") Long id) {
        ModelAndView mv = new ModelAndView("user/add");
        User model = null;
        if(id>0){
            model = this.userService.queryUserById(id);
        }
        mv.addObject("model",model);
        return mv;
    }

    /**
     * 
     * @param user
     * @param bindingResult
     * @return
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> saveUser(@Valid User user, BindingResult bindingResult) {
        Map<String, Object> result = new HashMap<String, Object>();
        if (bindingResult.hasErrors()) {
            // 校验有错误
            List<String> msgs = new ArrayList<String>();
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            for (ObjectError objectError : allErrors) {
                String msg = objectError.getDefaultMessage();
                msgs.add(msg);
            }
            result.put("status", false);
            result.put("msg", StringUtils.join(msgs, '|'));
            return result;
        }

        try {
            this.userService.saveUser(user);
            result.put("status", true);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            result.put("status", false);
            result.put("msg", "注册失败");
        }
        return result;
    }
    
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> updateUser(@Valid User user, BindingResult bindingResult) {
        Map<String, Object> result = new HashMap<String, Object>();
        if (bindingResult.hasErrors()) {
            // 校验有错误
            List<String> msgs = new ArrayList<String>();
            List<ObjectError> allErrors = bindingResult.getAllErrors();
            for (ObjectError objectError : allErrors) {
                String msg = objectError.getDefaultMessage();
                msgs.add(msg);
            }
            result.put("status", false);
            result.put("msg", StringUtils.join(msgs, '|'));
            return result;
        }

        try {
            this.userService.updateUser(user);
            result.put("status", true);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            result.put("status", false);
            result.put("msg", "注册失败");
        }
        return result;
    }



    /**
     * 删除用户资源
     * 
     * @param user
     * @return
     */
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> deleteUser(@RequestParam(value = "id", defaultValue = "0") Long id) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            if (id.intValue() == 0) {
                // 请求参数有误
                result.put("status", false);
                result.put("msg", "请求参数有误");
            }
            this.userService.deleteUserById(id);
            result.put("status", true);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("status", false);
            result.put("msg", "删除失败");
        }
        return result;
    }
    
    
    @RequestMapping(value = "initUI", method = RequestMethod.GET)
    public String initUI() {
        return "user/listUI";
    }
    
    @RequestMapping(value = "addUI", method = RequestMethod.GET)
    public ModelAndView addUI(@RequestParam(value = "id", defaultValue = "0") Long id) {
        ModelAndView mv = new ModelAndView("user/addUI");
        User model = null;
        if(id>0){
            model = this.userService.queryUserById(id);
        }
        mv.addObject("model",model);
        return mv;
    }
}

package com.ws.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 通用的页面跳转Controller
 * 
 * @author luweiz
 *
 */
@RequestMapping("admin")
@Controller
public class IndexController {

    @RequestMapping(value = "index", method = RequestMethod.GET)
    public String index() {
        return "admin/index";
    }
    
    
    @RequestMapping(value = "main", method = RequestMethod.GET)
    public String main() {
        return "admin/main";
    }
    
    @RequestMapping(value = "changepwd", method = RequestMethod.GET)
    public String changepwd() {
        return "admin/changepwd";
    }
    
    @RequestMapping(value = "myloginfo", method = RequestMethod.GET)
    public String myloginfo() {
        return "admin/myloginfo";
    }
    
    @RequestMapping(value = "personInfo", method = RequestMethod.GET)
    public String personInfo() {
        return "admin/personInfo";
    }
}

//package com.ws.ssm.controller;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
///**
// * 通用的页面跳转Controller
// * 
// * @author luweiz
// *
// */
//@RequestMapping("page")
//@Controller
//public class PageController {
//
//    @RequestMapping(value = "{pageName}", method = RequestMethod.GET)
//    public String toPage(@PathVariable("pageName") String pageName) {
//        return pageName;
//    }
//
//    
//    @RequestMapping(value = "admin/index", method = RequestMethod.GET)
//    public String index() {
//        return "admin/index";
//    }
//    
//    
//    @RequestMapping(value = "admin/main", method = RequestMethod.GET)
//    public String main() {
//        return "admin/main";
//    }
//    
//}

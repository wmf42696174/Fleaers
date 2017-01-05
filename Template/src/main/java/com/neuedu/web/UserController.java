package com.neuedu.web;

import com.neuedu.bean.User;
import com.neuedu.service.UserService;
import com.neuedu.util.SendUtil;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2016-12-16.
 */


@Controller
@RequestMapping("user")
public class UserController {


    private String cid;

    private String ma;
    @Resource
    private SendUtil util;
    @Resource
    private UserService userService;


    @RequestMapping(value = "list",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView QueryAllUser(@RequestParam(value = "index",required = false)String index,
                                     @ModelAttribute("user")User user,
                                     HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        System.out.println(user.toString());
        int current=user.getPagenum();
        System.out.println("pagenum"+user.getPagenum());
        user.setPagenum((user.getPagenum()-1)*3);
        int count=userService.QueryCount(user);
        if(count%3!=0){
            count=count/3+1;
        }else{
            count=count/3;
        }
        if("index".equals(index)){
            mv.setViewName("ShowUserListIndex");
        }
        else{
            mv.setViewName("ShowUserList");
        }
        List<User> userList=userService.QueryAllUser(user);
        mv.addObject("UserList",userList);
        mv.addObject("count",count);
        mv.addObject("currentpagenum",current);
        mv.addObject("user",user);
        return mv;
    }

    @RequestMapping(value = "changeuser",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView ChangeUser(@RequestParam(value = "id")String id){
        ModelAndView mv=new ModelAndView();
        User user=userService.QueryUserById(id);
        mv.addObject("user",user);
        mv.setViewName("ChangeUser");
        return mv;
    }
    @RequestMapping(value = "changeuserinfo",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView ChangeUserInfo(@ModelAttribute("user")User user){
       // ModelAndView mv=new ModelAndView();
        System.out.println("ceshi"+user.toString());
        int i=userService.ChangeUserInfo(user);
       // mv.addObject("tip","success");
       // mv.setViewName("main");
        return new ModelAndView("redirect:/user/list?index=index&pagenum=1");
    }
    @RequestMapping(value = "deleteuser",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView DeleteUser(@RequestParam(value = "id")String id){
         ModelAndView mv=new ModelAndView("redirect:/user/list?index=index&pagenum=1");
         int i=userService.DeleteUserById(id);
        //mv.setViewName("main");
       // ModelMap map=new ModelMap();
      //  map.addAttribute("deleteflag","success");
         mv.addObject("deleteflag","success");
         return mv;
    }

    @RequestMapping(value = "changeme",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView ChangeMe(@RequestParam("id")String id){
        ModelAndView mv=new ModelAndView();
        User user=userService.QueryUserById(id);
        mv.addObject("user",user);
        mv.setViewName("ChangeMyInfo");
        return mv;
    }
    @RequestMapping(value = "changemyinfo",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView ChangeMyInfo(@ModelAttribute("user")User user){
        ModelAndView mv=new ModelAndView();
        int i=userService.ChangeMyInfo(user);
      //  mv.setViewName("main");
        return new ModelAndView("redirect:/user/MyInfo");
    }
    @RequestMapping(value = "MyInfo",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView MyInfo(HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
     /*   Object principle= SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user=(User)principle;*/
        String id=(String) request.getSession().getAttribute("loginid");
        User user=userService.QueryUserById(id);
        mv.addObject("user",user);
        mv.setViewName("ShowMyInfo");
        return mv;
    }
    @RequestMapping(value = "Return",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView Return(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("main");
        return mv;
    }
    @RequestMapping(value = "/login")
    public ModelAndView getLoginPage(
            @RequestParam(value = "error",required = false) boolean error,ModelAndView mv
    ){
        if(error==true){
            mv.addObject("error",
                    "You have entered an invalid username or password!");
        }
        else{
            mv.addObject("error", "success");
        }
        System.out.println("跳转到验证页面");
        mv.setViewName("login");
        return mv;
    }

    @RequestMapping(value = "/check",method = {RequestMethod.POST,
            RequestMethod.GET })
    public ModelAndView CheckUser(HttpServletRequest request){
        Object principle= SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        System.out.println(principle.toString());
        User user=(User)principle;
        System.out.println("yanzheng"+user.toString());
        request.getSession().setAttribute("loginid",user.getId());
        request.getSession().setAttribute("password",user.getPassword());
        request.getSession().setAttribute("username",user.getUserName());
        request.getSession().setAttribute("type",user.getType());
        ModelAndView mv=new ModelAndView();
        mv.addObject("loginid",user.getId());
        mv.addObject("username",user.getUserName());
        System.out.println("跳转到主界面");
        mv.setViewName("main");
        return mv;
    }

    @RequestMapping(value = "/regist",method = {RequestMethod.GET,RequestMethod.POST})
    public String Regist(){
        return "regist";
    }
    @RequestMapping(value = "AddUser",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView AddUser(@ModelAttribute("user")User user){
        System.out.println("asdasdsad哈"+user.toString());
        User checkUSer=userService.CheckUser(user.getUserName());
        ModelAndView mv=new ModelAndView();
        if(checkUSer!=null){
            mv.setViewName("regist");
            mv.addObject("error","fail");
            return mv;
        }
        mv.addObject("error", "success");
        String s= UUID.randomUUID().toString();
        String id=s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
        user.setId(id);
        if(user.getType().equals("卖方")){
            user.setRole("ROLE_USER");
        }
        else{
            user.setRole("ROLE_SALE");
        }
        mv.setViewName("login");
        userService.AddUser(user);
        return mv;
    }

    @RequestMapping(value = "getback",method = {RequestMethod.GET,RequestMethod.POST})
    public String GetBack(){
        return "getback";
    }
    @RequestMapping(value = "yanzheng")
    public String SendEmail(@RequestParam String id)throws Exception{
        cid=id;
        System.out.println("asdasdas"+id);
        String email=userService.CheckUser(id).getEmail();
        ma= util.SendMail(email);
        System.out.println(ma);
        return "getback";
    }
    @RequestMapping(value = "he")
    public @ResponseBody
    User check(@RequestParam String yan){
        if(yan.equals(ma)){
            User user=userService.CheckUser(cid);
            return user;
        }
        return null;
    }

}

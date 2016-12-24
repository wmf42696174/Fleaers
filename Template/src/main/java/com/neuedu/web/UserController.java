package com.neuedu.web;

import com.neuedu.bean.User;
import com.neuedu.service.UserService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * Created by Administrator on 2016-12-16.
 */


@Controller
@RequestMapping("user")
public class UserController {


    @Resource
    private UserService userService;


    @RequestMapping(value = "list",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView QueryAllUser(@RequestParam(value = "index",required = false)String index,
                                     @ModelAttribute("user")User user,
                                     HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        System.out.println(user.toString());
        if("index".equals(index)){
            mv.setViewName("ShowUserListIndex");
        }
        else{
            mv.setViewName("ShowUserList");
        }
        List<User> userList=userService.QueryAllUser(user);
        mv.addObject("UserList",userList);
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
        ModelAndView mv=new ModelAndView();
        System.out.println("ceshi"+user.toString());
        int i=userService.ChangeUserInfo(user);
        mv.setViewName("main");
        return mv;
    }
    @RequestMapping(value = "deleteuser",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView DeleteUser(@RequestParam(value = "id")String id){
        ModelAndView mv=new ModelAndView();
        int i=userService.DeleteUserById(id);
        mv.setViewName("main");
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
        mv.setViewName("main");
        return mv;
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

}

package com.neuedu.web;

import com.neuedu.bean.Goods;
import com.neuedu.bean.User;
import com.neuedu.service.GoodsService;
import com.neuedu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Created by Administrator on 2016-12-19.
 */
@Controller
@RequestMapping("goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "showmygoodslist",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView ShowMyGoodsList(@ModelAttribute("goods")Goods goods,
                                        HttpServletRequest request){

        ModelAndView mv=new ModelAndView();
        String userid=(String)request.getSession().getAttribute("loginid");
        goods.setUserid(userid);
        System.out.println(goods.toString());
        List<Goods> goodsList=goodsService.QueryMyGoods(goods);
        mv.setViewName("ShowMyGoodsListIndex");
        mv.addObject("goodslist",goodsList);
        return mv;
    }
    @RequestMapping(value = "changegoods",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView ChangeGoods(@RequestParam("id")String id){
        ModelAndView mv=new ModelAndView();
        Goods goods=goodsService.QueryGoodsById(id);
        mv.addObject("Goods",goods);
        mv.setViewName("ChangeGoods");
        return mv;
    }
    @RequestMapping(value = "changegoodsinfo",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView ChangeGoodsInfo(@ModelAttribute("goods")Goods goods){
        int i=goodsService.ChangeGoodsInfo(goods);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("main");
        return mv;
    }
    @RequestMapping(value = "Return",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView Return(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("main");
        return mv;
    }
    @RequestMapping(value = "addgoods",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView AddGoods(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("AddGoods");
        return mv;
    }
    @RequestMapping(value = "add",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView Add(@ModelAttribute("goods")Goods goods,
                            HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        System.out.println(goods.toString());
        String s= UUID.randomUUID().toString();
        String id=s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
         goods.setId(id);
        goods.setFlag(2);
        String userid=(String)request.getSession().getAttribute("loginid");
        goods.setUserid(userid);
        int i=goodsService.AddGoods(goods);
        mv.setViewName("main");
        return mv;
    }
    @RequestMapping(value = "checkgoods",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView CheckGoods(@ModelAttribute("goods")Goods goods){
        List<User> userList=new ArrayList<User>();
        User user=null;
        List<String> idList=goodsService.QueryAllUserId();
        for (String id:idList) {
            user=userService.QueryUserById(id);
            userList.add(user);
        }
        ModelAndView mv=new ModelAndView();
        mv.addObject("userList",userList);
        List<Goods> goodsList=goodsService.QueryAllyGoods(goods);
        mv.addObject("goodsList",goodsList);
        mv.setViewName("CheckGoodsListIndex");
        return mv;
    }
    @RequestMapping(value = "changeflag",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView ChangeFlag(@ModelAttribute("goods")Goods goods){
        System.out.println("asd"+goods.toString());
        int i=goodsService.ChangeGoodsFlag(goods);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("main");
        return mv;

    }
    @RequestMapping(value = "showallgoods",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView ShowAllGoods(@ModelAttribute("goods")Goods goods){
        ModelAndView mv=new ModelAndView();
        List<User> userList=new ArrayList<User>();
        User user=null;
        List<String> idList=goodsService.QueryAllUserId();
        for (String id:idList) {
            user=userService.QueryUserById(id);
            userList.add(user);
        }
        mv.addObject("userList",userList);
        List<Goods> goodsList=goodsService.QueryAllFlagedGoods(goods);
        mv.addObject("goodsList",goodsList);
        List<String> typeList=goodsService.QueryGoodsType();
        mv.addObject("typeList",typeList);
        mv.setViewName("ShowFlagedGoodsListIndex");
        return mv;
    }
    @RequestMapping(value = "buygoods",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView BuyGoods(@RequestParam("id")String id){
        ModelAndView mv=new ModelAndView();
        Goods goods=goodsService.QueryGoodsById(id);
        mv.addObject("Goods",goods);
        mv.setViewName("BuyGoods");
        return mv;
    }
}

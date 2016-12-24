package com.neuedu.web;

import com.neuedu.bean.Want;
import com.neuedu.service.WantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Administrator on 2016-12-24.
 */
@Controller
@RequestMapping("want")
public class WantController {

    @Autowired
    private WantService wantService;

    @RequestMapping(value = "addwant",method = {RequestMethod.GET,RequestMethod.POST})
    public String AddWant(){
        return "AddWants";
    }
    @RequestMapping(value = "add",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView Add(@ModelAttribute("want")Want want,
                            HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        String buyername=(String) request.getSession().getAttribute("username");
        want.setBuyername(buyername);
        String s= UUID.randomUUID().toString();
        String id=s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
        want.setId(id);
        wantService.AddWant(want);
        mv.setViewName("main");
        return mv;
    }
    @RequestMapping(value = "return",method = {RequestMethod.GET,RequestMethod.POST})
    public String Return(){return "main";}
    @RequestMapping(value = "showwantlist",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView ShowWantList(@RequestParam(value = "minprice",required = false)String minprice,
                                      @RequestParam(value ="maxprice" ,required = false)String maxprice,
                                      @RequestParam(value = "buyername",required = false)String buyername){
       ModelAndView mv=new ModelAndView();
        Map<String ,Object> parameter=new HashMap<String, Object>();
        parameter.put("minprice",minprice);
        parameter.put("maxprice",maxprice);
        parameter.put("buyername",buyername);
        List<Want> wantList=wantService.QueryAllWant(parameter);
        mv.addObject("wantList",wantList);
        List<String>nameList=wantService.QueryAllName();
        mv.addObject("nameList",nameList);
        mv.setViewName("ShowWantListIndex");
        return mv;
    }
}

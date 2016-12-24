package com.neuedu.web;

import com.neuedu.bean.Goods;
import com.neuedu.bean.Record;
import com.neuedu.service.GoodsService;
import com.neuedu.service.RecordService;
import com.neuedu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Administrator on 2016-12-23.
 */
@Controller
@RequestMapping(value = "record")
public class RecordController {

    @Autowired
    private RecordService recordService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "addrecord",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView AddRecord(@ModelAttribute("record")Record record,
                                  @RequestParam("id")String id,
                                  HttpServletRequest request){
        Goods goods=goodsService.QueryGoodsById(id);
        goods.setNum(goods.getNum()-record.getGnum());
        goodsService.ChangeGoodsFlag(goods);
        String userid=goods.getUserid();
        String salename=userService.QueryUserNameById(userid);
        String buyername=(String) request.getSession().getAttribute("username");
        record.setBuyername(buyername);
        record.setSalename(salename);
        String s= UUID.randomUUID().toString();
        String rid=s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
        record.setId(rid);
        record.setTime(new Date());
        recordService.AddRecord(record);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("main");
        return mv;
    }
    @RequestMapping(value = "showmyrecord",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView ShowMyRecord(@RequestParam(value = "time",required = false)String time,
                                     HttpServletRequest request){
        System.out.println("asdasdasd"+time);
        ModelAndView mv=new ModelAndView();
        Map<String,Object> parameter=new HashMap<String, Object>();
        parameter.put("time",time);
       // SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd ");
        String buyername=(String) request.getSession().getAttribute("username");
        parameter.put("buyername",buyername);
        List<Record> recordList=recordService.QueryRecordByBuyername(parameter);
        mv.addObject("RecordList",recordList);
        mv.setViewName("ShowMyRecordListIndex");
        return mv;
    }
}

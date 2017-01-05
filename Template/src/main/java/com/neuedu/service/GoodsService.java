package com.neuedu.service;

import com.neuedu.bean.Goods;
import com.neuedu.dao.mapper.GoodsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016-12-19.
 */
@Service
public class GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;


    public List<Goods>QueryMyGoods(Goods goods){
        return goodsMapper.QueryMyGoods(goods);
    }


    public Goods QueryGoodsById(String id){
        return goodsMapper.QueryGoodsById(id);
    }

    public int ChangeGoodsInfo(Goods goods){
        return goodsMapper.ChangeGoodsInfo(goods);
    }

    public int AddGoods(Goods goods){
        return goodsMapper.AddGoods(goods);
    }
    public List<Goods>QueryAllyGoods(Goods goods){
        return goodsMapper.QueryAllyGoods(goods);
    }
    public int QueryCount(Goods goods){
        return goodsMapper.QueryCount(goods);
    }
    public List<String>QueryAllUserId(){
        return goodsMapper.QueryAllUserId();
    }

    public int ChangeGoodsFlag(Goods goods){
        return goodsMapper.ChangeGoodsFlag(goods);
    }

    public List<Goods>QueryAllFlagedGoods(Goods goods){return goodsMapper.QueryAllFlagedGoods(goods);}

    public List<String>QueryGoodsType(){return goodsMapper.QueryGoodsType();}

    public int QueryMyCount(Goods goods){
        return goodsMapper.QueryMyCount(goods);
    }
    public int QueryFlagedCount(Goods goods){
        return goodsMapper.QueryFlagedCount(goods);
    }
    public int DeleteGoodsById(String id){
        return goodsMapper.DeleteGoodsById(id);
    }
}

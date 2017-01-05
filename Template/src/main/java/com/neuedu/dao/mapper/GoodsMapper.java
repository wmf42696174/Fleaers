package com.neuedu.dao.mapper;

import com.neuedu.bean.Goods;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016-12-19.
 */
@Repository
public interface GoodsMapper {

    public List<Goods>QueryMyGoods(Goods goods);

    public Goods QueryGoodsById(String id);

    public int ChangeGoodsInfo(Goods goods);

    public int AddGoods(Goods goods);

    public List<Goods>QueryAllyGoods(Goods goods);

    public List<String>QueryAllUserId();

    public int ChangeGoodsFlag(Goods goods);

    public List<Goods>QueryAllFlagedGoods(Goods goods);

    public List<String>QueryGoodsType();

    public int QueryCount(Goods goods);

    public int QueryMyCount(Goods goods);

    public int QueryFlagedCount(Goods goods);

    public int DeleteGoodsById(String id);
}

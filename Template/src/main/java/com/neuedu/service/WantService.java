package com.neuedu.service;

import com.neuedu.bean.Want;
import com.neuedu.dao.mapper.WantMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016-12-24.
 */
@Service
public class WantService {

    @Autowired
    private WantMapper wantMapper;


    public int AddWant(Want want){
        return wantMapper.AddWant(want);
    }

    public List<Want>QueryAllWant(Map<String,Object> parametre){
        return wantMapper.QueryAllWant(parametre);
    }

    public List<String>QueryAllName(){
        return wantMapper.QueryAllName();
    }
}

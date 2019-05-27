package com.hr.sm.service.impl;

import com.hr.sm.entity.Ads;
import com.hr.sm.mapper.AdsMapper;
import com.hr.sm.service.AdsService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdsServiceImpl implements AdsService {
    private AdsMapper adsMapper;

    public AdsServiceImpl(AdsMapper adsMapper) {
        this.adsMapper = adsMapper;
    }
    @Override
    public List<Ads> findAll() {
        return adsMapper.findAll();
    }

    @Override
    public int adsadd(Ads ads) {
        return adsMapper.adsadd(ads);
    }

    @Override
    public int adsdelete(int id) {
        return adsMapper.adsdelete(id);
    }

    @Override
    public int adsupdate(Ads ads) {
        return adsMapper.adsupdate(ads);
    }

    @Override
    public Ads findbyIdads(int id) {
        return adsMapper.findbyIdads(id);
    }
}

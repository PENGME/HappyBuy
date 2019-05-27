package com.hr.sm.service;

import com.hr.sm.entity.Ads;

import java.util.List;

public interface AdsService {
    List<Ads> findAll();
    int adsadd(Ads ads);
    int adsdelete(int id);
    int adsupdate(Ads ads);
    Ads findbyIdads(int id);
}

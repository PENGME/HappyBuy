package com.hr.sm.service;

import com.hr.sm.entity.Address;

import java.util.List;

public interface AddressService {
    List<Address> AddrfindAll(int user_id);
    Address findbyid(int id);
    int findCount(int user_id);
    void Addrinsert(Address address);
    void Addrdelete(int id);
}

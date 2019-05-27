package com.hr.sm.service.impl;

import com.hr.sm.entity.Address;
import com.hr.sm.mapper.AddressMapper;
import com.hr.sm.service.AddressService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {
    private AddressMapper mapper;
    public AddressServiceImpl(AddressMapper mapper) {
        this.mapper = mapper;
    }

    @Override
    public List<Address> AddrfindAll(int user_id) {
        return mapper.AddrfindAll(user_id);
    }

    @Override
    public Address findbyid(int id) {
        return mapper.findbyid(id);
    }

    @Override
    public int findCount(int user_id) {
        return mapper.findCount(user_id);
    }

    @Override
    public void Addrinsert(Address address) {
         mapper.Addrinsert(address);
    }

    @Override
    public void Addrdelete(int id) {
        mapper.Addrdelete(id);
    }
}

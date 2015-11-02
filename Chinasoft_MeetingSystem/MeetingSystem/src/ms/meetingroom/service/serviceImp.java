package ms.meetingroom.service;

import javax.annotation.Resource;

import ms.meetingroom.dao.dao;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class serviceImp implements service {
	@Resource
	dao dao;
	
	

}

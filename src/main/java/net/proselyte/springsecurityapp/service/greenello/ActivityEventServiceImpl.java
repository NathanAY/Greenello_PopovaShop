package net.proselyte.springsecurityapp.service.greenello;

import net.proselyte.springsecurityapp.dao.greenello.ActivityEventDao;
import net.proselyte.springsecurityapp.dao.greenello.CardDao;
import net.proselyte.springsecurityapp.model.greenello.ActivityEvent;
import net.proselyte.springsecurityapp.model.greenello.Card;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ActivityEventServiceImpl implements ActivityEventService {

    @Autowired
    ActivityEventDao activityEventDao;


    @Override
    public void save(ActivityEvent activityEvent) {
        activityEventDao.save(activityEvent);
    }

    @Override
    public ActivityEvent findByID(Long id) {
        return activityEventDao.findById(id);
    }

    @Override
    public List<ActivityEvent> findAll() {
        return activityEventDao.findAll();
    }
}

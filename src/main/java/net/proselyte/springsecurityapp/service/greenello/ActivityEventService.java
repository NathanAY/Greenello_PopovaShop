package net.proselyte.springsecurityapp.service.greenello;

import net.proselyte.springsecurityapp.model.greenello.ActivityEvent;
import net.proselyte.springsecurityapp.model.greenello.Card;

import java.util.List;

public interface ActivityEventService {

    void save(ActivityEvent activityEvent);

    ActivityEvent findByID(Long id);

    List<ActivityEvent> findAll();
}

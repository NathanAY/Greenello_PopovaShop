package net.proselyte.springsecurityapp.dao.greenello;

import net.proselyte.springsecurityapp.model.greenello.ActivityEvent;
import net.proselyte.springsecurityapp.model.greenello.Card;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface ActivityEventDao extends JpaRepository<ActivityEvent, Long> {
    ActivityEvent findById(Long id);

    List<ActivityEvent> findAll();
}

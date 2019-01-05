package net.proselyte.springsecurityapp.dao.greenello;

import net.proselyte.springsecurityapp.model.User;
import net.proselyte.springsecurityapp.model.greenello.Card;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface CardDao extends JpaRepository<Card, Long> {
    Card findById(Long id);

    List<Card> findAll();
}

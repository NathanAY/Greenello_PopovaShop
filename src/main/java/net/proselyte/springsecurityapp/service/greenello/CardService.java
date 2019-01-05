package net.proselyte.springsecurityapp.service.greenello;

import net.proselyte.springsecurityapp.model.User;
import net.proselyte.springsecurityapp.model.greenello.Card;

import java.util.List;

public interface CardService {

    void save(Card card);

    Card findByID(Long id);

    List<Card> findAll();
}

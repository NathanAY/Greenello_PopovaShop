package net.proselyte.springsecurityapp.service.greenello;

import net.proselyte.springsecurityapp.dao.ProductDao;
import net.proselyte.springsecurityapp.dao.greenello.CardDao;
import net.proselyte.springsecurityapp.model.Product;
import net.proselyte.springsecurityapp.model.greenello.Card;
import net.proselyte.springsecurityapp.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CardServiceImpl implements CardService{

    @Autowired
    CardDao cardDao;


    @Override
    public void save(Card card) {
        cardDao.save(card);
    }

    @Override
    public Card findByID(Long id) {
        return cardDao.findById(id);
    }

    @Override
    public List<Card> findAll() {
        return cardDao.findAll();
    }
}

package net.proselyte.springsecurityapp.controller;

import net.proselyte.springsecurityapp.model.User;
import net.proselyte.springsecurityapp.model.greenello.ActivityEvent;
import net.proselyte.springsecurityapp.model.greenello.Card;
import net.proselyte.springsecurityapp.service.SecurityService;
import net.proselyte.springsecurityapp.service.UserService;
import net.proselyte.springsecurityapp.service.greenello.ActivityEventService;
import net.proselyte.springsecurityapp.service.greenello.CardService;
import net.proselyte.springsecurityapp.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

@Controller
@RequestMapping("/greenello")
public class GreenelloController {

    @Autowired
    private UserService userService;
    @Autowired
    private SecurityService securityService;
    @Autowired
    private UserValidator userValidator;
    @Autowired
    private ActivityEventService activityEventService;

    @Autowired
    private CardService cardService;

    public void setService(final Object service, final String serviceType) {
        switch (serviceType) {
            case "user":
                this.userService = (UserService) service;
                break;
            case "card":
                this.cardService = (CardService) service;
                break;
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    public String getCategories(final ModelMap map) {
        map.addAttribute("cards", cardService.findAll());
        map.addAttribute("users", userService.findAll());
        map.addAttribute("activities", activityEventService.findAll());
        return "grennello/grennello";
    }

    @RequestMapping(value = "/createCard", method = RequestMethod.POST)
    public String createCategory(@RequestParam("creator") final String creator,
                                 @RequestParam("summary") final String summary,
                                 @RequestParam("description") final String description,
                                 @RequestParam("assignee") final String assignee,
                                 final ModelMap map) {
        final Card card = new Card();
        card.setId((long) cardService.findAll().size());
        card.setSummary(summary);
        card.setDescription(description);
        card.setStatus("Queue");
        card.setCreate_date(new Date());
        final User userCreator = userService.findByUsername(creator);
        if (userCreator != null) {
            card.setCreatorId(userCreator.getId());
        }
        final User user = userService.findByUsername(assignee);
        if (user != null) {
            card.setAssignee_id(user.getId());
        }
        cardService.save(card);
        saveActivityEvent("Create '" + card.getSummary() + "' card, and assigned to " + assignee);
        return "success";
    }

    @RequestMapping(value = "/cardWorkflow", method = RequestMethod.POST)
    public String createCategory(@RequestParam("cardId") final String cardId,
                                 @RequestParam("next") boolean next, final ModelMap map) {
        final Card card = cardService.findByID(Long.parseLong(cardId));
        if (next) {
            switch (card.getStatus()) {
                case "Review" :
                    card.setStatus("Done");
                    saveActivityEvent("moved card '" + card.getSummary() + "' to DONE");
                    break;
                case "In progress" :
                    card.setStatus("Review");
                    saveActivityEvent("moved card '" + card.getSummary() + "' to REVIEW");
                    break;
                case "Queue" :
                    card.setStatus("In progress");
                    saveActivityEvent("moved card '" + card.getSummary() + "' to IN PROGRESS");
                    break;
            }
        } else {
            switch (card.getStatus()) {
                case "In progress":
                    card.setStatus("Queue");
                    saveActivityEvent("moved card '" + card.getSummary() + "' to QUEUE");
                    break;
                case "Review":
                    card.setStatus("In progress");
                    saveActivityEvent("moved card '" + card.getSummary() + "' to REVIEW");
                    break;
                case "Done":
                    card.setStatus("Review");
                    saveActivityEvent("moved card '" + card.getSummary() + "' to DONE");
                    break;
            }
        }
        cardService.save(card);
        return "success";
    }

    private void saveActivityEvent(final String text) {
        try {
            final Long id = (long) activityEventService.findAll().size();
            final Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            final String currentPrincipalName = authentication.getName();
            final ActivityEvent activityEvent = new ActivityEvent();
            activityEvent.setId(id);
            activityEvent.setCreator_name(currentPrincipalName);
            activityEvent.setEvent_date(new Date());
            activityEvent.setText(text);

            activityEventService.save(activityEvent);
        } catch (final Exception e) {
            e.printStackTrace();
        }
    }
}

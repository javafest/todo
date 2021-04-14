package therap.javafest.todo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author erfan
 * @since 4/14/21
 */
@Controller
public class WelcomeController {

    @GetMapping
    public String greeting() {
        return "welcome";
    }
}

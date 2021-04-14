package therap.javafest.todo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author erfan
 * @since 4/14/21
 */
@RestController
public class WelcomeController {

    @GetMapping
    public String greeting() {
        return "Hello from Javafest";
    }
}

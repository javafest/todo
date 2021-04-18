package therap.javafest.todo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import therap.javafest.todo.domain.User;
import therap.javafest.todo.service.UserService;

import javax.validation.Valid;
import java.util.Objects;

/**
 * @author erfan
 * @since 4/15/21
 */
@Controller
@RequestMapping(value = "/auth")
public class AuthController {

    private static final String REGISTRATION_FORM = "auth/registration";
    private static final String LOGIN_FORM = "auth/login";

    @Autowired
    private UserService userService;

    @GetMapping(value = "/welcome")
    public String welcome() {
        return "welcome";
    }

    @GetMapping(value = "/registration")
    public String registration(ModelMap model) {
        model.put("user", new User());

        return REGISTRATION_FORM;
    }

    @PostMapping(value = "/registration")
    public String registration(@Valid @ModelAttribute("user") User user,
                               BindingResult bindingResult) {

        if (foundDuplicateUsername(user.getUsername())) {
            bindingResult.rejectValue("username", "", "This username has already been taken!");
        }

        if (bindingResult.hasErrors()) {
            return REGISTRATION_FORM;
        }

        userService.save(user);

        return "redirect:/auth/welcome";
    }

    @GetMapping(value = "/login")
    public String login(ModelMap model, String error, String logout) {

        if (error != null) {
            model.put("error", "Your username and password is invalid.");
        }

        if (logout != null) {
            model.put("logout", "You have been logged out successfully.");
        }

        model.put("user", new User());

        return LOGIN_FORM;
    }

    private boolean foundDuplicateUsername(String username) {
        User duplicateUser = userService.findByUsername(username);

        return Objects.nonNull(duplicateUser);
    }
}

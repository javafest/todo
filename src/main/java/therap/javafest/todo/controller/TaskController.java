package therap.javafest.todo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import therap.javafest.todo.domain.Task;
import therap.javafest.todo.domain.User;
import therap.javafest.todo.service.TaskService;
import therap.javafest.todo.service.UserService;

import javax.validation.Valid;

/**
 * @author erfan
 * @since 4/16/21
 */
@Controller
@RequestMapping(value = "/task")
public class TaskController {

    private static final String SHOW_PAGE = "task/show";

    @Autowired
    private UserService userService;

    @Autowired
    private TaskService taskService;

    @GetMapping(value = "/show")
    public String show(ModelMap model) {
        model.put("task", new Task(getLoggedInUser()));
        model.put("taskList", taskService.getAllTasks());

        return SHOW_PAGE;
    }

    @PostMapping(value = "/show")
    public String show(@Valid @ModelAttribute("task") Task task,
                       BindingResult result,
                       ModelMap model) {

        if (result.hasErrors()) {
            model.put("taskList", taskService.getAllTasks());

            return SHOW_PAGE;
        }

        task.setUser(getLoggedInUser());
        taskService.save(task);

        return "redirect:/task/show";
    }

    private User getLoggedInUser() {
        return userService.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
    }
}

package therap.javafest.todo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
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
    private static final String EDIT_PAGE = "task/edit";

    @Autowired
    private UserService userService;

    @Autowired
    private TaskService taskService;

    @GetMapping(value = "/show")
    public String show(ModelMap model) {
        User loggedInUser = getLoggedInUser();

        model.put("task", new Task(loggedInUser));
        model.put("taskList", taskService.getAllTasks(loggedInUser));

        return SHOW_PAGE;
    }

    @PostMapping(value = "/show")
    public String show(@Valid @ModelAttribute("task") Task task,
                       BindingResult result,
                       ModelMap model) {

        User loggedInUser = getLoggedInUser();

        if (result.hasErrors()) {
            model.put("taskList", taskService.getAllTasks(loggedInUser));

            return SHOW_PAGE;
        }

        task.setUser(loggedInUser);
        taskService.save(task);

        return "redirect:/task/show";
    }

    @GetMapping(value = "/edit")
    public String edit(@RequestParam("id") int id,
                       ModelMap model) {

        model.put("task", taskService.getById(id));

        return EDIT_PAGE;
    }

    @PostMapping(value = "/edit")
    public String update(@Valid @ModelAttribute("task") Task task,
                         BindingResult result,
                         ModelMap model) {

        if (result.hasErrors()) {
            model.put("task", task);

            return EDIT_PAGE;
        }

        taskService.save(task);

        return "redirect:/task/show";
    }

    @ResponseBody
    @DeleteMapping(value = "/delete")
    public String delete(@RequestParam("id") int id) {
        taskService.delete(taskService.getById(id));

        return "deleted";
    }

    private User getLoggedInUser() {
        return userService.findByUsername(SecurityContextHolder.getContext().getAuthentication().getName());
    }
}

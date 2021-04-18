package therap.javafest.todo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import therap.javafest.todo.domain.Task;
import therap.javafest.todo.domain.User;

import java.util.List;

/**
 * @author erfan
 * @since 4/16/21
 */
public interface TaskRepository extends JpaRepository<Task, Integer> {
    List<Task> getAllByUser(User user);
}

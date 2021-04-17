package therap.javafest.todo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import therap.javafest.todo.domain.Task;

/**
 * @author erfan
 * @since 4/16/21
 */
public interface TaskRepository extends JpaRepository<Task, Integer> {
}

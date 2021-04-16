package therap.javafest.todo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import therap.javafest.todo.domain.User;

/**
 * @author erfan
 * @since 4/15/21
 */
public interface UserRepository extends JpaRepository<User, Integer> {

    User findByUsername(String username);
}

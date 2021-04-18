package therap.javafest.todo.domain;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

/**
 * @author erfan
 * @since 4/15/21
 */
@Entity
@Table
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(length = 50, nullable = false, unique = true)
    @NotEmpty
    @Size(max = 50)
    private String username;

    @Column(length = 10, nullable = false)
    @NotEmpty
    private String password;

    @Version
    private int version;

    @Temporal(value = TemporalType.TIMESTAMP)
    private Date created;

    @Temporal(value = TemporalType.TIMESTAMP)
    private Date updated;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }
}

package br.com.fiap.task.repository;

import br.com.fiap.task.domain.Status;
import br.com.fiap.task.domain.Task;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TaskRepository extends JpaRepository<Task, Long> {
    List<Task> findByStatusOrderByDueDateAsc(Status status);
    List<Task> findAllByOrderByStatusAscDueDateAscCreatedAtAsc();
}

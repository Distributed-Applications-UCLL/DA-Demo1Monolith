package be.ucll.monolith.persistence.repository;

import be.ucll.monolith.persistence.entity.Order;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepository extends JpaRepository<Order, Long> { }

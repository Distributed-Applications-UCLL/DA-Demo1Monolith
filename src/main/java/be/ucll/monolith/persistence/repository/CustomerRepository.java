package be.ucll.monolith.persistence.repository;

import be.ucll.monolith.persistence.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<Customer, Long> {
}
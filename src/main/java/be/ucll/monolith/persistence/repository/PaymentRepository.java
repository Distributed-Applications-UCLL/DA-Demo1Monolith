package be.ucll.monolith.persistence.repository;

import be.ucll.monolith.persistence.entity.Payment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PaymentRepository extends JpaRepository<Payment, Long> { }

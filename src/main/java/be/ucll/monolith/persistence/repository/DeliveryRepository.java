package be.ucll.monolith.persistence.repository;

import be.ucll.monolith.persistence.entity.Delivery;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DeliveryRepository extends JpaRepository<Delivery, Long> { }

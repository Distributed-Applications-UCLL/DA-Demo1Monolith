package be.ucll.monolith.persistence.repository;

import be.ucll.monolith.persistence.entity.Restaurant;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RestaurantRepository extends JpaRepository<Restaurant, Long> {
}

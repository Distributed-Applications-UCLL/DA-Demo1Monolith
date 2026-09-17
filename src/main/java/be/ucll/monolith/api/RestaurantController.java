package be.ucll.monolith.api;

import be.ucll.monolith.business.RestaurantService;
import be.ucll.monolith.persistence.entity.Restaurant;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/restaurants")
public class RestaurantController {
    private final RestaurantService restaurantService;

    public RestaurantController(RestaurantService restaurantService) {
        this.restaurantService = restaurantService;
    }

    @GetMapping
    public List<Restaurant> findAll() {
        return restaurantService.findAll();
    }

    @GetMapping("/{id}")
    public Restaurant findById(@PathVariable Long id) {
        return restaurantService.findById(id);
    }

    @PostMapping
    public Restaurant create(@RequestBody Restaurant restaurant) {
        return restaurantService.save(restaurant);
    }
}
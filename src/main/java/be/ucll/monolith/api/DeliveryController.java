package be.ucll.monolith.api;

import be.ucll.monolith.business.DeliveryService;
import be.ucll.monolith.persistence.entity.Delivery;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/deliveries")
public class DeliveryController {
    private final DeliveryService deliveryService;

    public DeliveryController(DeliveryService deliveryService) {
        this.deliveryService = deliveryService;
    }

    @GetMapping
    public List<Delivery> findAll() {
        return deliveryService.findAll();
    }

    @GetMapping("/{id}")
    public Delivery findById(@PathVariable Long id) {
        return deliveryService.findById(id);
    }

    @PostMapping
    public Delivery create(@RequestBody Delivery delivery) {
        return deliveryService.save(delivery);
    }
}

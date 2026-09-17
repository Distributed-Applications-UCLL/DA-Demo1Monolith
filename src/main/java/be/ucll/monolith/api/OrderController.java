package be.ucll.monolith.api;

import be.ucll.monolith.business.OrderService;
import be.ucll.monolith.persistence.entity.Order;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/orders")
public class OrderController {
    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping
    public List<Order> findAll() {
        return orderService.findAll();
    }

    @GetMapping("/{id}")
    public Order findById(@PathVariable Long id) {
        return orderService.findById(id);
    }

    @PostMapping
    public Order create(@RequestBody Order order) {
        return orderService.save(order);
    }
}
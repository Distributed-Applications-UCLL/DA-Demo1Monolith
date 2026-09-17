package be.ucll.monolith.api;

import be.ucll.monolith.business.MenuItemService;
import be.ucll.monolith.persistence.entity.MenuItem;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/menu-items")
public class MenuItemController {
    private final MenuItemService menuItemService;

    public MenuItemController(MenuItemService menuItemService) {
        this.menuItemService = menuItemService;
    }

    @GetMapping
    public List<MenuItem> findAll() {
        return menuItemService.findAll();
    }

    @GetMapping("/restaurant/{restaurantId}")
    public List<MenuItem> findByRestaurant(@PathVariable Long restaurantId) {
        return menuItemService.findByRestaurant(restaurantId);
    }

    @GetMapping("/{id}")
    public MenuItem findById(@PathVariable Long id) {
        return menuItemService.findById(id);
    }

    @PostMapping
    public MenuItem create(@RequestBody MenuItem menuItem) {
        return menuItemService.save(menuItem);
    }
}

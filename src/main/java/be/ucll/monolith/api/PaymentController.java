package be.ucll.monolith.api;

import be.ucll.monolith.business.PaymentService;
import be.ucll.monolith.persistence.entity.Payment;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/payments")
public class PaymentController {
    private final PaymentService paymentService;

    public PaymentController(PaymentService paymentService) {
        this.paymentService = paymentService;
    }

    @GetMapping
    public List<Payment> findAll() {
        return paymentService.findAll();
    }

    @GetMapping("/{id}")
    public Payment findById(@PathVariable Long id) {
        return paymentService.findById(id);
    }

    @PostMapping
    public Payment create(@RequestBody Payment payment) {
        return paymentService.save(payment);
    }
}

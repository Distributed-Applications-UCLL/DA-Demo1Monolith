package be.ucll.monolith.persistence.entity;

import jakarta.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "payment")
public class Payment {
    @Id
    private Long id;
    @OneToOne
    @JoinColumn(name = "order_id")
    private Order order;
    private BigDecimal amount;
    private String status;

    public Payment() {
    }

    public Payment(Long id, Order order, BigDecimal amount, String status) {
        this.id = id;
        this.order = order;
        this.amount = amount;
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

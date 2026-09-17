package be.ucll.monolith.persistence.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "delivery")
public class Delivery {
    @Id
    private Long id;
    @OneToOne
    @JoinColumn(name = "order_id")
    private Order order;
    private String address;
    private String status;

    public Delivery() {
    }

    public Delivery(Long id, Order order, String address, String status) {
        this.id = id;
        this.order = order;
        this.address = address;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

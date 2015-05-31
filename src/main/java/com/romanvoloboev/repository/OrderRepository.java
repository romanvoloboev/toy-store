package com.romanvoloboev.repository;

import com.romanvoloboev.model.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface OrderRepository extends JpaRepository<Booking, Integer> {
    @Query("select b from Booking b order by b.date desc")
    List<Booking> getAllOrderByDate();

    List<Booking> getByIdOrStatusOrCustomerIdOrderByDateDesc(Integer orderId, short status, Integer customerId);

    @Query("select count(b) from Booking b where b.status = 1")
    Short getNewOrdersCount();

    @Query("select count(b) from Booking b where b.status = 3")
    Integer getCompletedOrdersCount();

    List<Booking> getFirst5ByOrderByDateDesc();

    @Query("select sum(b.amount) from Booking b where b.status = 3")
    Float getTotalAmount();
}

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
}

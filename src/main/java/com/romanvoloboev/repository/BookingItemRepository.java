package com.romanvoloboev.repository;

import com.romanvoloboev.model.BookingItem;
import com.romanvoloboev.model.Product;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @author Roman Voloboev
 */

public interface BookingItemRepository extends JpaRepository<BookingItem, Integer> {
    @Query(value = "select p from BookingItem bi JOIN bi.product p where p.active=true group by p order by count(*) desc")
    List<Product> getPopularTop10Products(Pageable pageable);

    List<BookingItem> getByBookingId(int id);
}

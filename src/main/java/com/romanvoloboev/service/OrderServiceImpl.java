package com.romanvoloboev.service;

import com.romanvoloboev.dto.BookingDTO;
import com.romanvoloboev.dto.BookingItemDTO;
import com.romanvoloboev.model.Booking;
import com.romanvoloboev.model.BookingItem;
import com.romanvoloboev.model.Customer;
import com.romanvoloboev.model.Product;
import com.romanvoloboev.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.validation.Validation;
import javax.validation.Validator;
import java.util.*;

/**
 * @author Roman Voloboev
 */

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired private OrderRepository orderRepository;
    @Autowired private CustomerService customerService;
    @Autowired private ProductService productService;

    private List<Booking> selectModels() {
        return orderRepository.getAllOrderByDate();
    }

    private Booking save(Booking booking) {
        return orderRepository.save(booking);
    }

    private Booking selectModel(Integer id) {
        return orderRepository.getOne(id);
    }

    /**
     * Loads all orders in /cp/order
     * @return List BookingDTO
     */
    @Override
    public List<BookingDTO> selectDTOs() {
        List<Booking> bookings = selectModels();
        List<BookingDTO> bookingDTOs = new ArrayList<>();
        for (Booking booking:bookings) {
            bookingDTOs.add(new BookingDTO(booking.getId(), booking.getCustomer().getName(),
                    formatStatusToString(booking.getStatus()), booking.getAmount(), formatDateToString(booking.getDate())));
        }
        return bookingDTOs;
    }

    /**
     * Loads order details by ID
     * @param id - order
     * @return BookingDTO
     */
    @Transactional
    @Override
    public BookingDTO selectDTO(Integer id) throws Exception {
        Booking booking = selectModel(id);
        BookingDTO bookingDTO = null;
        if (booking != null) {
            bookingDTO = new BookingDTO(booking.getId(), booking.getAmount(), formatDateToString(booking.getDate()),
                    formatStatusToString(booking.getStatus()), formatDeliveryServiceToString(booking.getDeliveryService()),
                    formatDeliveryTypeToString(booking.getDeliveryType()), formatPaymentTypeToString(booking.getPaymentType()),
                    booking.getCustomer().getName(), booking.getCustomer().getEmail(), phoneToString(booking.getCustomer().getPhone()),
                    booking.getCustomerAddress(), getBookingItemsDTO(booking.getItems()));
        }
        return bookingDTO;
    }

    /**
     * Method save new booking, using for /cp/order/save
     */
    @Transactional
    @Override
    public void save(BookingDTO bookingDTO) throws Exception {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        if (validate(bookingDTO, validator)) {
            Customer customer = customerService.selectModel(bookingDTO.getCustomer());
            Booking booking = new Booking(bookingDTO.getAmount(), new Date(), (short)1, bookingDTO.getDeliveryType(),
                    bookingDTO.getDeliveryService(), bookingDTO.getPaymentType(), customer, bookingDTO.getCustomerAddress(), null);
            Booking savedBooking = save(booking);
            List<BookingItem> items = getBookingItems(bookingDTO.getItems(), savedBooking);
            savedBooking.setItems(items);
        }
    }

    @Override
    public void deleteOrder(Integer id) throws Exception {
        orderRepository.delete(id);
    }

    @Transactional
    @Override
    public void changeStatus(Integer id, short status) throws Exception {
        Booking booking = selectModel(id);
        if (booking.getStatus() != status) {
            booking.setStatus(status);
        }
    }

    /**
     * Method for orders search. Converts models to DTO and returns it.
     */
    @Transactional
    @Override
    public List<BookingDTO> searchOrder(Integer orderId, short status, Integer customerId) throws Exception {
        List<Booking> bookings;
        bookings = orderRepository.getByIdOrStatusOrCustomerIdOrderByDateDesc(orderId, status, customerId);
        List<BookingDTO> dtos = new ArrayList<>();
        if (bookings != null) {
            for (Booking booking:bookings) {
                dtos.add(new BookingDTO(booking.getId(), booking.getCustomer().getName(),
                        formatStatusToString(booking.getStatus()), booking.getAmount(), formatDateToString(booking.getDate())));
            }
        }
        return dtos;
    }

    /**
     * Transforms List of BookingItemDTO to List of BookingItem model.
     * Used when new booking added.
     * @param items - dto
     * @param booking - currently created booking
     * @return List of BookingItem model
     */
    private List<BookingItem> getBookingItems(List<BookingItemDTO> items, Booking booking) {
        List<BookingItem> bookingItems = new ArrayList<>();
        if (items != null) {
            Product product;
            for (BookingItemDTO itemDTO:items) {
                product = productService.selectModel(itemDTO.getProduct());
                bookingItems.add(new BookingItem(itemDTO.getQuantity(), itemDTO.getPrice(), itemDTO.getTotalItemPrice(), booking, product));
            }
        }
        return bookingItems;
    }

    /**
     * Transforms BookingItem Models to DTOs
     * @param items - List BookingItem Models
     * @return - List BookingItem DTO
     */
    private List<BookingItemDTO> getBookingItemsDTO(List<BookingItem> items) {
        List<BookingItemDTO> itemDTOs = new ArrayList<>();
        if (items != null) {
            for (BookingItem bookingItem:items) {
                itemDTOs.add(new BookingItemDTO(bookingItem.getQuantity(), bookingItem.getPrice(),
                        bookingItem.getTotalPrice(), bookingItem.getProduct().getName(), bookingItem.getProduct().getId()));
            }
        }
        return itemDTOs;
    }

}

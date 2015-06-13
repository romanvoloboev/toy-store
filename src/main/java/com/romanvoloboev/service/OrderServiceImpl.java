package com.romanvoloboev.service;

import com.romanvoloboev.dto.BookingDTO;
import com.romanvoloboev.dto.BookingItemDTO;
import com.romanvoloboev.model.Booking;
import com.romanvoloboev.model.BookingItem;
import com.romanvoloboev.model.Customer;
import com.romanvoloboev.model.Product;
import com.romanvoloboev.repository.BookingItemRepository;
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
    @Autowired private BookingItemRepository bookingItemRepository;

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
            double amount = Math.round(booking.getAmount() * 100);
            bookingDTOs.add(new BookingDTO(booking.getId(), booking.getCustomer().getName(),
                    formatStatusToString(booking.getStatus()), amount/100, formatDateToString(booking.getDate())));
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
            double amount = Math.round(booking.getAmount() * 100);
            bookingDTO = new BookingDTO(booking.getId(), amount/100, formatDateToString(booking.getDate()),
                    formatStatusToString(booking.getStatus()), formatDeliveryServiceToString(booking.getDeliveryService()),
                    formatDeliveryTypeToString(booking.getDeliveryType()), formatPaymentTypeToString(booking.getPaymentType()),
                    booking.getCustomerName(), booking.getCustomer().getEmail(), phoneToString(booking.getCustomerPhone()),
                    booking.getCustomerAddress(), getBookingItemsDTO(booking.getItems()));
        }
        return bookingDTO;
    }

    /**
     * Method save new booking, using for /order/save
     */
    @Transactional
    @Override
    public void save(BookingDTO bookingDTO) throws Exception {
        Validator validator = Validation.buildDefaultValidatorFactory().getValidator();
        if (validate(bookingDTO, validator)) {
            if (bookingDTO.getCustomer() == 0) bookingDTO.setCustomer(customerService.selectAuth().getId());
            Customer customer = customerService.selectModel(bookingDTO.getCustomer());
            double amount = Math.round(bookingDTO.getAmount() * 100);
            Booking booking = new Booking(amount/100, new Date(), (short)1, bookingDTO.getDeliveryType(),
                    bookingDTO.getDeliveryService(), bookingDTO.getPaymentType(), customer, bookingDTO.getCustomerAddress(),
                    stringToPhone(bookingDTO.getCustomerPhone()), bookingDTO.getCustomerName(), null);
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
     * Using when new booking adding.
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
                double itemPrice = Math.round(itemDTO.getPrice() * 100);
                double totalItemPrice = Math.round(itemDTO.getTotalItemPrice() * 100);
                bookingItems.add(new BookingItem(itemDTO.getQuantity(), itemPrice/100, totalItemPrice/100, booking, product));
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
                double price = Math.round(bookingItem.getPrice() * 100);
                double totalPrice = Math.round(bookingItem.getTotalPrice() * 100);
                itemDTOs.add(new BookingItemDTO(bookingItem.getQuantity(), price/100,
                        totalPrice/100, bookingItem.getProduct().getName(), bookingItem.getProduct().getId()));
            }
        }
        return itemDTOs;
    }

    public Short selectNewOrdersCount() {
        return orderRepository.getNewOrdersCount();
    }

    /**
     * Loads all orders in /cp/order
     * @return List BookingDTO
     */
    @Override
    public List<BookingDTO> selectLastDTOs() {
        List<Booking> bookings = orderRepository.getFirst5ByOrderByDateDesc();
        List<BookingDTO> bookingDTOs = new ArrayList<>();
        if (bookings != null) {
            for (Booking booking:bookings) {
                double amount = Math.round(booking.getAmount() * 100);
                bookingDTOs.add(new BookingDTO(booking.getId(), booking.getCustomer().getName(),
                        formatStatusToString(booking.getStatus()), amount/100, formatDateToString(booking.getDate())));
            }
        }
        return bookingDTOs;
    }

    @Override
    public Integer selectSoldProductsCount() {
        return orderRepository.getCompletedOrdersCount();
    }

    @Override
    public Float selectTotalOrdersAmount() {
        return orderRepository.getTotalAmount();
    }

    @Override
    public List<BookingDTO> selectCustomerOrders() {
        Customer customer = customerService.selectAuth();
        List<BookingDTO> dtos = new ArrayList<>();
        List<Booking> bookings = orderRepository.getByCustomerIdOrderByDateDesc(customer.getId());
        if (bookings != null) {
            for (Booking booking:bookings) {
                double amount = Math.round(booking.getAmount() * 100);
                dtos.add(new BookingDTO(booking.getId(), amount/100,
                        formatDateToString(booking.getDate()), formatStatusToString(booking.getStatus())));
            }
        }
        return dtos;
    }

    @Transactional
    @Override
    public List<BookingItemDTO> selectOrderDetails(int id) {
        List<BookingItemDTO> dtos = new ArrayList<>();
        if (orderRepository.exists(id)) {
            Customer customer = customerService.selectAuth();
            List<Booking> customerBookings = customer.getBookings();
            Booking booking = selectModel(id);
            if (customerBookings.contains(booking)) {
                List<BookingItem> bookingItems = bookingItemRepository.getByBookingId(id);
                if (bookingItems != null) {
                    for (BookingItem item:bookingItems) {
                        Product product = item.getProduct();
                        long[] imageId = selectImages(product.getImages());
                        double price = Math.round(item.getPrice() * 100);
                        double totalItemPrice = Math.round(item.getTotalPrice() * 100);
                        dtos.add(new BookingItemDTO(product.getId(), item.getQuantity(), price/100, totalItemPrice/100,
                                product.getName(), item.getId(), imageId[0]));
                    }
                }
            }
        }
        return dtos;
    }

}

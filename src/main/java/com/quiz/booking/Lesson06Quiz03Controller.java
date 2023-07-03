package com.quiz.booking;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.booking.bo.BookingBO;
import com.quiz.booking.domain.Booking;

@RequestMapping("/lesson06/quiz03")
@Controller
public class Lesson06Quiz03Controller {

	@Autowired
	private BookingBO bookingBO;
	
	@GetMapping("/booking_list_view")
	public String TreeHouse(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList", bookingList);
		return "booking/bookingList";
	}
	
	// 2) 예약 하기 화면
		@GetMapping("/make_booking_view")
		public String makeBookingView() {
			return "booking/makeBooking";
		}

		// 3) 예약 조회 화면
		@GetMapping("/search_booking_view")
		public String searchBookingView() {
			return "booking/searchBooking";
		}
}
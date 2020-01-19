package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import po.Comment;
import po.Customer;
import po.User;
import service.BMIService;

@Controller
public class BMIController {
@Autowired BMIService bmiService;

	@RequestMapping(value = "/bmitest.action", method = RequestMethod.GET)
	public String bmitestshow() {
		return "BMItest";
	}
	@RequestMapping(value = "/bmiresultshow.action")
	public String bmiresultshow(double customer_height, double customer_weight,Model model) {
		String bmi = bmiService.bmitest(customer_height, customer_weight);
		System.out.println(bmi);
		model.addAttribute("bmi", bmi);
		return "BMIresult";
	}
}

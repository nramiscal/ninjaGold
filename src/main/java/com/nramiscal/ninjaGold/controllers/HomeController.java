package com.nramiscal.ninjaGold.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	public static ArrayList<String> activities = new ArrayList<String>();
	public static int count = 0;
	
	@RequestMapping("/")
	public String index(HttpSession session, Model model) {
		if (session.getAttribute("total_gold") == null) {
			session.setAttribute("total_gold", 0);
		}
		model.addAttribute(count);
		return "index";
	}
	
	@RequestMapping(path="/process_money", method=RequestMethod.POST)
	public String process_money(HttpSession session, @RequestParam(value="location") String location) {
		System.out.println("location = " + location);
		Date date = new Date();
	
		int a = 0;
		int b = 0;
		int c = 0;
		
		
		
		if (location.equals("farm")) {
			a = 10;
			b = 20;
			c = 0;
		}
		else if (location.equals("cave")) {
			a = 5;
			b = 10;
			c = 0;
		}
		else if (location.equals("house")) {
			a = 2;
			b = 5;
			c = 0;
		}
		else if (location.equals("casino")) {
			a = 0;
			b = 50;
			Random r = new Random();
			c = r.nextInt(2);
		}
		System.out.println("a = " + a);
		System.out.println("b = " + b);
		System.out.println("c = " + c);
		Random r = new Random();
		Integer gold = r.nextInt(b - a) + a;
		System.out.println("gold = " + gold);
		
		session.setAttribute("total_gold", (Integer) session.getAttribute("total_gold") + gold);
		System.out.println("total gold = " + session.getAttribute("total_gold"));
		
		if (c == 0) {
			session.setAttribute("total_gold", (Integer) session.getAttribute("total_gold") + gold);
			String activity = "Earned " + gold + " golds from the " + location + "! " + date;
			activities.add(activity);
			count++;
			
			session.setAttribute("activities", activities);
		}
		else {
			session.setAttribute("total_gold", (Integer) session.getAttribute("total_gold") - gold);
			String activity = "You entered a casino and lost " + gold + " gold. Ouch." + date;
			activities.add(activity);
			count++;
			
			session.setAttribute("activities", activities);
		}
		

		

		
		
		return "redirect:/";
	}
	
	@RequestMapping("/reset")
	public String reset(HttpSession session) {
		session.setAttribute("total_gold", 0);
		activities.clear();
		count = 0;
		System.out.println(activities);
		return "redirect:/";
	}

}



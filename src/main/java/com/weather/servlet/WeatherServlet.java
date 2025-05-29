package com.weather.servlet;

import com.weather.beans.WeatherBean;
import com.weather.beans.UserPreferencesBean;
import com.weather.service.WeatherService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/weather")
public class WeatherServlet extends HttpServlet {
    private WeatherService weatherService = new WeatherService();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        UserPreferencesBean preferences = (UserPreferencesBean) session.getAttribute("userPreferences");
        if (preferences == null) {
            preferences = new UserPreferencesBean();
            session.setAttribute("userPreferences", preferences);
        }
        
        request.setAttribute("userPreferences", preferences);
        request.getRequestDispatcher("/weather.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String location = request.getParameter("location");
        if (location != null && !location.trim().isEmpty()) {
            WeatherBean weather = weatherService.getWeatherByLocation(location);
            request.setAttribute("weather", weather);
        }
        
        doGet(request, response);
    }
}
package com.weather.service;

import com.weather.beans.WeatherBean;
import com.weather.beans.LocationBean;
import java.util.Random;

public class WeatherService {
    private Random random = new Random();
    
    public WeatherBean getWeatherByLocation(String location) {
        // Simulate weather data (in a real app, this would call an external API)
        WeatherBean weather = new WeatherBean();
        weather.setLocation(location);
        
        // Generate mock weather data
        String[] conditions = {"Sunny", "Cloudy", "Rainy", "Partly Cloudy", "Thunderstorm", "Snow"};
        weather.setCondition(conditions[random.nextInt(conditions.length)]);
        weather.setTemperature(random.nextDouble() * 40 - 10); // -10 to 30°C
        weather.setHumidity(30 + random.nextInt(70)); // 30-100%
        weather.setWindSpeed(random.nextDouble() * 25); // 0-25 km/h
        
        return weather;
    }
    
    public LocationBean getLocationInfo(String locationName) {
        // Mock location data
        LocationBean location = new LocationBean();
        String[] parts = locationName.split(",");
        location.setCity(parts[0].trim());
        location.setCountry(parts.length > 1 ? parts[1].trim() : "Unknown");
        location.setLatitude(random.nextDouble() * 180 - 90);
        location.setLongitude(random.nextDouble() * 360 - 180);
        location.setTimezone("UTC" + (random.nextInt(24) - 12));
        return location;
    }
}
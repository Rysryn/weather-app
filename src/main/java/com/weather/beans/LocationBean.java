package com.weather.beans;

import java.io.Serializable;

public class LocationBean implements Serializable {
    private String city;
    private String country;
    private double latitude;
    private double longitude;
    private String timezone;
    
    public LocationBean() {}
    
    public LocationBean(String city, String country, double latitude, double longitude, String timezone) {
        this.city = city;
        this.country = country;
        this.latitude = latitude;
        this.longitude = longitude;
        this.timezone = timezone;
    }
    
    // Getters and Setters
    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
    
    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }
    
    public double getLatitude() { return latitude; }
    public void setLatitude(double latitude) { this.latitude = latitude; }
    
    public double getLongitude() { return longitude; }
    public void setLongitude(double longitude) { this.longitude = longitude; }
    
    public String getTimezone() { return timezone; }
    public void setTimezone(String timezone) { this.timezone = timezone; }
    
    public String getFullName() {
        return city + ", " + country;
    }
}

package com.weather.beans;

import java.io.Serializable;

public class UserPreferencesBean implements Serializable {
    private String temperatureUnit = "Celsius";
    private String windSpeedUnit = "km/h";
    private boolean enableNotifications = true;
    private String theme = "skeumorphic";
    
    public UserPreferencesBean() {}
    
    // Getters and Setters
    public String getTemperatureUnit() { return temperatureUnit; }
    public void setTemperatureUnit(String temperatureUnit) { this.temperatureUnit = temperatureUnit; }
    
    public String getWindSpeedUnit() { return windSpeedUnit; }
    public void setWindSpeedUnit(String windSpeedUnit) { this.windSpeedUnit = windSpeedUnit; }
    
    public boolean isEnableNotifications() { return enableNotifications; }
    public void setEnableNotifications(boolean enableNotifications) { this.enableNotifications = enableNotifications; }
    
    public String getTheme() { return theme; }
    public void setTheme(String theme) { this.theme = theme; }
}
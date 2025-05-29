<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.weather.beans.WeatherBean" %>
<%@ page import="com.weather.beans.UserPreferencesBean" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weather Station - Skeumorphic Interface</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .weather-station {
            max-width: 800px;
            margin: 0 auto;
            background: linear-gradient(145deg, #ecf0f1, #bdc3c7);
            border-radius: 25px;
            padding: 30px;
            box-shadow: 
                20px 20px 60px #a8b0b5,
                -20px -20px 60px #ffffff,
                inset 0 0 0 1px rgba(255,255,255,0.2);
            position: relative;
        }

        .weather-station::before {
            content: '';
            position: absolute;
            top: 10px;
            left: 10px;
            right: 10px;
            bottom: 10px;
            border-radius: 20px;
            border: 2px solid rgba(255,255,255,0.1);
            pointer-events: none;
        }

        .station-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .station-title {
            font-size: 2.5em;
            color: #2c3e50;
            text-shadow: 
                1px 1px 2px rgba(255,255,255,0.8),
                -1px -1px 2px rgba(0,0,0,0.1);
            margin-bottom: 10px;
        }

        .station-subtitle {
            color: #7f8c8d;
            font-size: 1.1em;
            text-shadow: 1px 1px 1px rgba(255,255,255,0.5);
        }

        .input-panel {
            background: linear-gradient(145deg, #d4d7da, #e8ebee);
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 30px;
            box-shadow: 
                inset 8px 8px 16px #bec3c7,
                inset -8px -8px 16px #ffffff;
        }

        .input-group {
            display: flex;
            gap: 15px;
            align-items: center;
            justify-content: center;
        }

        .location-input {
            flex: 1;
            max-width: 300px;
            padding: 15px 20px;
            border: none;
            border-radius: 25px;
            background: linear-gradient(145deg, #ffffff, #f0f3f4);
            box-shadow: 
                inset 6px 6px 12px #d1d5d8,
                inset -6px -6px 12px #ffffff;
            font-size: 16px;
            color: #2c3e50;
            outline: none;
            transition: all 0.3s ease;
        }

        .location-input:focus {
            box-shadow: 
                inset 8px 8px 16px #c8ccce,
                inset -8px -8px 16px #ffffff,
                0 0 0 3px rgba(52, 152, 219, 0.2);
        }

        .search-button {
            padding: 15px 25px;
            border: none;
            border-radius: 25px;
            background: linear-gradient(145deg, #3498db, #2980b9);
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 
                8px 8px 16px rgba(41, 128, 185, 0.3),
                -8px -8px 16px rgba(52, 152, 219, 0.1);
            transition: all 0.3s ease;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
        }

        .search-button:hover {
            transform: translateY(-2px);
            box-shadow: 
                10px 10px 20px rgba(41, 128, 185, 0.4),
                -10px -10px 20px rgba(52, 152, 219, 0.1);
        }

        .search-button:active {
            transform: translateY(1px);
            box-shadow: 
                inset 4px 4px 8px rgba(41, 128, 185, 0.6),
                inset -4px -4px 8px rgba(52, 152, 219, 0.2);
        }

        .weather-display {
            background: linear-gradient(145deg, #ecf0f1, #d5dbdb);
            border-radius: 20px;
            padding: 30px;
            box-shadow: 
                inset 12px 12px 24px #c8d0d3,
                inset -12px -12px 24px #ffffff;
            margin-bottom: 20px;
        }

        .weather-main {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .temperature-display {
            font-size: 4em;
            font-weight: bold;
            color: #e74c3c;
            text-shadow: 
                2px 2px 4px rgba(231, 76, 60, 0.3),
                1px 1px 2px rgba(255,255,255,0.8);
        }

        .condition-display {
            font-size: 1.8em;
            color: #34495e;
            text-shadow: 1px 1px 2px rgba(255,255,255,0.6);
        }

        .weather-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }

        .detail-card {
            background: linear-gradient(145deg, #ffffff, #e8ebee);
            border-radius: 15px;
            padding: 20px;
            text-align: center;
            box-shadow: 
                8px 8px 16px #d1d5d8,
                -8px -8px 16px #ffffff;
        }

        .detail-icon {
            font-size: 2.5em;
            margin-bottom: 10px;
            filter: drop-shadow(2px 2px 4px rgba(0,0,0,0.1));
        }

        .detail-value {
            font-size: 1.5em;
            font-weight: bold;
            color: #2c3e50;
            margin-bottom: 5px;
            text-shadow: 1px 1px 1px rgba(255,255,255,0.5);
        }

        .detail-label {
            color: #7f8c8d;
            font-size: 0.9em;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .location-display {
            text-align: center;
            margin-bottom: 20px;
            padding: 15px;
            background: linear-gradient(145deg, #3498db, #2980b9);
            border-radius: 15px;
            color: white;
            font-size: 1.3em;
            font-weight: bold;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.3);
            box-shadow: 
                8px 8px 16px rgba(41, 128, 185, 0.3),
                -8px -8px 16px rgba(52, 152, 219, 0.1);
        }

        .last-updated {
            text-align: center;
            color: #95a5a6;
            font-size: 0.9em;
            margin-top: 15px;
            font-style: italic;
        }

        .no-data {
            text-align: center;
            color: #7f8c8d;
            font-size: 1.2em;
            padding: 40px;
            background: linear-gradient(145deg, #f8f9fa, #e9ecef);
            border-radius: 15px;
            box-shadow: 
                inset 6px 6px 12px #d4d6d8,
                inset -6px -6px 12px #ffffff;
        }

        @media (max-width: 768px) {
            .weather-station {
                margin: 10px;
                padding: 20px;
            }
            
            .input-group {
                flex-direction: column;
            }
            
            .location-input {
                max-width: 100%;
                margin-bottom: 15px;
            }
            
            .weather-main {
                flex-direction: column;
                text-align: center;
            }
            
            .temperature-display {
                font-size: 3em;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="weather-station">
        <div class="station-header">
            <h1 class="station-title">🌤️ Weather Station</h1>
            <p class="station-subtitle">Real-time Weather Information System</p>
        </div>

        <form method="post" action="weather">
            <div class="input-panel">
                <div class="input-group">
                    <input type="text" 
                           name="location" 
                           class="location-input" 
                           placeholder="Enter city name (e.g., New York, London)" 
                           value="${param.location}"
                           required>
                    <button type="submit" class="search-button">
                        🔍 Get Weather
                    </button>
                </div>
            </div>
        </form>

        <% WeatherBean weather = (WeatherBean) request.getAttribute("weather"); %>
        <% if (weather != null) { %>
            <div class="weather-display">
                <div class="location-display">
                    📍 <%= weather.getLocation() %>
                </div>
                
                <div class="weather-main">
                    <div class="temperature-display">
                        <%= String.format("%.1f", weather.getTemperature()) %>°C
                    </div>
                    <div class="condition-display">
                        <%= weather.getCondition() %>
                    </div>
                </div>
                
                <div class="weather-details">
                    <div class="detail-card">
                        <div class="detail-icon">💧</div>
                        <div class="detail-value"><%= weather.getHumidity() %>%</div>
                        <div class="detail-label">Humidity</div>
                    </div>
                    
                    <div class="detail-card">
                        <div class="detail-icon">💨</div>
                        <div class="detail-value"><%= String.format("%.1f", weather.getWindSpeed()) %> km/h</div>
                        <div class="detail-label">Wind Speed</div>
                    </div>
                    
                    <div class="detail-card">
                        <div class="detail-icon">🌡️</div>
                        <div class="detail-value">
                            <%= weather.getCondition().equals("Sunny") ? "High" : 
                                weather.getCondition().equals("Rainy") ? "Low" : "Medium" %>
                        </div>
                        <div class="detail-label">Comfort Level</div>
                    </div>
                </div>
                
                <div class="last-updated">
                    Last updated: <%= weather.getLastUpdated() %>
                </div>
            </div>
        <% } else { %>
            <div class="no-data">
                <p>🌍 Enter a location above to get current weather information</p>
                <p style="margin-top: 10px; font-size: 0.9em;">Try locations like: New York, London, Tokyo, Sydney</p>
            </div>
        <% } %>
    </div>
</body>
</html>
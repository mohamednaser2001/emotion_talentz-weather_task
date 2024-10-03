# Weather Forecast Application

## Summary

This project is a Weather application developed using Flutter. The app provides weather information for spesific city and follows the MVVM clean architecture. It demonstrates effective state management, API integration, dynamic UI updates, and proper error handling.

## Features

### 1. MVVM Architecture
- The app is structured using the **Model-View-ViewModel (MVVM)** design pattern to ensure clear separation of concerns between the model, view, and viewmodel layers.

### 2. State Management
- A robust state management solution is implemented (Cubit) to handle the app’s state effectively.

### 3. API Integration
- The app connects to a public weather API to fetch weather data, including:
  - Temperature
  - Humidity
  - Wind speed
  - Weather conditions

### 4. Dynamic UI Updates
- The user interface updates dynamically based on API responses. It handles loading, error, and data states efficiently.

### 5. Error Handling
- Sophisticated error handling ensures proper management of API call failures, including user-friendly error messages.
Note: The messages shown to users are the default status code messages, because the API response codes were not clear enough.

### 6. User Input for City Selection
- Users can select different cities to view weather information. This feature implemented via a **search function**.

### 7. Local Caching
- Local caching is implemented to store the most recent weather data, allowing for **offline access**.

## #Advanced UI Interactions**: 
- The app includes animations and gestures for an enhanced user experience.
- **Theme Switching**: Users can toggle between **light** and **dark** themes.
- **Data Storage & Encryption**: Weather data, Base Url, and Api Key are stored locally and encrypted for security purposes.


#
<img src="https://github.com/user-attachments/assets/499251bb-dceb-4a49-a501-86baafa8d9a1" width=250 height=500 margin-right:2rem>     <img src="https://github.com/user-attachments/assets/ec8496aa-9f6a-4390-a9b1-0ac5a7ed8d19" width=250 height=500>

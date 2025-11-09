# RentACar-Mobile

A cross-platform mobile application for car rental booking built with Flutter. This is the **client-side mobile app** that allows members/users to browse and book cars for tourism purposes.

## 🚗 About

RentACar is a comprehensive car rental management system consisting of:
- **Mobile App** (this repository) - Built with Flutter for customers to browse and book cars
- **Web Admin Panel** - Laravel-based admin panel for managing bookings, vehicles, and members
- **REST API** - Laravel API endpoints that this mobile application consumes

This mobile application serves as the customer-facing platform where users can:
- Browse available vehicles (Small Cars, Large Cars, Minibus)
- View vehicle details and specifications
- Create car rental bookings
- Manage their profile
- Track their booking history

### Web Admin & API Repository
🔗 [RentACar Web Admin & API](https://github.com/Otniel113/RentACar)

## 📱 Features

- **Authentication System**
  - User registration
  - Secure login
  - Session management
  - Logout functionality

- **Vehicle Browsing**
  - View all available vehicles by category:
    - Small Cars (Mobil Kecil)
    - Large Cars (Mobil Besar)
    - Minibus
  - Detailed vehicle information

- **Booking System**
  - Create new car rental bookings
  - View booking details
  - Booking management

- **User Profile**
  - View member profile information
  - Update profile details

- **Bottom Navigation**
  - Home: Browse vehicles
  - Booking: Manage bookings
  - Profile: View and edit user information

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: Provider/Bloc (as implemented)
- **HTTP Client**: http package
- **Session Management**: Shared Preferences
- **Backend API**: Laravel REST API

## 🚀 Installation

### Prerequisites

- Flutter SDK (>=2.0.0)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- VS Code or Android Studio (recommended IDEs)
- Running instance of RentACar Web API

### Setup Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/Otniel113/RentACar-Mobile.git
   cd RentACar-Mobile
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure API endpoint**
   
   Update the API base URL in the API files located in `lib/api/` to point to your Laravel backend:
   ```dart
   // Example: lib/api/api_login.dart
   final String baseUrl = 'http://your-api-url:8000/api';
   ```

4. **Run the application**
   ```bash
   # For development
   flutter run
   
   # For specific device
   flutter run -d <device_id>
   
   # List available devices
   flutter devices
   ```

5. **Build the application**
   ```bash
   # Android APK
   flutter build apk
   
   # iOS
   flutter build ios
   ```

## 📁 Project Structure

```
RentACar-Mobile/
├── lib/
│   ├── main.dart                    # Application entry point
│   ├── api/                         # API integration layer
│   │   ├── api_booking.dart
│   │   ├── api_get_mobil_booking.dart
│   │   ├── api_login.dart
│   │   ├── api_logout.dart
│   │   ├── api_minibus.dart
│   │   ├── api_mobilbesar.dart
│   │   ├── api_mobilkecil.dart
│   │   ├── api_profile.dart
│   │   └── api_register.dart
│   ├── models/                      # Data models
│   │   ├── booking.dart
│   │   ├── member.dart
│   │   ├── minibus.dart
│   │   ├── mobilbesar.dart
│   │   └── mobilkecil.dart
│   ├── session/                     # Session management
│   │   └── session_manager.dart
│   ├── utils/                       # Utility functions
│   │   └── validator.dart
│   └── views/                       # UI screens
│       ├── home.dart
│       ├── login.dart
│       ├── regist.dart
│       └── bottomNavBar/
├── android/                         # Android platform files
├── ios/                            # iOS platform files
├── test/                           # Unit and widget tests
└── pubspec.yaml                    # Dependencies configuration
```

## 🔌 API Integration

This mobile application consumes REST API endpoints from the Laravel backend. The API client is implemented in the `lib/api/` directory.

### API Modules:
- **Authentication**: Login, Register, Logout
- **Vehicles**: Get vehicle lists by category
- **Bookings**: Create and retrieve bookings
- **Profile**: Get and update member information

Make sure the Laravel backend is running before using the mobile application.

## 👥 Contributors

This project was developed as part of a Platform-Based Application course. Module distribution based on Bottom Navigation Bar features:

![image](https://user-images.githubusercontent.com/57952404/175777751-7c60e946-74e2-4e8b-a26a-514ee2c64fe3.png)

1. **Otniel Abiezer**
   - Home module
   - Vehicle browsing functionality

2. **Gilang Muhamad Rizky**
   - Authentication system (Login, Register, Logout)
   - Session management

3. **Winico Fazry**
   - Profile module
   - Member information management

4. **Aulia Arief**
   - Booking module
   - Booking management system

## 📝 Submission Version

The submitted version is commit #22 with the title "Melengkapi Readme".

## 📋 Requirements

- Flutter SDK
- Dart SDK
- Active internet connection for API calls
- Running RentACar Web API server

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the issues page.

## 📧 Contact

For questions or support, please contact the development team through the GitHub repository.

## 📄 License

This project is developed for educational purposes as part of Platform-Based Application course.

---

**Note**: This is a cross-platform mobile application that works on both Android and iOS devices. Make sure to configure the backend API URL before running the application.

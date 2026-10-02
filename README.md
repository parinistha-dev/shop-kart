# 🛒 ShopKart

**ShopKart** is a Flutter-based e-commerce mobile application designed to provide a simple and user-friendly shopping experience.

The app includes user authentication, product browsing, product details, cart management, wishlist functionality, orders, Firebase integration, and REST API integration.

---

## ✨ Features

* 🔐 User Login & Signup
* 🔢 OTP Verification
* 🏠 Home Dashboard
* 🛍️ Product Listing
* 📦 Product Details
* 🛒 Add to Cart & Cart Management
* ❤️ Wishlist
* 📋 Orders
* 👤 Profile Management
* 🔥 Firebase Integration
* 🌐 REST API Integration
* 🔔 Push Notifications
* 💾 Local Data Storage
* ⚡ GetX State Management

---

## 🛠️ Tech Stack

| Technology            | Usage                             |
| --------------------- | --------------------------------- |
| **Flutter**           | Mobile application development    |
| **Dart**              | Programming language              |
| **GetX**              | State management & navigation     |
| **REST API**          | Backend communication             |
| **Firebase**          | Firebase services & notifications |
| **SharedPreferences** | Local storage                     |
| **SQLite**            | Local database                    |
| **Pinput**            | OTP input                         |
| **HTTP**              | API requests                      |

---

## 📱 App Flow

```text
Splash Screen
      ↓
Authentication
      ↓
Login / Signup
      ↓
OTP Verification
      ↓
Dashboard
      ↓
 ┌───────────────┐
 │     Home      │
 │  Categories   │
 │    Orders     │
 │   Wishlist    │
 │    Account    │
 └───────────────┘
      ↓
Product Details
      ↓
Cart
      ↓
Order
```

---

## 🏗️ Project Structure

```text
lib/
│
├── core/
│   └── network/
│       └── api_services.dart
│
├── features/
│   ├── auth/
│   ├── cart/
│   ├── dashboard/
│   ├── product_detail/
│   ├── profile_update/
│   ├── realtime_database/
│   └── splash/
│
├── services/
│   └── notification_services.dart
│
├── firebase_options.dart
├── main.dart
└── routes.dart
```

The project follows a feature-based structure with separate screens, controllers, bindings, and services.

---

## 🔌 API Integration

ShopKart communicates with a backend REST API for application data.

The API service handles:

* GET requests
* POST requests
* PATCH requests
* DELETE requests
* Authentication headers
* Token retrieval from local storage

Authentication tokens are stored locally and attached to authenticated API requests.

---

## 🔥 Firebase

Firebase is used for application services such as:

* Firebase initialization
* Push notifications
* Firebase-related application functionality

---

## ⚡ GetX

GetX is used throughout the application for:

* State management
* Dependency injection
* Route management
* Controllers
* Bindings

Example architecture:

```text
Screen
  ↓
Controller
  ↓
API Service
  ↓
REST API
```

---

## 📸 Screenshots

Add screenshots of the application here:

```text
screenshots/
├── splash.png
├── login.png
├── home.png
├── product_details.png
├── cart.png
├── wishlist.png
└── orders.png
```

You can then display them in the README:

```markdown
![Splash Screen](screenshots/splash.png)
![Home Screen](screenshots/home.png)
![Product Details](screenshots/product_details.png)
![Cart](screenshots/cart.png)
```

---

## 🎯 Learning & Development

This project was developed to practice and demonstrate:

* Flutter application development
* Dart programming
* GetX architecture
* REST API integration
* Authentication flow
* Firebase integration
* Local storage
* State management
* Feature-based project organization
* Real-world mobile application development

---

## 🔮 Future Improvements

Possible future improvements include:

* 💳 Payment gateway integration
* 📍 Address management
* 🔎 Advanced product search
* 🎚️ Product filtering and sorting
* 📦 Improved order tracking
* ⭐ Product reviews and ratings
* 🌙 Dark mode
* 🧪 Automated testing

---

## 👨‍💻 Developer

Developed using **Flutter & Dart** with a focus on learning, practical implementation, and real-world mobile application development.

---

## 📄 License

This project is for educational and portfolio purposes.

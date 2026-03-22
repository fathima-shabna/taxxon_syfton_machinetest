# Taxxon Flutter App

A modern tax and VAT management mobile application built with Flutter, matching high-fidelity Figma designs.

## 🚀 Features

### 🔐 Authentication
- **Secure Login**: Fully integrated with **Firebase Authentication**.
- **User Management**: Simple username/password authentication for secure access.
- **Protected Routes**: Only authorized users can access the dashboard.
- **Splash Screen**: Professional branding on app start.
- **Logout**: Confirmation dialog from the home menu.

### 📊 Dashboard
- **VAT Summary**: Dynamic cards for **Input VAT**, **Output VAT**, and **VAT Payable** with accurate color coding.
- **Transaction History**: Row-based colored transaction list (Red/Pink for Expenses, Green for Sales).
- **Interactive Actions**: Quick access buttons for **Purchase Expense** and **Sales**.
- **Responsive Navigation**: Bottom navigation for Home and Profile.

## 🛠 Technology Stack
- **Framework**: [Flutter](https://flutter.dev/)
- **State Management**: [Riverpod](https://riverpod.dev/)
- **Backend**: [Firebase Auth](https://firebase.google.com/docs/auth)
- **Database**: [Cloud Firestore](https://firebase.google.com/docs/firestore) (Configured)
- **Fonts**: [Google Fonts (Inter)](https://fonts.google.com/specimen/Inter)
- **Architecture**: **Clean Architecture** (Feature-based folder structure)

## 📦 Setup & Installation

### Prerequisites
- Flutter SDK installed.
- VS Code or Android Studio with Flutter/Dart plugins.
- Firebase CLI (optional but recommended).

### 1. Firebase Configuration
Before running the app, you need to connect it to your Firebase project:
1.  Go to the [Firebase Console](https://console.firebase.google.com/).
2.  Create a new project named **Taxxon**.
3.  Register your Android app (`com.example.taxxon_fathimashabna`).
4.  Download `google-services.json` and place it in `android/app/`.
5.  Enable **Email/Password** authentication in the Firebase Auth section.
6.  Add a test user manually in the Firebase console.

> Detailed steps are available in [firebase_setup.md](.gemini/antigravity/brain/<convo-id>/firebase_setup.md) 

### 2. Run the App
```bash
flutter pub get
flutter run
```

## 🎨 Design System
- **Primary Color**: `#00629F` (Taxxon Blue)
- **Typography**: Inter (Regular, SemiBold, Bold)
- **VAT Card Colors**: Precision hex codes with 90% opacity as per Figma.

## 📁 Project Structure
- `lib/core`: App-wide themes, colors, and shared utilities.
- `lib/features/auth`: Login, Signup, and Authentication logic.
- `lib/features/home`: Dashboard UI and Transaction components.
- `lib/models`: Shared transaction and state models.

---
*Created by Antigravity for Taxxon.*

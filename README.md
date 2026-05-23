# Watheer (وثير) - Mental Health & Telecare Application

Watheer is a cross-platform Flutter application designed for mental healthcare services, online consultations, professional supervision, and psychological self-care. The application provides an Arabic-first experience with full RTL support and a modern user-friendly interface tailored for the Middle Eastern audience.

The platform allows users to explore mental health specialists, book appointments, access educational courses, and track emotional well-being through integrated self-care tools.

---

## 🌐 Live Demo

🔗 Web Demo: https://watheer-demo.web.app

---

## ✨ Features

### 🩺 Telehealth & Consultation
- Browse psychiatrists and psychotherapists
- View doctor profiles and consultation details
- Book online appointments
- Appointment scheduling with time slot selection
- Session tracking and status management

---

<img width="1500" height="3248" alt="Home Screen – Psychological Care" src="https://github.com/user-attachments/assets/92642cd7-8851-4baf-84ac-062a78d03d64" />
<img width="1532" height="3280" alt="Home Screen – Other Services" src="https://github.com/user-attachments/assets/3807eb78-24e0-4359-925e-1b8344e5fe45" />
<img width="1500" height="3248" alt="Navigation Drawer" src="https://github.com/user-attachments/assets/354e6285-1d14-43b1-9d20-0e23a3793f03" />
<img width="1500" height="3248" alt="Mood Tracker" src="https://github.com/user-attachments/assets/4a9893df-f420-4f0d-9d31-191cd11bc152" />
<img width="1500" height="4128" alt="Psychiatry" src="https://github.com/user-attachments/assets/340fd800-351e-4f6c-8990-029a9c7dce38" />
<img width="1500" height="4128" alt="Psychotherapy" src="https://github.com/user-attachments/assets/058934ce-437b-44e7-bb96-c0cb64990caf" />
<img width="1500" height="3248" alt="Doctor Profile" src="https://github.com/user-attachments/assets/5455a5c7-26d0-4342-b7f8-31f64af38501" />

---

### 🎓 Courses & Professional Development
- Explore mental health courses and training sessions
- View course details and schedules
- Access educational resources and materials
- Professional supervision workflows

### 🧠 Mental Health Utilities
- Mood tracking functionality
- Panic support & breathing guidance screens
- Emotional wellness monitoring
- Daily self-care interactions

### 🌍 Localization & UX
- Arabic-first interface
- Full Right-to-Left (RTL) support
- Responsive UI for multiple screen sizes
- Smooth Flutter animations and modern design system

---

## 🛠️ Tech Stack

- **Framework:** Flutter
- **Language:** Dart
- **Architecture:** MVC-inspired structure
- **State Management:** Controller-based architecture
- **Backend Integration:** REST APIs / Firebase (depending on environment)
- **Local Storage:** SharedPreferences / Secure Storage
- **Design:** Custom reusable widgets with responsive layouts

---

## 📂 Project Structure

```text
lib/
├── Views/
│   ├── screens/        # Application screens/pages
│   └── widgets/        # Reusable custom widgets
│
├── controllers/        # Business logic & app controllers
├── models/             # Data models
├── services/           # API services & backend communication
├── utils/              # Constants, helpers, themes & utilities
│
└── main.dart           # Application entry point
```

---

## 📱 Main Modules

- Authentication & onboarding
- Doctor discovery system
- Appointment booking flow
- Course & supervision system
- Mood tracking utilities
- User profile management
- RTL localization support

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed
- Android Studio / VS Code
- Android emulator or physical device

### Installation

```bash
# Clone repository
git clone https://github.com/your-username/watheer.git

# Open project
cd watheer

# Install dependencies
flutter pub get

# Run the application
flutter run
```

---

## 🎨 UI/UX Highlights

- Clean Arabic-focused design
- Modern healthcare-inspired interface
- Reusable component-based UI system
- Responsive layouts for different device sizes
- Smooth onboarding and navigation experience

---

## ⚠️ Challenges Faced

### RTL Layout Handling
Building complex layouts with Arabic Right-to-Left support required careful handling of alignments, icons, paddings, and navigation flow to maintain a natural user experience.

### Appointment Scheduling Logic
Managing dynamic appointment slots and preventing overlapping reservations required synchronized UI updates and proper state handling.

### Reusable Architecture
Creating reusable widgets and scalable screen structures while maintaining clean code organization across multiple modules.

---

## 📚 What I Learned

Through this project, I improved my understanding of:

- Flutter UI architecture
- RTL application development
- Responsive mobile UI design
- API integration workflows
- State management patterns
- Reusable component systems
- Real-world healthcare application flows

---

## 🔮 Future Improvements

- Real-time chat & video consultations
- Push notifications
- Payment gateway integration
- Dark mode support
- Admin dashboard integration
- AI-powered mental wellness assistant

---

## 👨‍💻 Author

Abdul Saboor  
Flutter Developer

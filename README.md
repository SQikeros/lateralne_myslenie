# 💡 Techniki Lateralnego Myślenia
## Lateral Thinking Techniques - Interactive Mobile App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-lightgrey?style=for-the-badge)

**A comprehensive Flutter application teaching creative thinking through 10 interactive games and challenges.**

[Features](#-features) • [Games](#-10-interactive-games) • [Technologies](#-technologies) • [Installation](#-installation) • [Screenshots](#-screenshots)

</div>

---

## 📖 About

**Techniki Lateralnego Myślenia** (Lateral Thinking Techniques) is an educational mobile application that teaches users creative problem-solving methods through interactive games and exercises. Built with Flutter, it combines theory with practice, making learning engaging and fun.

The app features **10 different lateral thinking techniques** divided into 4 categories, each designed to train specific cognitive skills and creative thinking patterns.

### 🎯 Project Purpose

This application was developed as an engineering thesis project, demonstrating:
- Advanced Flutter/Dart development skills
- Interactive UI/UX design principles
- State management patterns
- Mobile game mechanics implementation
- Educational content delivery through gamification

---

## ✨ Features

- 🎮 **10 Interactive Games** - Each teaching a different lateral thinking technique
- 📱 **Material Design 3** - Modern, beautiful UI with gradient themes
- ⚡ **Express Challenges** - Quick 30-60 second mini-games for on-the-go practice
- 🎨 **Custom Animations** - Smooth transitions and interactive elements
- 📊 **Progress Tracking** - Monitor your performance across games
- 🌍 **Polish Language** - Fully localized UI and content
- 🎯 **Educational Content** - Theory + practice for each technique

---

## 🎮 10 Interactive Games

### 🎯 Classic Techniques (3 games)

#### 1. **Losowe Połączenia** (Random Connections)
- **Technique:** Random Input Method
- **Description:** Connect unrelated concepts to spark creative ideas
- **Gameplay:** Generate random word pairs and find innovative connections

#### 2. **Odwróć Problem** (Reverse the Problem)
- **Technique:** Reversal Technique
- **Description:** Look at problems from the opposite perspective
- **Gameplay:** Practice problem inversion with guided exercises

#### 3. **Prowokacja** (Provocation)
- **Technique:** Provocation Technique
- **Description:** Challenge assumptions and obvious solutions
- **Gameplay:** Generate provocative statements to break mental patterns

---

### 🎮 Interactive Challenges (4 games)

#### 4. **Analogie** (Analogies)
- **Technique:** Analogical Thinking
- **Description:** Find similarities between different domains
- **Gameplay:** Click cards to reveal analogies between 6 pairs of concepts
- **Features:** Grid layout, animated card flips, explanations

#### 5. **Wyzwanie SCAMPER** (SCAMPER Challenge)
- **Technique:** SCAMPER Method (Substitute, Combine, Adapt, Modify, Put to other uses, Eliminate, Reverse)
- **Description:** Systematically explore 7 innovation strategies
- **Gameplay:** Swipeable pages with text input for each SCAMPER letter
- **Features:** Progress dots, summary dialog, save responses

#### 6. **Sześć Kapeluszy Myślenia** (Six Thinking Hats)
- **Technique:** Edward de Bono's Six Hats Method
- **Description:** Explore 6 different thinking perspectives
- **Gameplay:** 60-second timer per hat with guided questions and note-taking
- **Hats:** 
  - 🤍 White (Facts & Data)
  - ❤️ Red (Emotions & Feelings)
  - 🖤 Black (Risks & Caution)
  - 💛 Yellow (Benefits & Optimism)
  - 💚 Green (Creativity & Ideas)
  - 💙 Blue (Control & Process)
- **Features:** Animated pulse effect, countdown timer, persistent notes

#### 7. **Lista Cech** (Attribute Listing)
- **Technique:** Mix & Match Attributes
- **Description:** Modify object attributes to create innovations
- **Gameplay:** Select attributes for 3 objects (Chair, Watch, Mug) across 5 categories
- **Features:** ChoiceChips interface, live preview of combinations

---

### ⚡ Express Games (30-60 seconds)

#### 8. **Sprint Słowny** (Word Sprint)
- **Challenge:** Generate as many word associations as possible in 60 seconds
- **Gameplay:** Type words related to a given concept, press Enter to submit
- **Features:** Real-time countdown, auto-focus input, word chips display
- **Goal:** Train quick thinking and mental flexibility

#### 9. **Historia Emoji** (Emoji Story)
- **Challenge:** Create a story using only emojis (no words!)
- **Gameplay:** Select from 64 emojis across 8 categories, build your narrative
- **Features:** Horizontal scrolling emoji picker, story composition area
- **Categories:** Smileys, Animals, Food, Travel, Activities, Objects, Symbols, Flags
- **Goal:** Practice visual storytelling and non-verbal communication

#### 10. **Inżynieria Wsteczna** (Reverse Engineering)
- **Challenge:** Discover the function of mysterious objects
- **Gameplay:** Multiple choice quiz with 4 unusual objects, hints, and explanations
- **Features:** Feedback system (✓/✗), scoring, detailed answers
- **Goal:** Train deductive reasoning and lateral thinking

---

### 🚀 Advanced (Experimental)

#### 11. **Mapa Myśli** (Mind Mapping) - *Currently disabled*
- **Technique:** Visual Brainstorming
- **Description:** Create interactive mind maps with custom nodes
- **Features:** CustomPaint for connection lines, dynamic branch adding
- **Status:** Under development

---

## 🛠️ Technologies

### Core Technologies
- **Flutter SDK** (3.0+) - Cross-platform mobile framework
- **Dart** (3.0+) - Programming language
- **Material Design 3** - Modern UI design system

### Flutter Features Used
- **State Management:** StatefulWidget pattern
- **Animations:** AnimationController, Transitions, Curves
- **Custom Graphics:** CustomPaint for drawing (Mind Mapping)
- **Timers:** dart:async for countdown functionality
- **Layouts:** GridView, ListView, PageView, Stack
- **UI Components:** ChoiceChip, TextField, Card, Dialog
- **Gestures:** GestureDetector, Draggable/DragTarget

### Architecture
- **Modular Structure:** Separate files for each game in `/lib/screens/games/`
- **Consistent Styling:** Shared color palette and design patterns
- **Responsive Design:** SafeArea and flexible layouts for different screen sizes

---

## 📊 Project Statistics

- **Lines of Code:** ~4,200+
- **Games Implemented:** 10 (+ 1 experimental)
- **UI Patterns:** 15+ (grids, swipe, timers, custom paint, etc.)
- **Categories:** 4 (Classic, Interactive, Express, Advanced)
- **Screens:** 14 (Home, About Author, 10 Games, Menu, Welcome)

---

## 🚀 Installation

### Prerequisites
- Flutter SDK 3.0 or higher
- Dart SDK 3.0 or higher
- Android Studio / Xcode (for emulators)
- Git

### Setup

1. **Clone the repository**
```bash
git clone https://github.com/YOUR_USERNAME/lateral-thinking-app.git
cd lateral-thinking-app
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
# Check available devices
flutter devices

# Run on connected device/emulator
flutter run

# Run in debug mode
flutter run -d <device_id>

# Build APK (Android)
flutter build apk --release

# Build for iOS
flutter build ios --release
```

---

## 📂 Project Structure

```
lib/
├── main.dart                          # App entry point
├── screens/
│   ├── home_screen.dart              # Main navigation with tabs
│   ├── menu_tab.dart                 # Game selection menu (10 games)
│   ├── about_author_tab.dart         # About section
│   └── games/
│       ├── random_connection_game.dart
│       ├── reversal_game.dart
│       ├── provocation_game.dart
│       ├── analogies_game.dart
│       ├── scamper_game.dart
│       ├── six_hats_game.dart
│       ├── attribute_listing_game.dart
│       ├── word_sprint_game.dart
│       ├── emoji_story_game.dart
│       ├── reverse_engineering_game.dart
│       └── mind_mapping_game.dart    # (Disabled)
├── assets/                            # Images, fonts, etc.
└── pubspec.yaml                       # Dependencies
```

---

## 🎨 Design Philosophy

### Color Palette
- **Primary:** `#6366F1` (Indigo) - Main brand color
- **Secondary:** `#EC4899` (Pink) - Accent and highlights
- **Accent:** `#8B5CF6` (Purple) - Interactive elements
- **Success:** `#10B981` (Green) - Positive feedback
- **Warning:** `#F59E0B` (Amber) - Alerts
- **Error:** `#EF4444` (Red) - Errors and dangers
- **Info:** `#06B6D4` (Cyan) - Information

### UI Principles
- **Material Design 3** guidelines
- **Gradient backgrounds** for visual appeal
- **Card-based layouts** for content organization
- **Consistent iconography** across all screens
- **Smooth animations** for better UX
- **Clear visual hierarchy** with typography

---

## 🎓 Educational Background

This app is based on established creative thinking methodologies:

### Key Theorists
- **Edward de Bono** - Six Thinking Hats, Lateral Thinking
- **Bob Eberle** - SCAMPER technique
- **Alex Osborn** - Brainstorming, Creative Problem Solving

### Learning Outcomes
After using this app, users will be able to:
- ✅ Apply multiple creative thinking techniques
- ✅ Break mental patterns and assumptions
- ✅ Generate innovative solutions to problems
- ✅ Think from multiple perspectives
- ✅ Improve creative confidence

---

## 👨‍💻 Author

**Grzesiek**
- Flutter Developer
- Engineering Thesis Project
- Contact: [Your Email/LinkedIn]

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- Flutter and Dart teams for excellent documentation
- Material Design team for design guidelines
- Edward de Bono for lateral thinking methodologies
- All creative thinking pioneers whose techniques inspired this app

---

## 🔮 Future Enhancements

- [ ] Complete Mind Mapping feature
- [ ] Add progress tracking and statistics
- [ ] Implement user profiles
- [ ] Add more languages (English, German)
- [ ] Include difficulty levels
- [ ] Add social sharing features
- [ ] Create daily challenges
- [ ] Implement achievement system

---

## 🐛 Known Issues

- Mind Mapping game is currently disabled (under development)
- Some text overflow on very small screens (workaround: SafeArea implemented)

---

## 📞 Contact & Support

Have questions or suggestions? Feel free to:
- Open an [Issue](https://github.com/YOUR_USERNAME/lateral-thinking-app/issues)
- Submit a [Pull Request](https://github.com/YOUR_USERNAME/lateral-thinking-app/pulls)
- Contact me directly at [roder.plska@gmail.com]

---

<div align="center">

**Made with ❤️ and Flutter**

⭐ Star this repo if you found it useful! ⭐

</div>

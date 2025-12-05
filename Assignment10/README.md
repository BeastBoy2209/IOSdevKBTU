# Assignment 11 - Superhero Randomizer App

An iOS application that fetches and displays random superhero information from the SuperHero API, featuring networking with Alamofire, image loading with Kingfisher, and data persistence with UserDefaults.

## 📱 Features

### Core Functionality
- ✅ Fetch random superheroes from the SuperHero API
- ✅ Display 16 detailed attributes for each hero
- ✅ Persistent storage of last viewed hero using UserDefaults
- ✅ Beautiful animations and transitions
- ✅ Loading indicators
- ✅ Comprehensive error handling

### Technologies Used
- **UIKit** - User interface framework
- **Alamofire** - Modern networking library
- **Kingfisher** - Image downloading and caching
- **UserDefaults** - Local data persistence
- **Swift 5** - Programming language
- **Auto Layout** - Responsive design

## 🎯 Requirements Met

### 1. ✅ Networking
- Uses **Alamofire** package for all network requests
- Uses **Kingfisher** package for image loading and caching
- Fetches data from: `https://akabab.github.io/superhero-api/api/all.json`
- Proper error handling for network failures

### 2. ✅ Random Superhero Functionality
- "Next"/"Randomize" button fetches a new random hero
- Selects from the full list of 563+ superheroes
- True randomness on each tap

### 3. ✅ Display 10+ Attributes
The app displays **16 attributes**:
1. **Name** - Superhero name
2. **Full Name** - Real identity
3. **Alignment** - Good, bad, or neutral
4. **Place of Birth** - Origin location
5. **Gender** - Male, female, or other
6. **Race** - Species or race
7. **Height** - Physical height
8. **Weight** - Physical weight
9. **Publisher** - Marvel, DC, etc.
10. **Intelligence** - Intelligence stat (progress bar)
11. **Strength** - Strength stat (progress bar)
12. **Speed** - Speed stat (progress bar)
13. **Durability** - Durability stat (progress bar)
14. **Power** - Power stat (progress bar)
15. **Combat** - Combat stat (progress bar)
16. **Image** - Hero photo

### 4. ✅ UserDefaults Persistence
- Last selected hero is automatically saved to UserDefaults
- On app launch, the saved hero is displayed immediately
- No network delay for returning users
- Efficient JSON encoding/decoding

### 5. ✅ User Interface
- Clean, modern design using UIKit
- Auto Layout ensures compatibility with all device sizes
- Rounded corners on images
- Styled buttons
- Progress bars for power statistics
- Smooth animations throughout

### 6. ✅ Code Quality
- **Organized structure** with separate files:
  - `Hero.swift` - Data models
  - `NetworkManager.swift` - API networking
  - `HeroStorageManager.swift` - UserDefaults management
  - `ViewController.swift` - UI logic
- **Best practices**:
  - Singleton patterns for managers
  - Weak self references to prevent memory leaks
  - Proper error handling throughout
  - Clear separation of concerns
  - MARK comments for organization

### 7. ✅ Error Handling
- Network failure alerts
- Retry functionality
- Placeholder images for failed loads
- JSON decode error handling
- User-friendly error messages

### 8. ✅ Bonus Features
- **Animations**:
  - Fade in/out transitions between heroes
  - Animated progress bar updates
  - Smooth image transitions with Kingfisher
- **Loading Indicator**:
  - Activity indicator during network requests
  - Button disable during loading
  - Visual feedback for user actions

## 🏗️ Project Structure

```
Assignment10/
├── Assignment10/
│   ├── AppDelegate.swift
│   ├── SceneDelegate.swift
│   ├── ViewController.swift          # Main UI controller
│   ├── Hero.swift                     # Data models (Codable structs)
│   ├── NetworkManager.swift           # Alamofire networking layer
│   ├── HeroStorageManager.swift       # UserDefaults persistence
│   ├── Main.storyboard                # UI layout
│   ├── Assets.xcassets                # Images and colors
│   └── Info.plist
├── Assignment10.xcodeproj/
├── SETUP_GUIDE.md                     # Installation instructions
├── VIDEO_SCRIPT.md                    # Video demonstration guide
└── README.md                          # This file
```

## 🚀 Installation

### Prerequisites
- macOS Monterey or later
- Xcode 14.0 or later
- iOS 15.0+ deployment target

### Setup Steps

1. **Clone or open the project**
   ```bash
   cd /Users/beasty/Documents/IOSdevKBTU/Assignment10
   open Assignment10.xcodeproj
   ```

2. **Add Package Dependencies**
   
   In Xcode:
   - Select project in navigator
   - Go to "Package Dependencies" tab
   - Click "+" button
   
   **Add Alamofire:**
   - URL: `https://github.com/Alamofire/Alamofire.git`
   - Version: 5.9.0 - Next Major
   
   **Add Kingfisher:**
   - URL: `https://github.com/onevcat/Kingfisher.git`
   - Version: 7.10.0 - Next Major

3. **Build and Run**
   - Select a simulator or device
   - Press ⌘R or click Run button
   - App will fetch and display a random superhero

## 💻 Usage

### First Launch
1. Launch the app
2. Loading indicator appears
3. Random superhero is fetched from API
4. All information displays with animations
5. Hero is saved to UserDefaults

### Subsequent Launches
1. App opens instantly with last viewed hero
2. No loading delay - data from UserDefaults
3. Tap "Next" to get a new random hero

### Randomize Feature
1. Tap the "Next" button at any time
2. Loading indicator shows briefly
3. New random hero appears with smooth animation
4. New hero is saved automatically

## 🔧 Technical Implementation

### NetworkManager
- Singleton pattern for global access
- Uses Alamofire for HTTP requests
- Decodes JSON to Swift structs
- Result-based completion handlers
- Comprehensive error handling

### HeroStorageManager
- Singleton pattern for UserDefaults management
- JSON encoding/decoding for Hero objects
- Safe read/write operations
- Synchronization for data consistency

### ViewController
- Weak self references in closures
- Main thread UI updates
- Kingfisher for efficient image loading
- UIView animations for smooth transitions
- Activity indicator for loading states

## 📊 Data Models

```swift
struct Hero: Codable {
    let id: Int
    let name: String
    let biography: Biography
    let appearance: Appearance
    let powerstats: Powerstats
    let images: Images
}
```

All models conform to `Codable` for:
- JSON decoding from API
- UserDefaults persistence
- Type-safe data handling

## 🎨 UI Components

- `UIImageView` - Hero image (with Kingfisher)
- `UILabel` - Text information (16 labels)
- `UIProgressView` - Power statistics (6 bars)
- `UIButton` - Randomize action
- `UIActivityIndicatorView` - Loading state
- `UIAlertController` - Error messages

## 🧪 Testing Scenarios

1. **Network Success**
   - Tap randomize
   - Verify new hero loads
   - Check all attributes display correctly

2. **Persistence**
   - View a hero
   - Close app completely
   - Reopen app
   - Verify same hero appears

3. **No Internet**
   - Turn off WiFi/data
   - Tap randomize
   - Verify error alert appears
   - Verify retry option works

4. **Image Loading**
   - Check images load smoothly
   - Verify placeholder during load
   - Check fade-in animation

## 📝 Key Code Snippets

### Fetching Heroes with Alamofire
```swift
AF.request(apiURL, method: .get)
    .validate(statusCode: 200..<300)
    .responseDecodable(of: [Hero].self) { response in
        // Handle response
    }
```

### Loading Images with Kingfisher
```swift
imagePrev.kf.setImage(
    with: url,
    options: [
        .transition(.fade(0.3)),
        .cacheOriginalImage
    ]
)
```

### Saving to UserDefaults
```swift
let encoder = JSONEncoder()
let heroData = try encoder.encode(hero)
defaults.set(heroData, forKey: Keys.lastHeroData)
```

## 🎬 Video Demonstration

A video demonstration is included showing:
- Random hero fetching
- Displaying all 16+ attributes
- App relaunch with persisted data
- Loading indicators
- Smooth animations
- Error handling

## 📚 Learning Outcomes

This project demonstrates understanding of:
- RESTful API integration
- Swift Package Manager
- Third-party library integration (Alamofire, Kingfisher)
- JSON parsing and Codable protocol
- UserDefaults persistence
- Memory management (weak references)
- UIKit animations
- Error handling patterns
- MVC architecture
- Auto Layout

## 🐛 Known Issues

None currently. All features working as expected.

## 🔮 Future Enhancements

Possible improvements:
- Search functionality
- Favorites list
- Hero comparison feature
- Share hero information
- Dark mode support
- iPad optimization
- Accessibility improvements

## 👨‍💻 Author

Created for iOS Development course at KBTU
Assignment 11 - Superhero Randomizer App

## 📄 License

This is an academic project for educational purposes.

## 🙏 Acknowledgments

- [SuperHero API](https://akabab.github.io/superhero-api/) for the data
- [Alamofire](https://github.com/Alamofire/Alamofire) for networking
- [Kingfisher](https://github.com/onevcat/Kingfisher) for image handling

---

**Note**: Make sure to add Alamofire and Kingfisher packages before building. See SETUP_GUIDE.md for detailed instructions.

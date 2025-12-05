# Assignment 11 - Setup Instructions

## Package Dependencies Added

This project now uses Swift Package Manager (SPM) to manage dependencies.

### Required Packages:
1. **Alamofire** - For networking
   - URL: https://github.com/Alamofire/Alamofire.git
   - Version: 5.9.0 or later

2. **Kingfisher** - For image loading and caching
   - URL: https://github.com/onevcat/Kingfisher.git
   - Version: 7.10.0 or later

## How to Add Packages in Xcode

### Method 1: Using Xcode Interface
1. Open `Assignment10.xcodeproj` in Xcode
2. Select the project in the navigator (Assignment10)
3. Select the Assignment10 target
4. Go to the "Package Dependencies" tab
5. Click the "+" button to add packages

#### Add Alamofire:
- In the search field, enter: `https://github.com/Alamofire/Alamofire.git`
- Select the version rule (5.9.0 - Next Major)
- Click "Add Package"
- Select "Assignment10" target and click "Add Package"

#### Add Kingfisher:
- Click "+" again
- In the search field, enter: `https://github.com/onevcat/Kingfisher.git`
- Select the version rule (7.10.0 - Next Major)
- Click "Add Package"
- Select "Assignment10" target and click "Add Package"

### Method 2: Using Command Line (Alternative)
Run these commands from the terminal:
```bash
cd /Users/beasty/Documents/IOSdevKBTU/Assignment10
```

## New Files Added

1. **HeroStorageManager.swift** - Handles UserDefaults persistence
   - Saves last selected hero
   - Retrieves saved hero on app launch
   - Clear saved data

2. **NetworkManager.swift** - Handles all network requests using Alamofire
   - Fetches all heroes
   - Provides random hero selection
   - Error handling

3. **Updated ViewController.swift** - Enhanced with:
   - Kingfisher for image loading
   - Alamofire for networking (via NetworkManager)
   - UserDefaults integration
   - Loading indicator
   - Smooth animations
   - Comprehensive error handling

## Features Implemented

### ✅ Requirement 1: Networking
- ✅ Uses Alamofire for network requests
- ✅ Uses Kingfisher for image loading
- ✅ Fetches from SuperHero API
- ✅ Proper error handling

### ✅ Requirement 2: Random Superhero
- ✅ "Randomize" button (nextButton) fetches random hero
- ✅ Selects from full list of superheroes

### ✅ Requirement 3: Display 10+ Attributes
1. Name
2. Full Name
3. Alignment
4. Place of Birth
5. Gender
6. Race
7. Height
8. Weight
9. Publisher
10. Intelligence (Progress View)
11. Strength (Progress View)
12. Speed (Progress View)
13. Durability (Progress View)
14. Power (Progress View)
15. Combat (Progress View)
16. Image

### ✅ Requirement 4: UserDefaults Persistence
- ✅ Saves last selected hero to UserDefaults
- ✅ Loads saved hero on app launch
- ✅ Safe and well-structured code

### ✅ Requirement 5: User Interface
- ✅ Clean UI using UIKit
- ✅ Auto Layout compatible
- ✅ Hero image with rounded corners
- ✅ Stats with progress views
- ✅ Styled button

### ✅ Requirement 6: Code Quality
- ✅ Clean, maintainable code
- ✅ Separated concerns (NetworkManager, HeroStorageManager)
- ✅ Proper model structures
- ✅ Comments and documentation

### ✅ Requirement 7: Error Handling
- ✅ Network error handling
- ✅ JSON decode error handling
- ✅ Image loading error handling
- ✅ User feedback via alerts

### ✅ Requirement 8: Bonus Features
- ✅ Fade animations when switching heroes
- ✅ Loading indicator while fetching
- ✅ Progress bar animations
- ✅ Image fade-in transition
- ✅ Smooth UI transitions

## Testing the App

1. **First Launch**: 
   - App should fetch a random hero from API
   - Display all hero information
   - Save hero to UserDefaults

2. **Subsequent Launches**:
   - App should load the last viewed hero immediately
   - No need to wait for network request

3. **Randomize Button**:
   - Tap to get a new random hero
   - Smooth animation during transition
   - New hero is saved to UserDefaults

4. **Network Error**:
   - Disconnect internet
   - Tap randomize
   - Should show error alert with retry option

## Project Structure

```
Assignment10/
├── AppDelegate.swift
├── SceneDelegate.swift
├── ViewController.swift          (Main UI controller - UPDATED)
├── Hero.swift                     (Data models - UPDATED)
├── NetworkManager.swift           (NEW - Alamofire networking)
├── HeroStorageManager.swift       (NEW - UserDefaults persistence)
├── Main.storyboard
└── Assets.xcassets
```

## Next Steps

1. Open the project in Xcode
2. Add Alamofire and Kingfisher packages (see instructions above)
3. Build and run the project
4. Test all features
5. Record a video demonstration showing:
   - Random hero fetching
   - Hero details display
   - App relaunch with saved hero
   - Error handling (optional)

## Notes

- All network requests run on background threads
- UI updates happen on main thread
- Images are cached by Kingfisher for performance
- UserDefaults provides instant app launch experience
- Proper memory management with [weak self]

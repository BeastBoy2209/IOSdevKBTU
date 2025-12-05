# Video Demonstration Script for Assignment 11

## Introduction (10 seconds)
"Hello! This is my Assignment 11 - Superhero Randomizer App. Let me demonstrate all the features."

## Part 1: Show App After Clean Install (30 seconds)
1. **First Launch**
   - "First, I'll launch the app for the first time"
   - "Notice the loading indicator appears"
   - "The app fetches a random superhero from the API"
   - "Here we can see all the hero information displayed"

## Part 2: Display 10+ Attributes (45 seconds)
Point to each element on screen:
1. "At the top, we have the superhero's **image** loaded using Kingfisher"
2. "Below that is the **name** of the hero"
3. "We can see the **full name**"
4. "The hero's **alignment** (good, bad, or neutral)"
5. "**Place of birth**"
6. "**Gender**"
7. "**Race**"
8. "**Height** and **Weight**"
9. "**Publisher** (Marvel, DC, etc.)"
10. "And six power statistics with progress bars:"
    - Intelligence
    - Strength
    - Speed
    - Durability
    - Power
    - Combat

## Part 3: Random Hero Feature (30 seconds)
1. "Now let me tap the 'Next' or 'Randomize' button"
2. "Notice the smooth fade animation"
3. "The loading indicator appears briefly"
4. "A new random superhero is loaded"
5. "All information updates smoothly"
6. "The progress bars animate to show the new stats"
7. Tap button 2-3 more times to show randomness

## Part 4: UserDefaults Persistence (60 seconds)
1. "Now for the most important feature - UserDefaults persistence"
2. "Let me show the current hero: [say the name]"
3. "I'll now close the app completely"
4. **Close app** (swipe up from bottom or double-click home)
5. "The app is now completely closed"
6. "Let me reopen it"
7. **Reopen app**
8. "Notice immediately the same hero appears: [say the name]"
9. "No loading indicator, no network request needed"
10. "This proves the app saved and restored the last hero using UserDefaults"

## Part 5: Libraries Used (20 seconds)
1. "This app uses two important Swift packages:"
2. "**Alamofire** for making network requests efficiently"
3. "**Kingfisher** for loading and caching images"
4. (Optional: Show Xcode Package Dependencies tab)

## Part 6: Error Handling (30 seconds - Optional)
1. "Let me show error handling"
2. Turn on Airplane Mode
3. Tap Randomize button
4. "Notice the error alert appears"
5. "With options to retry or cancel"
6. Turn off Airplane Mode
7. Tap Retry
8. "And it works again"

## Part 7: Code Quality (20 seconds - Optional)
Quick scroll through code in Xcode:
1. "The code is well organized"
2. "Separate NetworkManager for API calls"
3. "HeroStorageManager for UserDefaults"
4. "Clean ViewController with proper separation of concerns"
5. "All with error handling and animations"

## Conclusion (10 seconds)
"That's my Assignment 11 submission. Thank you!"

---

## Total Time: ~3-4 minutes

## Tips for Recording:
- Use QuickTime Player or iPhone screen recording
- Show your face (optional)
- Speak clearly
- Keep device/simulator in portrait mode
- Ensure good lighting if showing Xcode
- Edit out any mistakes or dead time

## Checklist Before Recording:
- [ ] App builds successfully
- [ ] Alamofire package installed
- [ ] Kingfisher package installed
- [ ] Test the app once before recording
- [ ] Delete UserDefaults data to start fresh (optional)
- [ ] Charge your device/Mac
- [ ] Close unnecessary apps
- [ ] Prepare script/notes nearby

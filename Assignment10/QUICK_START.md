# Quick Package Installation Guide

## ⚡ Fast Setup (3 minutes)

### Step 1: Open Project (✓ Already Done)
```bash
open Assignment10.xcodeproj
```

### Step 2: Add Packages in Xcode

1. **In Xcode, look at the left sidebar (Project Navigator)**
2. **Click on "Assignment10" (the blue project icon at the top)**
3. **Click on "Assignment10" under TARGETS**
4. **Click on the "General" tab, then scroll down to find "Frameworks, Libraries, and Embedded Content"**
5. **OR click on "Package Dependencies" if you see that tab**

### Method A: Using Package Dependencies Tab (Recommended)

1. **Select the PROJECT "Assignment10" (not target)**
2. **Click "Package Dependencies" tab**
3. **Click the "+" button at the bottom**

#### For Alamofire:
```
Repository URL: https://github.com/Alamofire/Alamofire.git
Dependency Rule: Up to Next Major Version
Version: 5.9.0
```
Click "Add Package" → Select "Alamofire" → Click "Add Package"

#### For Kingfisher:
4. **Click "+" button again**
```
Repository URL: https://github.com/onevcat/Kingfisher.git
Dependency Rule: Up to Next Major Version
Version: 7.10.0
```
Click "Add Package" → Select "Kingfisher" → Click "Add Package"

### Method B: Using File Menu (Alternative)

1. **File → Add Package Dependencies...**
2. **In the search bar, paste:**
   - `https://github.com/Alamofire/Alamofire.git`
3. **Click "Add Package"**
4. **Repeat for Kingfisher:**
   - `https://github.com/onevcat/Kingfisher.git`

### Step 3: Verify Installation

After adding both packages:
1. **Look at the Project Navigator (left sidebar)**
2. **You should see a "Package Dependencies" section with:**
   - Alamofire
   - Kingfisher

### Step 4: Build the Project

1. **Select a simulator** (e.g., iPhone 15 Pro)
2. **Press ⌘B** (or Product → Build)
3. **Wait for build to complete** (may take 1-2 minutes first time)
4. **If successful, press ⌘R** to run

### Step 5: Test the App

1. **App launches → Shows loading indicator**
2. **Random hero appears**
3. **Tap "Next" button → New random hero**
4. **Close app (⌘Q or swipe up)**
5. **Reopen → Same hero appears instantly** ✓ UserDefaults working!

## 🔧 Troubleshooting

### If packages don't resolve:
1. **File → Packages → Reset Package Caches**
2. **File → Packages → Update to Latest Package Versions**
3. **Clean Build Folder** (⌘⇧K)
4. **Build again** (⌘B)

### If build errors appear:
1. **Make sure packages are added to the TARGET, not just the project**
2. **Check that import statements work:**
   - `import Alamofire` in NetworkManager.swift
   - `import Kingfisher` in ViewController.swift
3. **Restart Xcode if needed**

### If "Cannot find package" error:
1. **Check internet connection**
2. **Go to Xcode → Settings → Accounts → Your Account**
3. **Make sure you're signed in**
4. **Try Method B instead**

## ✅ Verification Checklist

After setup, verify:
- [ ] Alamofire package appears in Project Navigator
- [ ] Kingfisher package appears in Project Navigator
- [ ] Project builds without errors (⌘B)
- [ ] App runs in simulator (⌘R)
- [ ] First hero loads from API
- [ ] Images appear correctly
- [ ] Tap "Next" button works
- [ ] Close and reopen app shows same hero

## 🎯 What Each Package Does

### Alamofire
- **File**: NetworkManager.swift
- **Usage**: `AF.request(apiURL, method: .get)`
- **Purpose**: Makes HTTP requests to fetch hero data
- **Alternative**: URLSession (but Alamofire is better)

### Kingfisher
- **File**: ViewController.swift
- **Usage**: `imagePrev.kf.setImage(with: url)`
- **Purpose**: Downloads and caches hero images
- **Features**: Automatic caching, placeholder support, animations

## 📸 Expected Result

When everything is working:
- Loading indicator appears
- Hero image fades in smoothly
- All 16 attributes display
- Progress bars show correct values
- Tap Next → smooth transition to new hero
- Close app → reopen → same hero instantly appears

## 🚀 You're Ready!

Once packages are installed and the app runs, you can:
1. Test all features
2. Record your video demonstration
3. Submit your assignment

Need help? Check SETUP_GUIDE.md for more details!

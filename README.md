# NouraSDK iOS

NouraSDK is a Swift framework for building interactive AI-powered experiences in iOS applications.

**Current Version: 0.3.2**

## 🚨 Important Dependency Requirements

NouraSDK requires the following dependencies to be added manually to your project:
- **Lottie 4.5.2** - For animations
- **LiveKit 2.6.1** - For voice features

See installation instructions below for setup details.

## Overview

NouraSDK provides a pre-built chat interface and AI capabilities that can be easily integrated into any iOS application.

## Prerequisites

- Xcode 16.0 or later
- iOS 16.0+ deployment target
- Swift 5.7 or later
- Swift Package Manager

## Installation

### Using Swift Package Manager

1. In Xcode, select File > Add Package Dependencies...
2. Add the NouraSDK package: `https://github.com/sarj-ai/noura-sdk-ios.git`
3. Add the required dependencies:
   - Lottie: `https://github.com/airbnb/lottie-ios` (version 4.5.2)
   - LiveKit: `https://github.com/livekit/client-sdk-swift.git` (version 2.6.1)
4. Follow the prompts to select the versions and targets

**Important**: You must add both Lottie and LiveKit dependencies for the SDK to work properly.

### Package.swift Integration

If using Package.swift, add all three dependencies:

```swift
dependencies: [
    .package(url: "https://github.com/sarj-ai/noura-sdk-ios.git", from: "0.3.0"),
    .package(url: "https://github.com/airbnb/lottie-ios", exact: "4.5.2"),
    .package(url: "https://github.com/livekit/client-sdk-swift.git", exact: "2.6.1")
]
```

### Required Permissions

Add the following permissions to your app's Info.plist for voice features:

```xml
<key>NSMicrophoneUsageDescription</key>
<string>This app needs microphone access for voice conversations with Noura AI.</string>
```

## SDK Integration

### 1. Configure the SDK

Initialize the SDK in your app's startup code:

```swift
import NouraSDK

// Create a callback handler to receive events and errors
class AppNouraCallbackHandler: NouraSDKCallback {
    func onError(_ error: NouraSDKError) {
        print("NouraSDK Error: \(error.localizedDescription)")
        // Handle SDK errors in your app
    }
    
    func onEvent(_ event: NouraSDKEvent) {
        print("NouraSDK Event: \(event.eventName)")
        // Log events to your analytics system
    }
}

// Configure the SDK with your API key, token, and callback handler
NouraSDKManager.shared.configure(
    baseUrl: "https://noura-oyhlodgmcq-wx.a.run.app/",
    language: .english, // .arabic
    theme: .system, // .light, .dark, or .system
    sessionType: .chat, // .onboarding or .chat
    vbBaseUrl: "vb_base_url",
    apiKey: "YOUR_API_KEY",
    deviceId: "device_id",
    publicKey: "your_public_key", // See authentication requirements below
    userId: "user_id", // See authentication requirements below
    token: "user_auth_token", // See authentication requirements below
    callback: AppNouraCallbackHandler()
)
```

### Authentication Requirements

Authentication requirements depend on the session type:

**For `.onboarding` session type:**
- If user has `token`: Pass the `token`, `publicKey` is optional
- If user doesn't have `token`: `publicKey` is required

**For `.chat` session type:**
- `userId` and `token` are required
- `publicKey` is optional

### Session Types

The SDK supports two session types:

- **`.onboarding`** - For user registration and account setup. Transfer functionality is hidden.
- **`.chat`** - Full featured chat with all banking operations including transfers (default).

**Important**: If you initially configure with `.onboarding` and the user completes registration, update to `.chat` to enable full functionality:

```swift
// After user login/registration is complete
NouraSDKManager.shared.setSessionType(.chat)
```

### Dynamic User Authentication

Update user credentials as needed:

```swift
// Set user ID and token when user logs in
NouraSDKManager.shared.setuserId("user_123")
NouraSDKManager.shared.setToken("user_auth_token")

// Clear credentials when user logs out
NouraSDKManager.shared.setuserId(nil)
NouraSDKManager.shared.setToken(nil)
```

### Dynamic Settings

Language and theme can be changed at runtime without reconfiguring:

```swift
// Change language dynamically
NouraSDKManager.shared.setLanguage(.arabic)

// Change theme dynamically
NouraSDKManager.shared.setTheme(.dark)
```

### 2. Present the Chat Interface

Use the provided `NouraSDKChatView` in your SwiftUI navigation:

```swift
import SwiftUI
import NouraSDK
import Lottie
import LiveKit

// Present the chat view in a navigation context
.navigationDestination(isPresented: $showChatbot) {
    NouraSDKChatView()
        .navigationTitle("Noura AI Chat")
        .navigationBarTitleDisplayMode(.inline)
}
```

## Theme Support

The SDK supports three theme modes:

- **`.light`** - Always uses light theme
- **`.dark`** - Always uses dark theme  
- **`.system`** - Automatically follows device appearance settings (default)

When using `.system` theme, the SDK automatically responds to device appearance changes without requiring app restart.

## Custom Fonts

The SDK includes VisionBank (VB) custom fonts with the following weights:
- Regular, Medium, SemiBold, Bold
- Available in both regular and italic variants

## Features

- 🤖 **AI Chat Interface** - Pre-built chat UI with Noura AI
- 🗣️ **Voice Conversations** - Real-time voice chat with AI (requires LiveKit)
- 🎨 **Lottie Animations** - Enhanced UI with smooth animations (requires Lottie)
- 🌍 **Multi-language Support** - English and Arabic with RTL support
- 🎭 **Theme Support** - Light, dark, and system themes
- 🔒 **Secure Authentication** - Token-based user authentication
- 📱 **iOS 16.0+** - Modern iOS compatibility

## Usage Notes

- The `NouraSDKChatView` provides a pre-built chat interface that ensures a consistent user experience
- **Voice features require microphone permission** in your app's Info.plist
- **Manual dependency setup required** - Lottie and LiveKit must be added separately
- The SDK supports both English and Arabic localization with dynamic language switching
- Automatic theme switching based on device appearance settings
- Custom VB font integration throughout the interface
- Session types control available functionality (onboarding vs full chat)
- Authentication requirements vary by session type (see Authentication Requirements above)
- Language and theme can be changed dynamically without reconfiguration
- The SDK requires a valid API key for authentication
- Minimum deployment target is iOS 16.0

## Troubleshooting

### Build Errors
If you encounter build errors:
1. ✅ Ensure you've added both Lottie (4.5.2) and LiveKit (2.6.1) dependencies
2. 🧹 Clean build folder (⌘+Shift+K) and rebuild
3. 📱 Test on physical device for voice features

### Voice Features Not Working
1. ✅ Verify microphone permission in Info.plist
2. ✅ Confirm LiveKit dependency is properly added
3. 📱 Test on real device (voice requires hardware microphone)

---

© 2025 Sarj AI. All rights reserved.
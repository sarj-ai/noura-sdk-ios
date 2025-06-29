# NouraSDK iOS

NouraSDK is a Swift framework for building interactive AI-powered experiences in iOS applications.

**Current Version: 0.3.0**

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
2. Enter the package URL: `https://github.com/sarj-ai/noura-sdk-ios.git`
3. Follow the prompts to select the version and target

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

## Usage Notes

- The `NouraSDKChatView` provides a pre-built chat interface that ensures a consistent user experience
- The SDK supports both English and Arabic localization with dynamic language switching
- Automatic theme switching based on device appearance settings
- Custom VB font integration throughout the interface
- Lottie animations for enhanced user experience
- Session types control available functionality (onboarding vs full chat)
- Authentication requirements vary by session type (see Authentication Requirements above)
- Language and theme can be changed dynamically without reconfiguration
- The SDK requires a valid API key for authentication
- Minimum deployment target is iOS 16.0

---

© 2025 Sarj AI. All rights reserved.
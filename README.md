# NouraSDK iOS

NouraSDK is a Swift framework for building interactive AI-powered experiences in iOS applications.

**Current Version: 0.1.1**

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
    baseURL: URL(string: "https://sandbox.noura.ai"),
    apiKey: "YOUR_API_KEY",
    token: getUserAuthToken(), // Optional user authentication token
    callback: AppNouraCallbackHandler()
)
```

You can also update the user token later:

```swift
// Update token when user logs in
NouraSDKManager.shared.setToken(newUserToken)

// Clear token when user logs out
NouraSDKManager.shared.setToken(nil)
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

## Usage Notes

- The `NouraSDKChatView` provides a pre-built chat interface that ensures a consistent user experience
- The SDK supports both English and Arabic localization
- The SDK requires a valid API key for authentication
- Minimum deployment target is iOS 16.0

---

© 2025 Sarj AI. All rights reserved.
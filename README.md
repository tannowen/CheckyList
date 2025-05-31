# CheckyList*

A sleek and simple checklist app for iOS built with SwiftUI.

## Features

- Create multiple checklists
- Add, complete, and delete items
- Persistent storage using UserDefaults
- Modern iOS design with SF Symbols
- Support for both Light and Dark mode
- Clean, minimalist interface

## Requirements

- iOS 16.0+
- Xcode 14.0+
- Swift 5.7+

## Project Structure

```
CheckyList/
├── CheckyListApp.swift
├── Models/
│   ├── ChecklistItem.swift
│   ├── Checklist.swift
│   └── ChecklistStore.swift
├── Views/
│   ├── ChecklistsView.swift
│   └── ChecklistDetailView.swift
└── Theme.swift
```

## Setup

1. Clone the repository
2. Open the project in Xcode
3. Build and run on your device or simulator

## Design Decisions

- Uses SF Pro font throughout the app for consistent typography
- Implements a clean, modern UI with appropriate spacing and padding
- Uses SF Symbols for all icons
- Provides clear empty states with helpful messages
- Includes subtle animations for better user feedback

## License

This project is available under the MIT license. See the LICENSE file for more info. 
# CryptoPrice

A SwiftUI-based iOS application that displays cryptocurrency prices with support for USD and SEK currencies.

## Features

- Cryptocurrency price tracking
- Detailed view for each cryptocurrency
- Currency conversion between USD and SEK
- Pull-to-refresh functionality
- Error handling and retry mechanisms
- Localization support (English and Swedish)

## Architecture

The project follows Clean Architecture principles with MVVM + Coordinator pattern:

### Layers

- **Presentation**: SwiftUI views, ViewModels, and Coordinators
- **Domain**: Business logic and models
- **Data**: Repositories and network services
- **Core**: Common utilities and managers

### Key Components

- **MVVM**: Separation of UI and business logic
- **Coordinator Pattern**: Navigation management
- **Repository Pattern**: Data access abstraction
- **Dependency Injection**: Loose coupling and testability
- **Protocol-Oriented Programming**: Flexibility and modularity

## Installation

1. Clone the repository:
`git clone https://github.com/yourusername/CryptoPrice.git`.

2. Install dependencies:
run `make setup` to start developing locally.

3. Generate Xcode project:
run `xcodegen`.

4. Open `CryptoPrice.xcodeproj` and run the project
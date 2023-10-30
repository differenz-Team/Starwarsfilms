# Starwarfilms.iOS

## Overview
This repository contains **Starwarfilms** application for iOS with SwiftUI that shows design & coding practices 

The app does the following:
1. **Task Descriptions:** 
    - List out all the starwar films using SWAPI GraphQL API.
    - Users has a search functionality that allows users to search for films by title.
    - When a specific film is clicked, the application provides comprehensive details about the selected film, including  film's title, episode number, opening crawl, and list of characters.
     
4. **Dark/Light Mode:** 
    - App supports Light & Dark mode, user can change mode by going into device dark mode settings.

## Pre-requisites
- [Xcode 14.2](https://apps.apple.com/us/app/xcode/id497799835?mt=12) or above
- iOS device or emulator running iOS 14.2 or above

## Getting Started
1. [Install Xcode](https://developer.apple.com/xcode/)
2. Clone this sample repository
3. Open StarWarsFilmsPractical.xcodeproj file to run project

## Key Tools & Technologies
- **UI:** SwiftUI 5.0
- **API/Service calls:** Apollo GraphQL
- **IDE:** [Xcode](https://developer.apple.com/xcode/)
- **Framework:** MVVM

## Design Decisions
- Characters in film details listing only having the characters name because we haven't any profile image for the characters in API response.
- Search in the film list works locally because of there is no any APIs available for search. 


## Screenshots
<img src="https://github.com/differenz-Team/Starwarsfilms/blob/master/ScreenShots/HomeScreen.png" width="280">
<img src="https://github.com/differenz-Team/Starwarsfilms/blob/master/ScreenShots/HomeScreen-Dark.png" width="280"> 
<img src="https://github.com/differenz-Team/Starwarsfilms/blob/master/ScreenShots/FilmDetailScreen.png" width="280">
<img src="https://github.com/differenz-Team/Starwarsfilms/blob/master/ScreenShots/FilmDetailScreen-Dark.png" width="280">

Happy coding!

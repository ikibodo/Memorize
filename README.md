[Читать на русском](./README.ru.md)

# Memorize

A memory training game app: the user matches pairs of emoji cards.


Based on the materials of the course [Stanford CS193p: Developing Apps for iOS using SwiftUI (Spring 2023)](https://cs193p.stanford.edu/2023).

## Description

The app is a memory training game where the player matches pairs of emoji cards.
- Built entirely with SwiftUI following the MVVM architecture.
- State management is implemented via Combine (ObservableObject, @Published) to ensure reactive updates.
- Cards can be flipped, matched, or shuffled with smooth SwiftUI animations and Core Animation transitions.
- Each theme defines its own set of emojis, a color (stored in hex format), and the number of pairs.
- A full theme editor lets the user create, edit, delete, and reorder themes, with data persistence through Codable (JSON storage).
- Bonus mechanics include a bonus timer (bonus pie) with animated progress.

## Beyond the Course
- Full-featured theme editor (create, edit, delete, reorder) implemented using SwiftUI forms and List modifiers (onDelete, onMove).
- Dynamic pair selection with an “Use All Emojis” shortcut implemented via Stepper and Button components.
- Validation and restrictions: at least 2 emojis per theme (using Swift validation logic).
- Custom theme colors stored and restored via Codable and hex color encoding.
- Stable UUID identifiers for cards to fix emoji flickering issues in SwiftUI views.
- Smooth animations in edit mode achieved with transaction tuning in SwiftUI.
- Preloaded themes (Halloween, Cats, Animals, etc.) defined in static Swift structures.
- Custom app icon created specifically for the project.

## [Watch the video](https://youtu.be/fa7Pzy5Zq-Y)
<img width="200" height="400" alt="Image" src="https://github.com/user-attachments/assets/0b7b1fd2-5ed5-47ee-b4ae-d07bb36eabe1" />

<img width="200" height="440" alt="Image" src="https://github.com/user-attachments/assets/a668aa98-245d-4dfb-b729-99634e2f3c5f" />

<img width="200" height="403" alt="Image" src="https://github.com/user-attachments/assets/725db8bc-80b0-4fe9-a999-dd9b2310682a" />

## Acknowledgments

Special thanks to Stanford University and Professor Paul Hegarty for the open CS193p course.

## License

This project is licensed under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.en).

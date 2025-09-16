[Read in English](./README.md)

# Memorize 

Приложение-игра для тренировки памяти: пользователь ищет пары карточек с эмодзи. 

Основано на материалах курса [Stanford CS193p: Developing Apps for iOS using SwiftUI (Spring 2023)](https://cs193p.stanford.edu/2023).


## Описание
Приложение — игра для тренировки памяти, где пользователь ищет пары карточек с эмодзи
- Разработано на SwiftUI с архитектурой MVVM.
- Управление состоянием реализовано через Combine (ObservableObject, @Published), что обеспечивает реактивное обновление интерфейса.
- Карточки можно переворачивать, подбирать парами и перемешивать с плавными SwiftUI-анимациями и переходами на базе Core Animation.
- Каждая тема задаёт свой набор эмодзи, цвет (сохранённый в hex-формате) и количество пар.
- Встроенный редактор тем позволяет создавать, изменять, удалять и сортировать темы, с сохранением данных через Codable (JSON).
- Реализован бонус-таймер (bonus pie) с анимированным прогрессом.

## Сверх курса
- Полноценный редактор тем (создание, редактирование, удаление, сортировка), построенный на SwiftUI Form и List-модификаторах (onDelete, onMove).
- Динамический выбор числа пар с кнопкой «Все эмодзи», реализованный через Stepper и Button.
- Валидация: в теме должно быть минимум 2 эмодзи (логика на Swift).
- Кастомные цвета тем сохраняются и восстанавливаются с помощью Codable и hex-кодирования цветов.
- Стабильные UUID для карточек — решение проблемы мерцания эмодзи в SwiftUI-представлениях.
- Плавные анимации в режиме редактирования с помощью настройки transaction.
- Набор предустановленных тем (Halloween, Cats, Animals и др.), определённых через статические структуры.
- Уникальный дизайн иконки приложения.

## [Watch the video](https://youtu.be/fa7Pzy5Zq-Y)
<img width="200" height="400" alt="Image" src="https://github.com/user-attachments/assets/0b7b1fd2-5ed5-47ee-b4ae-d07bb36eabe1" />

<img width="200" height="440" alt="Image" src="https://github.com/user-attachments/assets/a668aa98-245d-4dfb-b729-99634e2f3c5f" />

<img width="200" height="403" alt="Image" src="https://github.com/user-attachments/assets/725db8bc-80b0-4fe9-a999-dd9b2310682a" />


## Благодарности

Stanford University и профессору Paul Hegarty за открытый курс CS193p.


 ## Лицензия

Проект распространяется под лицензией [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/deed.ru).

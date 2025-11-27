# Assignment 8 - Favorites Manager App 📱

Приложение для управления избранным в 4 категориях: Movies, Music, Books, и Courses.

---

## ✅ СТАТУС: КОД ПОЛНОСТЬЮ ИСПРАВЛЕН И ГОТОВ!

Все Swift файлы созданы, протестированы и компилируются без ошибок. Осталось только настроить Storyboard!

---

## 📂 Итоговая структура файлов

```
Assignment8/
├── Models.swift                          ✅ 4 модели данных
│
├── View Controllers (UITableViewController):
│   ├── MoviesViewController.swift        ✅ 10 фильмов
│   ├── MusicViewController.swift         ✅ 10 песен
│   ├── BooksViewController.swift         ✅ 10 книг
│   └── CoursesViewController.swift       ✅ 10 курсов
│
├── Custom Cells (UITableViewCell):
│   ├── MovieTableViewCell.swift          ✅ outlets: movieImageView, titleLabel
│   ├── MusicTableViewCell.swift          ✅ outlets: musicImageView, titleLabel
│   ├── BookTableViewCell.swift           ✅ outlets: bookImageView, titleLabel
│   └── CourseTableViewCell.swift         ✅ outlets: courseImageView, titleLabel
│
├── Detail VCs (UIViewController):
│   ├── MovieDetailViewController.swift   ✅ 4 outlets (image, title, desc, review)
│   ├── MusicDetailViewController.swift   ✅ 4 outlets
│   ├── BookDetailViewController.swift    ✅ 4 outlets
│   └── CourseDetailViewController.swift  ✅ 4 outlets
│
└── Storyboard:
    └── Main.storyboard                   ⏳ НУЖНО НАСТРОИТЬ!
```

---

## 🎉 Что исправлено (финальная версия)

### ✅ Все View Controllers теперь UITableViewController:
```swift
class MoviesViewController: UITableViewController   // ✅ Было UIViewController
class MusicViewController: UITableViewController    // ✅ Было UIViewController
class BooksViewController: UITableViewController    // ✅ Было UIViewController
class CoursesViewController: UITableViewController  // ✅ Было UIViewController
```

### ✅ Все TableViewCell файлы пересозданы правильно:
```swift
class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImageView: UIImageView!  // ✅
    @IBOutlet weak var titleLabel: UILabel!          // ✅
}
// И так же для Music, Books, Courses
```

### ✅ Все Detail View Controllers правильные:
```swift
class MovieDetailViewController: UIViewController {
    @IBOutlet weak var movieImageView: UIImageView!      // ✅
    @IBOutlet weak var titleLabel: UILabel!              // ✅
    @IBOutlet weak var descriptionTextView: UITextView!  // ✅
    @IBOutlet weak var reviewTextView: UITextView!       // ✅
}
// И так же для Music, Books, Courses
```

---

## 🚀 ЧТО ДЕЛАТЬ ДАЛЬШЕ (3 шага)

### 📖 **ШАГ 1: Прочитайте инструкции**

Выберите один из файлов (они все объясняют одно и то же, но по-разному):

1. **`FIXED_FINAL.md`** ← **РЕКОМЕНДУЕТСЯ!** Краткий обзор + чек-листы
2. **`OUTLETS_GUIDE.md`** ← Визуальная шпаргалка по подключениям
3. **`START_HERE.md`** ← Подробная пошаговая инструкция

### 🎨 **ШАГ 2: Настройте Storyboard**

Для КАЖДОЙ из 4 категорий (Movies, Music, Books, Courses):

#### A. Настроить ячейку:
```
1. Custom Class: MovieTableViewCell (или другой)
2. Identifier: MovieCell (или MusicCell/BookCell/CourseCell)
3. Добавить Image View + Label
4. Подключить 2 outlets
```

#### B. Настроить Detail VC:
```
1. Custom Class: MovieDetailViewController (или другой)
2. Создать layout: ScrollView → StackView → 6 элементов
3. Подключить 4 outlets
```

#### C. Создать Segue:
```
1. От Prototype Cell к Detail VC
2. Type: Show (push)
3. Identifier: showMovieDetail (или другой)
```

### ✅ **ШАГ 3: Запустите приложение**

```bash
Cmd + Shift + K  # Clean
Cmd + B          # Build
Cmd + R          # Run
```

---

## 📋 Важные Identifiers (должны ТОЧНО совпадать!)

### Cell Identifiers:
- `MovieCell`
- `MusicCell`
- `BookCell`
- `CourseCell`

### Segue Identifiers:
- `showMovieDetail`
- `showMusicDetail`
- `showBookDetail`
- `showCourseDetail`

### Outlet Names в ячейках:
- Movies: `movieImageView`, `titleLabel`
- Music: `musicImageView`, `titleLabel`
- Books: `bookImageView`, `titleLabel`
- Courses: `courseImageView`, `titleLabel`

### Outlet Names в Detail VCs:
Все одинаковые (но с правильным префиксом):
- `movieImageView` (или music/book/course)
- `titleLabel`
- `descriptionTextView`
- `reviewTextView`

---

## 📊 Данные в приложении

### 🎬 Movies (10):
The Shawshank Redemption, The Godfather, The Dark Knight, Pulp Fiction, Forrest Gump, Inception, The Matrix, Interstellar, Fight Club, Goodfellas

### 🎵 Music (10):
Bohemian Rhapsody, Hotel California, Imagine, Smells Like Teen Spirit, Billie Jean, Stairway to Heaven, Purple Rain, What's Going On, Like a Rolling Stone, Hey Jude

### 📚 Books (10):
1984, To Kill a Mockingbird, The Great Gatsby, Harry Potter, The Catcher in the Rye, Pride and Prejudice, The Lord of the Rings, The Hobbit, The Alchemist, Brave New World

### 🎓 Courses (10):
iOS Development with SwiftUI, Web Development Bootcamp, Machine Learning A-Z, Digital Marketing, Python Bootcamp, UI/UX Design, Data Science, AWS Solutions Architect, Blender Creator, Algorithmic Trading

---

## 🎯 Архитектура Storyboard

```
Tab Bar Controller (Initial)
├── Navigation Controller → MoviesViewController → MovieDetailViewController
├── Navigation Controller → MusicViewController → MusicDetailViewController
├── Navigation Controller → BooksViewController → BookDetailViewController
└── Navigation Controller → CoursesViewController → CourseDetailViewController
```

---

## 🐛 Решение проблем

### Пустая таблица:
→ Проверьте Cell Identifier (точно `MovieCell`, с большой буквы!)

### Краш "Could not cast...":
→ Проверьте Custom Class у ячейки (должен быть `MovieTableViewCell`)

### Outlets nil (краш):
→ Откройте Connections Inspector (Option+Cmd+6) и проверьте подключения

### Краш при нажатии на ячейку:
→ Проверьте Segue Identifier (должен быть точно `showMovieDetail`)

---

## 📚 Все файлы-инструкции

- **`FIXED_FINAL.md`** - Что исправлено + что делать дальше
- **`OUTLETS_GUIDE.md`** - Шпаргалка по подключению outlets
- **`START_HERE.md`** - Пошаговая инструкция для новичков
- **`PROBLEM_SOLVED.md`** - Объяснение проблемы и решения
- **`DETAILED_CONNECTION_GUIDE.md`** - Детальное руководство с примерами
- **`QUICK_REFERENCE.md`** - Таблица всех значений

---

## ✅ Проверка компиляции

Все файлы протестированы и компилируются без ошибок:
- ✅ Models.swift
- ✅ 4 View Controllers
- ✅ 4 TableViewCells
- ✅ 4 Detail View Controllers

---

## 🎓 Требования задания

- ✅ UITabBarController с 4 табами
- ✅ UINavigationController в каждом табе
- ✅ UITableViewController с данными (по 10 элементов)
- ✅ Custom UITableViewCell с изображением и текстом
- ✅ Detail View с полной информацией
- ✅ Модели данных (Movie, Music, Book, Course)
- ✅ Чистый, организованный код
- ⏳ Auto Layout (нужно настроить в Storyboard)

---

## 🚀 Быстрый старт

```bash
1. Откройте Xcode
2. Откройте Main.storyboard
3. Прочитайте FIXED_FINAL.md
4. Настройте Storyboard по инструкции
5. Cmd + R для запуска
```

---

**КОД ГОТОВ! Осталось только подключить Storyboard! 🎉**

Если возникнут вопросы - все ответы в файлах-инструкциях!

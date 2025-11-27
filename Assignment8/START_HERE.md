# 🎯 БЫСТРАЯ ИНСТРУКЦИЯ: Что делать дальше

## ✅ Что уже сделано (код исправлен!)

- ✅ Все View Controllers изменены на `UITableViewController`
- ✅ Storyboard исправлен: классы на правильных контроллерах
- ✅ Navigation Controllers без лишних классов
- ✅ Код компилируется без ошибок

---

## 📋 ЧТО ВАМ ОСТАЛОСЬ: 3 ПРОСТЫХ ШАГА

### ШАГ 1️⃣: Настроить ЯЧЕЙКИ (5 мин на каждую категорию)

#### Для Movies (повторить для Music, Books, Courses):

**1.1. Откройте Main.storyboard**

**1.2. Найдите "Movies" Table View Controller**
   - В Document Outline слева найдите scene с классом `MoviesViewController`

**1.3. Настройте Prototype Cell:**
   ```
   Выберите Table View внутри контроллера
   → Attributes Inspector (справа)
   → Prototype Cells: 1 (вместо 0)
   ```

**1.4. Выберите появившуюся ЯЧЕЙКУ (Table View Cell)**
   ```
   Identity Inspector:
     ✏️ Class: MovieTableViewCell
     ✏️ Module: Assignment8
   
   Attributes Inspector:
     ✏️ Identifier: MovieCell  ⚠️ ВАЖНО! Точно так!
     ✏️ Style: Custom
     ✏️ Row Height: 90
   ```

**1.5. Добавьте элементы В ЯЧЕЙКУ:**

a) **Image View:**
   - Перетащите Image View из Library (+) в ячейку
   - Выберите Image View → Add Constraints (кнопка внизу):
     ```
     Leading: 16 (к ячейке)
     Width: 60
     Height: 60
     Center Vertically: 0 (к ячейке)
     ```
   - Attributes Inspector:
     ```
     Content Mode: Aspect Fill
     ✓ Clip To Bounds
     ```

b) **Label:**
   - Перетащите Label из Library в ячейку (справа от Image)
   - Выберите Label → Add Constraints:
     ```
     Leading: 16 (к Image View!)
     Trailing: -16 (к ячейке)
     Center Vertically: 0 (к ячейке)
     ```
   - Attributes Inspector:
     ```
     Font: System Semibold 17
     Lines: 2
     ```

**1.6. ПОДКЛЮЧИТЕ outlets ячейки:**
   ```
   1. Выберите ЯЧЕЙКУ (Table View Cell), не Image/Label!
   2. Assistant Editor: Option + Cmd + Return
   3. Справа должен быть MovieTableViewCell.swift
   4. Control + Drag от Image View к строке:
      @IBOutlet weak var movieImageView: UIImageView!
   5. Control + Drag от Label к строке:
      @IBOutlet weak var titleLabel: UILabel!
   ```

**1.7. Повторите для Music, Books, Courses:**
   - Music: `MusicTableViewCell`, `MusicCell`, outlets: `musicImageView`, `titleLabel`
   - Books: `BookTableViewCell`, `BookCell`, outlets: `bookImageView`, `titleLabel`
   - Courses: `CourseTableViewCell`, `CourseCell`, outlets: `courseImageView`, `titleLabel`

---

### ШАГ 2️⃣: Создать DETAIL VIEW CONTROLLERS (10 мин на каждый)

#### Для каждой категории (Movies, Music, Books, Courses):

**2.1. Добавьте View Controller из Library**
   - Перетащите обычный View Controller на canvas

**2.2. Установите класс:**
   ```
   Identity Inspector:
     ✏️ Class: MovieDetailViewController (или Music/Book/Course)
     ✏️ Module: Assignment8
   ```

**2.3. Добавьте Scroll View:**
   ```
   Перетащите Scroll View на весь экран
   Constraints: 0-0-0-0 (к Safe Area)
   ```

**2.4. Добавьте Stack View ВНУТРЬ Scroll View:**
   ```
   Перетащите Stack View внутрь Scroll View
   
   Attributes Inspector:
     Axis: Vertical
     Alignment: Fill
     Distribution: Fill
     Spacing: 16
   
   Constraints:
     Leading: 16, Trailing: -16 (к Scroll View)
     Top: 20, Bottom: -20 (к Scroll View)
     
   ⚠️ ВАЖНО! Добавьте constraint Width:
     Control+Drag от Stack View к Scroll View
     → Equal Widths
     → Edit: Constant = -32
   ```

**2.5. Добавьте элементы ВНУТРЬ Stack View (по порядку сверху вниз):**

a) **Image View:**
   ```
   Height: 250
   Content Mode: Aspect Fill
   Clip To Bounds: ✓
   ```

b) **Title Label:**
   ```
   Font: System Bold 28
   Lines: 0
   Text: "Title"
   ```

c) **"Description" Label:**
   ```
   Font: System Semibold 20
   Text: "Description"
   ```

d) **Description Text View:**
   ```
   Scrolling Enabled: NO
   Editable: NO
   Font: System 16
   Background: Clear Color
   ```

e) **"My Review" Label:**
   ```
   Font: System Semibold 20
   Text: "My Review"
   ```

f) **Review Text View:**
   ```
   Scrolling Enabled: NO
   Editable: NO
   Font: System 15
   Background: Clear Color
   Text Color: Secondary Label
   ```

**2.6. ПОДКЛЮЧИТЕ outlets:**
   ```
   1. Выберите Detail View Controller
   2. Assistant Editor → MovieDetailViewController.swift
   3. Control + Drag от элементов к outlets:
      - Image View → movieImageView
      - Title Label → titleLabel
      - Description TextView → descriptionTextView
      - Review TextView → reviewTextView
   ```

---

### ШАГ 3️⃣: Создать SEGUES (1 мин на каждый)

#### Для каждой категории:

**3.1. Создайте Segue:**
   ```
   Control + Drag от PROTOTYPE CELL (в Table View) 
   к соответствующему Detail View Controller
   → Выберите "Show"
   ```

**3.2. Настройте Segue:**
   ```
   Выберите segue (линия между контроллерами)
   
   Attributes Inspector:
     ✏️ Identifier: showMovieDetail
                   (или showMusicDetail, showBookDetail, showCourseDetail)
   ```

**⚠️ ВАЖНО:** Identifier должен ТОЧНО совпадать с кодом!

---

## 🎨 Добавить изображения (опционально)

Если хотите видеть картинки (не обязательно):

```
1. Откройте Assets.xcassets
2. Правый клик → New Image Set
3. Назовите: movie1, movie2, ..., movie10
4. Повторите для music1-10, book1-10, course1-10
5. Перетащите картинки или оставьте пустыми
```

Без картинок приложение работает, просто будут пустые места.

---

## ✅ ПРОВЕРКА: Чек-лист перед запуском

### Для каждой категории (Movies, Music, Books, Courses):

#### Ячейки:
- [ ] Prototype Cells = 1
- [ ] Cell Class установлен (MovieTableViewCell, etc.)
- [ ] Cell Identifier установлен (MovieCell, etc.)
- [ ] Image View и Label добавлены в ячейку
- [ ] Constraints для Image и Label настроены
- [ ] Outlets подключены (2 на ячейку: imageView + label)

#### Detail View:
- [ ] View Controller добавлен
- [ ] Class установлен (MovieDetailViewController, etc.)
- [ ] Scroll View + Stack View настроены
- [ ] 6 элементов добавлены в Stack View
- [ ] Outlets подключены (4 на Detail VC)

#### Segue:
- [ ] Segue создан от Cell к Detail VC
- [ ] Segue Type = Show (push)
- [ ] Segue Identifier установлен (showMovieDetail, etc.)

---

## 🚀 ЗАПУСК

```
1. Cmd + Shift + K  (Clean)
2. Cmd + B          (Build)
3. Исправьте ошибки если есть
4. Cmd + R          (Run)
```

---

## 🎉 Что должно работать

- ✅ Приложение запускается
- ✅ Видно 4 вкладки внизу (Movies, Music, Books, Courses)
- ✅ В каждой вкладке список из 10 элементов
- ✅ Нажатие на элемент открывает детальную страницу
- ✅ На детальной странице: картинка, название, описание, отзыв
- ✅ Кнопка "< Back" работает

---

## 🐛 Если крашится или пусто

### Если пустая таблица:
   ```
   → Проверьте Cell Identifier
   → Должен быть точно: MovieCell (с большой M и C)
   ```

### Если краш при нажатии:
   ```
   → Проверьте Segue Identifier
   → Должен быть точно: showMovieDetail
   ```

### Если "Could not cast...":
   ```
   → Проверьте Custom Class у ячейки
   → Должен быть: MovieTableViewCell
   ```

### Если outlets nil:
   ```
   → Откройте Connections Inspector (Option+Cmd+6)
   → Проверьте что все outlets заполнены (●)
   → Переподключите пустые (○)
   ```

---

## 💡 Советы

1. **Делайте по одной категории за раз:**
   - Сначала Movies полностью (ячейка + detail + segue)
   - Протестируйте (Cmd+R)
   - Потом Music, Books, Courses

2. **Копируйте Detail View Controllers:**
   - После настройки одного Detail VC
   - Cmd+C, Cmd+V для копирования
   - Измените только Class в Identity Inspector
   - Переподключите outlets

3. **Используйте Document Outline:**
   - Левая панель в Storyboard
   - Легче выбирать нужные элементы

4. **Сохраняйте часто:**
   - Cmd+S после каждого подключения

---

## 📚 Файлы для справки

- `PROBLEM_SOLVED.md` — что было исправлено
- `DETAILED_CONNECTION_GUIDE.md` — подробное объяснение каждого шага
- `QUICK_REFERENCE.md` — таблица всех значений

---

**Удачи! Теперь у вас всё получится! 🚀**

Вопросы? Смотрите PROBLEM_SOLVED.md для объяснения что было не так.

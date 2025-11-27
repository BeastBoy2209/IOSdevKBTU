# 📱 Подробная инструкция по подключению Storyboard к коду

## 🎯 Обзор структуры

Вы создали все необходимые файлы кода. Теперь нужно **правильно настроить Storyboard** и **подключить все элементы**. 

---

## 📋 ШАГ 1: Создание базовой структуры в Storyboard

### 1.1. Удалите старый View Controller
- Откройте `Main.storyboard`
- Выберите единственный View Controller (который там сейчас есть)
- Нажмите Delete

### 1.2. Добавьте Tab Bar Controller
1. Откройте **Library** (кнопка + в правом верхнем углу или Cmd+Shift+L)
2. Найдите **Tab Bar Controller**
3. Перетащите его на canvas
4. Выберите Tab Bar Controller
5. В **Attributes Inspector** (правая панель) поставьте галочку **"Is Initial View Controller"**
   - Должна появиться стрелка слева от контроллера

### 1.3. Удалите стандартные View Controllers
- Tab Bar Controller создается с 2 стандартными view controllers
- Выберите их и удалите (не сам Tab Bar Controller, только 2 дочерних!)

---

## 📋 ШАГ 2: Создание Navigation Controllers для каждого таба

Повторите эти действия **4 раза** (для Movies, Music, Books, Courses):

### 2.1. Добавьте Navigation Controller
1. Из Library перетащите **Navigation Controller**
2. Он автоматически создается с Root View Controller
3. Повторите еще 3 раза (всего 4 Navigation Controllers)

### 2.2. Подключите Navigation Controllers к Tab Bar
Для каждого из 4 Navigation Controllers:
1. **Control + Drag** от **Tab Bar Controller** к **Navigation Controller**
2. В появившемся меню выберите:
   - **Relationship Segue** → **view controllers**
3. Повторите для всех 4 Navigation Controllers

Теперь у вас должно быть 4 таба внизу Tab Bar Controller!

---

## 📋 ШАГ 3: Настройка первого таба (Movies)

### 3.1. Установите класс для MoviesViewController
1. Выберите **первый Root View Controller** (который идет с Navigation Controller)
2. В **Identity Inspector** (правая панель, вкладка с значком удостоверения)
3. В поле **Class** введите: `MoviesViewController`
4. В поле **Module** выберите: `Assignment8`

### 3.2. Настройте Navigation Item
1. Выберите этот же View Controller
2. В **Document Outline** (левая панель) найдите **Navigation Item**
3. В **Attributes Inspector** установите **Title**: `Movies`

### 3.3. Настройте Tab Bar Item
1. В **Document Outline** найдите **Tab Bar Item** (под View Controller)
2. В **Attributes Inspector** установите:
   - **Title**: `Movies`
   - **Image**: Выберите SF Symbol `film` или `popcorn`
     - Для SF Symbol: в поле Image введите `film` (без расширения)

### 3.4. Добавьте Table View
1. Из Library перетащите **Table View** на этот View Controller
2. Растяните его на весь экран
3. **Добавьте Auto Layout constraints**:
   - Выберите Table View
   - Нажмите кнопку **Add New Constraints** (внизу справа)
   - Установите: Top: 0, Leading: 0, Trailing: 0, Bottom: 0
   - Снимите галочку "Constrain to margins"
   - Нажмите **Add 4 Constraints**

### 3.5. Подключите Table View к коду (IBOutlet)
1. Откройте **Assistant Editor**: 
   - Option + Cmd + Return (или кнопка с двумя кружочками вверху справа)
2. Убедитесь, что справа открыт файл `MoviesViewController.swift`
3. **Control + Drag** от **Table View** к строке с `@IBOutlet weak var tableView`
4. Отпустите - должно появиться меню подключения
5. Выберите **tableView** outlet

### 3.6. Настройте Prototype Cell
1. Выберите Table View
2. В **Attributes Inspector** установите **Prototype Cells**: `1`
3. Выберите появившуюся ячейку (Table View Cell)
4. В **Identity Inspector** установите:
   - **Class**: `MovieTableViewCell`
   - **Module**: `Assignment8`
5. В **Attributes Inspector** установите:
   - **Identifier**: `MovieCell` (очень важно!)
   - **Style**: Custom
   - **Row Height**: 90

### 3.7. Дизайн Custom Cell
Внутри Prototype Cell добавьте элементы:

#### Добавьте UIImageView:
1. Перетащите **Image View** из Library
2. Расположите слева в ячейке
3. Добавьте constraints:
   - Leading: 16
   - CenterY: 0 (к центру ячейки)
   - Width: 60
   - Height: 60
4. В **Attributes Inspector**:
   - Content Mode: Aspect Fill
   - Поставьте галочку **Clip to Bounds**

#### Добавьте UILabel:
1. Перетащите **Label** из Library
2. Расположите справа от ImageView
3. Добавьте constraints:
   - Leading: 16 (от ImageView)
   - Trailing: -16 (от края ячейки)
   - CenterY: 0 (к центру ячейки)
4. В **Attributes Inspector**:
   - Font: System 17, Semibold
   - Lines: 2
   - Text: "Movie Title"

### 3.8. Подключите элементы Cell к коду
1. Выберите **Table View Cell** (саму ячейку)
2. Откройте Assistant Editor
3. Убедитесь, что справа открыт `MovieTableViewCell.swift`
4. **Control + Drag** от **Image View** к `@IBOutlet weak var movieImageView`
5. **Control + Drag** от **Label** к `@IBOutlet weak var titleLabel`

---

## 📋 ШАГ 4: Создание Detail View Controller для Movies

### 4.1. Добавьте View Controller для Detail
1. Перетащите обычный **View Controller** из Library
2. Расположите справа от Movies View Controller

### 4.2. Установите класс
1. Выберите этот View Controller
2. В **Identity Inspector**:
   - **Class**: `MovieDetailViewController`
   - **Module**: `Assignment8`

### 4.3. Создайте Segue от Cell к Detail
1. **Control + Drag** от **Prototype Cell** (в Movies Table View) к **Detail View Controller**
2. Выберите **Show** (это push segue)
3. Выберите созданный segue (линию между контроллерами)
4. В **Attributes Inspector** установите:
   - **Identifier**: `showMovieDetail` (очень важно!)

### 4.4. Дизайн Detail View
Добавьте элементы в следующем порядке:

#### 4.4.1. Добавьте Scroll View:
1. Перетащите **Scroll View** на Detail View Controller
2. Constraints: 0-0-0-0 к Safe Area

#### 4.4.2. Добавьте Stack View внутри Scroll View:
1. Перетащите **Stack View** внутрь Scroll View
2. В **Attributes Inspector**:
   - Axis: Vertical
   - Alignment: Fill
   - Distribution: Fill
   - Spacing: 16
3. Constraints:
   - Leading: 16, Trailing: -16
   - Top: 20, Bottom: -20
   - **Width**: Equal Width to Scroll View, constant: -32
     (Control+Drag от Stack View к Scroll View, выберите Equal Widths, потом в Size Inspector установите constant -32)

#### 4.4.3. Добавьте элементы в Stack View:

**a) Image View:**
- Перетащите внутрь Stack View
- Height constraint: 250
- Content Mode: Aspect Fill
- Clip to Bounds: да

**b) Title Label:**
- Font: System 28, Bold
- Lines: 0
- Text: "Movie Title"

**c) Description Header Label:**
- Text: "Description"
- Font: System 20, Semibold

**d) Description Text View:**
- Scrolling Enabled: NO
- Editable: NO
- Font: System 16
- Text: "Description goes here..."
- Background: Clear Color
- Height constraint: ≥ 100 (или без него)

**e) Review Header Label:**
- Text: "My Review"
- Font: System 20, Semibold

**f) Review Text View:**
- Scrolling Enabled: NO
- Editable: NO
- Font: System 15
- Text: "Review goes here..."
- Background: Clear Color
- Text Color: Secondary Label Color
- Height constraint: ≥ 80 (или без него)

### 4.5. Подключите элементы Detail к коду
1. Выберите Detail View Controller
2. Assistant Editor → `MovieDetailViewController.swift`
3. **Control + Drag** от каждого элемента к соответствующему outlet:
   - Image View → `@IBOutlet weak var movieImageView`
   - Title Label → `@IBOutlet weak var titleLabel`
   - Description Text View → `@IBOutlet weak var descriptionTextView`
   - Review Text View → `@IBOutlet weak var reviewTextView`

---

## 📋 ШАГ 5: Повторите для Music, Books, и Courses

Теперь повторите **ШАГ 3 и ШАГ 4** для остальных трех категорий.

### Для Music (второй таб):
- **Root ViewController**: Class = `MusicViewController`
- **Navigation Title**: "Music"
- **Tab Bar Item**: Title = "Music", Image = `music.note`
- **Cell Identifier**: `MusicCell`
- **Cell Class**: `MusicTableViewCell`
- **Cell Outlets**: `musicImageView`, `titleLabel`
- **Detail VC Class**: `MusicDetailViewController`
- **Segue Identifier**: `showMusicDetail`
- **Detail Outlets**: `musicImageView`, `titleLabel`, `descriptionTextView`, `reviewTextView`

### Для Books (третий таб):
- **Root ViewController**: Class = `BooksViewController`
- **Navigation Title**: "Books"
- **Tab Bar Item**: Title = "Books", Image = `book`
- **Cell Identifier**: `BookCell`
- **Cell Class**: `BookTableViewCell`
- **Cell Outlets**: `bookImageView`, `titleLabel`
- **Detail VC Class**: `BookDetailViewController`
- **Segue Identifier**: `showBookDetail`
- **Detail Outlets**: `bookImageView`, `titleLabel`, `descriptionTextView`, `reviewTextView`

### Для Courses (четвертый таб):
- **Root ViewController**: Class = `CoursesViewController`
- **Navigation Title**: "Courses"
- **Tab Bar Item**: Title = "Courses", Image = `graduationcap`
- **Cell Identifier**: `CourseCell`
- **Cell Class**: `CourseTableViewCell`
- **Cell Outlets**: `courseImageView`, `titleLabel`
- **Detail VC Class**: `CourseDetailViewController`
- **Segue Identifier**: `showCourseDetail`
- **Detail Outlets**: `courseImageView`, `titleLabel`, `descriptionTextView`, `reviewTextView`

---

## 📋 ШАГ 6: Добавление placeholder изображений

Так как у нас есть ссылки на изображения в коде, нужно добавить placeholder'ы:

1. Откройте **Assets.xcassets**
2. Для каждой категории создайте Image Sets:
   - Movies: `movie1`, `movie2`, ... `movie10`
   - Music: `music1`, `music2`, ... `music10`
   - Books: `book1`, `book2`, ... `book10`
   - Courses: `course1`, `course2`, ... `course10`

3. Быстрый способ создать placeholder:
   - Правый клик в Assets → **New Image Set**
   - Переименуйте (например, в `movie1`)
   - Можете оставить пустым или добавить SF Symbol как placeholder

---

## ✅ Чеклист подключений

Используйте этот чеклист для проверки каждого таба:

### Movies Tab:
- [ ] MoviesViewController класс установлен
- [ ] Navigation title = "Movies"
- [ ] Tab bar item настроен (иконка + название)
- [ ] Table View добавлен с constraints
- [ ] Table View подключен к `@IBOutlet weak var tableView`
- [ ] Prototype Cell: Identifier = "MovieCell"
- [ ] Prototype Cell: Class = MovieTableViewCell
- [ ] Cell ImageView подключен к `movieImageView`
- [ ] Cell Label подключен к `titleLabel`
- [ ] Detail VC класс = MovieDetailViewController
- [ ] Segue identifier = "showMovieDetail"
- [ ] Detail outlets подключены (4 штуки)

### Music Tab:
- [ ] Повторите тот же чеклист с заменой на Music

### Books Tab:
- [ ] Повторите тот же чеклист с заменой на Books

### Courses Tab:
- [ ] Повторите тот же чеклист с заменой на Courses

---

## 🔧 Проверка подключений

### Как проверить, что outlet подключен:
1. Выберите View Controller в Storyboard
2. Откройте **Connections Inspector** (правая панель, последняя вкладка)
3. В секции **Outlets** вы увидите все подключения
4. Рядом с каждым outlet должен быть заполненный кружок

### Как проверить Segue:
1. Выберите segue (линию между контроллерами)
2. В **Attributes Inspector** проверьте Identifier
3. Убедитесь, что он совпадает со строкой в коде (`performSegue(withIdentifier:`)

---

## 🚀 Запуск проекта

После того как все подключили:

1. Выберите симулятор (например, iPhone 15 Pro)
2. Нажмите **Cmd + B** для сборки
3. Исправьте ошибки если есть
4. Нажмите **Cmd + R** для запуска

---

## 🐛 Частые ошибки и решения

### Ошибка: "Could not find a storyboard named 'Main'"
**Решение**: 
- Откройте `Info.plist`
- Найдите ключ "Main storyboard file base name"
- Убедитесь, что значение = "Main"

### Ошибка: "Could not cast value of type 'UITableViewCell' to 'MovieTableViewCell'"
**Решение**: 
- Вы забыли установить Custom Class для ячейки в Storyboard
- Выберите ячейку → Identity Inspector → Class = MovieTableViewCell

### Ошибка: "Fatal error: Unexpectedly found nil while unwrapping an Optional"
**Решение**: 
- Outlet не подключен в Storyboard
- Проверьте Connections Inspector

### Table View пустой (ничего не отображается)
**Решение**: 
- Проверьте Cell Identifier в Storyboard
- Убедитесь, что он совпадает со строкой в коде: `dequeueReusableCell(withIdentifier: "MovieCell")`

### Нажатие на ячейку ничего не делает
**Решение**: 
- Проверьте Segue Identifier
- Убедитесь, что segue создан от Cell к Detail VC (не от всего View Controller)

---

## 💡 Советы

1. **Сохраняйте часто**: Cmd + S
2. **Проверяйте имена**: Identifiers должны совпадать точно (с учетом регистра)
3. **Используйте Document Outline**: Легче выбирать элементы
4. **Проверяйте constraints**: Не должно быть красных или оранжевых линий
5. **Тестируйте по одному табу**: Сначала сделайте Movies полностью, протестируйте, потом остальные

---

## 📞 Если что-то не работает

1. Проверьте Connections Inspector для каждого View Controller
2. Убедитесь, что все Identifiers совпадают
3. Проверьте, что классы установлены правильно
4. Пересоберите проект (Cmd + Shift + K, потом Cmd + B)

---

Удачи! 🎉

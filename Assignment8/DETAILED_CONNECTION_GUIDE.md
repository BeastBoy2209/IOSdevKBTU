# 🎓 Пошаговое руководство: Подключение Storyboard к коду

---

## 📖 Содержание

1. [Основы подключения](#основы-подключения)
2. [Подключение View Controllers](#подключение-view-controllers)
3. [Подключение Table View](#подключение-table-view)
4. [Подключение Custom Cells](#подключение-custom-cells)
5. [Подключение Detail View](#подключение-detail-view)
6. [Создание Segues](#создание-segues)
7. [Проверка подключений](#проверка-подключений)

---

## 🎯 Основы подключения

### Что такое IBOutlet?

`@IBOutlet` - это способ связать элемент из Storyboard с переменной в коде.

```swift
@IBOutlet weak var tableView: UITableView!
```

Это означает: "В Storyboard есть Table View, и я хочу обращаться к нему в коде через переменную `tableView`"

### Три типа подключений

1. **Class** - какой класс Swift использовать для этого View Controller
2. **Outlet** - связь UI элемента с переменной в коде
3. **Segue** - переход между экранами с уникальным identifier

---

## 📱 Подключение View Controllers

### Пример: MoviesViewController

#### В Storyboard:
1. Выберите View Controller (тот, что идет после Navigation Controller)
2. Откройте **Identity Inspector** (3-я вкладка справа, иконка удостоверения)
3. В поле **Class** введите: `MoviesViewController`
4. В поле **Module** выберите: `Assignment8`

#### Почему это важно?
Без установки класса Storyboard не знает, какой код запускать для этого экрана!

#### Как проверить?
В **Identity Inspector** должно быть:
```
Custom Class
  Class: MoviesViewController
  Module: Assignment8
  Inherits From: UIViewController
```

---

## 📊 Подключение Table View

### Код в MoviesViewController.swift:

```swift
class MoviesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    //            ↑                  ↑
    //         название            тип элемента
    //    в Storyboard будет видно как "tableView"
}
```

### Как подключить в Storyboard:

#### Метод 1: Control+Drag (рекомендуется)

1. Откройте Storyboard
2. Найдите View Controller с классом `MoviesViewController`
3. Нажмите на **сам View Controller** (не на View, а на иконку контроллера в Document Outline)
4. **Control + Drag** от View Controller к Table View на canvas
5. В появившемся меню выберите `tableView`

#### Метод 2: Assistant Editor

1. Откройте Assistant Editor (Option + Cmd + Return)
2. Слева - Storyboard, справа - MoviesViewController.swift
3. Найдите Table View на Storyboard
4. **Control + Drag** от Table View к строке кода с `@IBOutlet weak var tableView`
5. Отпустите - должно появиться меню "Connect Outlet"

#### Как выглядит успешное подключение?

В **Connections Inspector** (последняя вкладка справа):
```
Outlets
  tableView → Table View
```

Рядом с `tableView` должен быть заполненный кружок ●

---

## 🎨 Подключение Custom Cells

### Настройка класса Cell

#### В Storyboard:
1. Выберите **Table View**
2. В **Attributes Inspector** установите **Prototype Cells**: `1`
3. Выберите появившуюся **ячейку** (Table View Cell)
4. В **Identity Inspector** установите:
   - **Class**: `MovieTableViewCell`
   - **Module**: `Assignment8`
5. В **Attributes Inspector** установите:
   - **Identifier**: `MovieCell` (это ОЧЕНЬ важно!)
   - **Style**: Custom
   - **Row Height**: 90

#### Почему Identifier важен?

В коде есть строка:
```swift
guard let cell = tableView.dequeueReusableCell(
    withIdentifier: "MovieCell",  // ← Должно совпадать!
    for: indexPath
) as? MovieTableViewCell
```

Если identifier не совпадет - приложение крашнется!

### Подключение элементов Cell

#### Код в MovieTableViewCell.swift:

```swift
class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
}
```

#### Как подключить в Storyboard:

1. Выберите **Table View Cell** (саму ячейку, не элементы внутри)
2. Откройте Assistant Editor
3. Справа должен открыться `MovieTableViewCell.swift`
4. **Control + Drag** от **Image View** (внутри ячейки) к строке `@IBOutlet weak var movieImageView`
5. **Control + Drag** от **Label** (внутри ячейки) к строке `@IBOutlet weak var titleLabel`

#### Частая ошибка:
❌ Делать Control+Drag от View Controller - **неправильно**!  
✅ Делать Control+Drag от самой ячейки (Table View Cell) - **правильно**!

---

## 📄 Подключение Detail View

### Настройка класса Detail VC

#### В Storyboard:
1. Добавьте новый View Controller
2. В **Identity Inspector**:
   - **Class**: `MovieDetailViewController`
   - **Module**: `Assignment8`

### Подключение элементов

#### Код в MovieDetailViewController.swift:

```swift
class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var reviewTextView: UITextView!
}
```

#### Как подключить:

Для каждого элемента:
1. Выберите **MovieDetailViewController** в Document Outline
2. **Control + Drag** от контроллера к элементу на canvas
3. Выберите соответствующий outlet

Или наоборот:
1. **Control + Drag** от элемента (ImageView, Label, TextViews) к View Controller
2. Выберите нужный outlet

#### Проверка:

Все 4 outlet'а должны быть подключены:
```
Outlets
  movieImageView → Image View
  titleLabel → Label
  descriptionTextView → Text View
  reviewTextView → Text View
```

---

## 🔗 Создание Segues

### Что такое Segue?

Segue - это переход между экранами. У каждого segue есть **identifier**, который используется в коде.

### Создание Segue от Cell к Detail

#### В Storyboard:
1. Найдите **Prototype Cell** в Table View
2. **Control + Drag** от **ячейки** к **Detail View Controller**
3. В меню выберите **Show** (это push segue)
4. Выберите **созданный segue** (линия между контроллерами)
5. В **Attributes Inspector** установите:
   - **Identifier**: `showMovieDetail`

#### Почему это работает?

В коде MoviesViewController есть:

```swift
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    performSegue(withIdentifier: "showMovieDetail", sender: nil)
    //                           ↑
    //                  Должно совпадать!
}
```

И:

```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "showMovieDetail",  // ← Проверка identifier
       let detailVC = segue.destination as? MovieDetailViewController,
       let indexPath = tableView.indexPathForSelectedRow {
        detailVC.movie = movies[indexPath.row]  // Передаем данные
    }
}
```

### Визуально в Storyboard:

```
[MoviesViewController] ──(showMovieDetail)──> [MovieDetailViewController]
       (Table View Cell) ────────────────────────>
```

---

## ✅ Проверка подключений

### Connections Inspector - ваш лучший друг!

#### Для каждого View Controller проверьте:

1. Выберите View Controller
2. Откройте **Connections Inspector** (последняя вкладка, иконка стрелки)
3. В секции **Outlets** проверьте все подключения

#### Пример для MoviesViewController:

```
Outlets
  tableView ● Table View
```

Символ ● означает "подключено"  
Символ ○ означает "не подключено" - нужно исправить!

#### Пример для MovieTableViewCell:

```
Outlets
  movieImageView ● Image View
  titleLabel ● Label
```

#### Пример для MovieDetailViewController:

```
Outlets
  movieImageView ● Image View
  titleLabel ● Label
  descriptionTextView ● Text View
  reviewTextView ● Text View
```

### Проверка Segues:

1. Выберите segue (линию между контроллерами)
2. В **Attributes Inspector** должен быть Identifier
3. Убедитесь, что он совпадает с кодом

---

## 🎯 Полный чек-лист для одного таба (Movies)

Используйте как шаблон для остальных табов:

### View Controller:
- [ ] Класс установлен: `MoviesViewController`
- [ ] Module установлен: `Assignment8`
- [ ] Navigation Title: "Movies"
- [ ] Tab Bar Item настроен (название + иконка)

### Table View:
- [ ] Добавлен в View Controller
- [ ] Constraints: 0-0-0-0
- [ ] Outlet подключен к `tableView`
- [ ] Prototype Cells: 1

### Table View Cell:
- [ ] Класс: `MovieTableViewCell`
- [ ] Module: `Assignment8`
- [ ] Identifier: `MovieCell`
- [ ] Row Height: 90
- [ ] Image View добавлен (размер 60x60)
- [ ] Label добавлен (font 17, semibold)
- [ ] Outlet `movieImageView` подключен
- [ ] Outlet `titleLabel` подключен

### Detail View Controller:
- [ ] Класс: `MovieDetailViewController`
- [ ] Module: `Assignment8`
- [ ] Scroll View добавлен
- [ ] Stack View добавлен в Scroll View
- [ ] Image View в Stack View (height 250)
- [ ] Title Label в Stack View
- [ ] Description TextView в Stack View
- [ ] Review TextView в Stack View
- [ ] Все 4 outlet'а подключены

### Segue:
- [ ] Создан от Cell к Detail VC
- [ ] Тип: Show (push)
- [ ] Identifier: `showMovieDetail`

### Проверка работы:
- [ ] Сборка без ошибок (Cmd+B)
- [ ] Приложение запускается
- [ ] Таблица показывает 10 фильмов
- [ ] Нажатие на фильм открывает детали
- [ ] Кнопка "Back" работает

---

## 🚨 Типичные ошибки и как их избежать

### Ошибка 1: "Could not cast value..."

```
Could not cast value of type 'UITableViewCell' to 'MovieTableViewCell'
```

**Причина**: Не установлен класс для ячейки в Storyboard

**Решение**: 
1. Выберите ячейку
2. Identity Inspector → Class: `MovieTableViewCell`

---

### Ошибка 2: "Fatal error: Unexpectedly found nil..."

```
Fatal error: Unexpectedly found nil while unwrapping an Optional value
```

**Причина**: Outlet не подключен

**Решение**: 
1. Проверьте Connections Inspector
2. Найдите outlet с ○ (пустым кружком)
3. Подключите его

---

### Ошибка 3: Table View пустой

**Причина**: Identifier ячейки не совпадает

**Решение**: 
1. Проверьте Attributes Inspector ячейки → Identifier
2. Должно быть точно `MovieCell` (с учетом регистра!)
3. Проверьте код: `dequeueReusableCell(withIdentifier: "MovieCell")`

---

### Ошибка 4: Нажатие на ячейку ничего не делает

**Причина**: Segue не создан или identifier неправильный

**Решение**: 
1. Убедитесь, что segue создан от Cell (не от View Controller!)
2. Проверьте identifier: должно быть `showMovieDetail`
3. Проверьте код: `performSegue(withIdentifier: "showMovieDetail")`

---

## 💡 Полезные советы

### 1. Используйте Document Outline
Левая панель в Storyboard показывает иерархию. Легче выбирать элементы оттуда.

### 2. Называйте элементы в Storyboard
Выберите элемент → Identity Inspector → Label: дайте понятное имя

### 3. Сохраняйте часто
Cmd+S после каждого подключения

### 4. Делайте по одному табу за раз
Не пытайтесь сделать все сразу. Сначала Movies, протестируйте, потом остальные.

### 5. Копируйте View Controllers
После настройки Movies можно скопировать Detail VC для остальных:
- Cmd+C на Detail VC
- Cmd+V для вставки
- Измените только класс и outlets

---

## 🎬 Порядок работы (рекомендуется)

### День 1: Movies Tab
1. Настройте Tab Bar Controller
2. Создайте Movies Navigation Controller
3. Настройте MoviesViewController
4. Добавьте и настройте Table View
5. Создайте и настройте Custom Cell
6. Подключите все outlets
7. Создайте Detail View Controller
8. Настройте layout Detail VC
9. Подключите outlets Detail VC
10. Создайте segue
11. **Тестируйте!** Запустите и убедитесь, что Movies работает

### День 2: Music, Books, Courses
Повторите те же шаги для остальных трех табов.

Используя Movies как шаблон, остальные сделать намного быстрее!

---

## 🏁 Финальная проверка перед запуском

Перед тем как нажать Cmd+R:

1. ✅ Clean Build: `Cmd + Shift + K`
2. ✅ Build: `Cmd + B`
3. ✅ Проверьте, нет ли ошибок
4. ✅ Проверьте, нет ли warnings (желтые треугольники)
5. ✅ Если есть ошибки Auto Layout - исправьте их
6. ✅ Run: `Cmd + R`

---

## 🎉 Поздравляем!

Если всё работает - вы успешно связали Storyboard с кодом!

Теперь у вас есть полнофункциональное приложение с:
- ✅ Tab Bar навигацией
- ✅ Списками избранного
- ✅ Детальными страницами
- ✅ Красивым интерфейсом

---

**Удачи! Если возникнут вопросы - сверяйтесь с этой инструкцией! 🚀**

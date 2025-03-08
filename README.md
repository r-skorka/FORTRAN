# FORTRAN

## Program 3
Program [`p3`](./Zadania/p03/p3.f95) otwiera istniejący plik `data_1` i dodaje do niego nową linię z tekstem "witaj".

### Szczegóły działania
1. **Otwieranie pliku**:
    - Plik `data_1` jest otwierany z jednostką logiczną 66.
    - Parametry otwarcia pliku:
        - `STATUS="OLD"`: Plik musi już istnieć.
        - `ACTION="WRITE"`: Plik otwierany jest w trybie do zapisu.
        - `POSITION="APPEND"`: Nowe dane będą dodawane na końcu pliku.

2. **Zapis do pliku**:
    - Polecenie `WRITE (UNIT=66, FMT=*) "witaj"` zapisuje linię tekstu "witaj" do otwartego pliku.

3. **Zakończenie programu**:
    - Polecenie `STOP` zatrzymuje wykonanie programu.
    - `END PROGRAM p3` oznacza koniec programu.

<br><br>

## Program 4
Program [`p4`](./Zadania/p04/p4.f95) odczytuje wartości z pliku `data_in` i wyświetla je na standardowym wyjściu w określonym formacie.

### Szczegóły działania
1. **Deklaracje zmiennych**:
    - `REAL :: a, b`: Deklaracja zmiennych rzeczywistych `a` i `b`.
    - `INTEGER :: c`: Deklaracja zmiennej całkowitej `c`.

2. **Otwieranie pliku**:
    - Plik `data_in` jest otwierany z jednostką logiczną 66.
    - Parametry otwarcia pliku:
        - `STATUS="OLD"`: Plik musi już istnieć.
        - `ACTION="READ"`: Plik otwierany jest w trybie do odczytu.
        - `POSITION="REWIND"`: Wskaźnik pliku ustawiany jest na początek.

3. **Odczyt danych z pliku**:
    - Polecenie `READ(UNIT=66, FMT=*) a, b, c` odczytuje wartości zmiennych `a`, `b` i `c` z pliku `data_in`.

4. **Zapis danych na standardowym wyjściu**:
    - Polecenie `WRITE (UNIT=*, FMT="(A8, F6.3, T40, A5, ES12.4, A6, I8)") &` wyświetla odczytane wartości w określonym formacie:
        - `A8`: Łańcuch znaków o długości 8.
        - `F6.3`: Liczba rzeczywista z 6 miejscami całkowitymi i 3 miejscami po przecinku.
        - `T40`: Ustawienie pozycji zapisu na kolumnie 40.
        - `A5`: Łańcuch znaków o długości 5.
        - `ES12.4`: Liczba w notacji wykładniczej z 12 miejscami całkowitymi i 4 miejscami po przecinku.
        - `A6`: Łańcuch znaków o długości 6.
        - `I8`: Liczba całkowita o szerokości 8 znaków.

5. **Zakończenie programu**:
    - Polecenie `STOP` zatrzymuje wykonanie programu.
    - `END PROGRAM p4` oznacza koniec programu.

<br><br>

## Program 5
Program [`p5`](./Zadania/p05/p5.f95) wyświetla wartości zmiennych `i` i `k` w ramach dwóch zagnieżdżonych pętli `DO`. Program wypisuje pary liczb, gdzie `i` przyjmuje wartości od 1 do 10, a `k` od 1 do 12 z krokiem 5.

### Szczegóły działania
1. **Deklaracje zmiennych**:
    - `INTEGER :: i, k`: Deklaracja zmiennych całkowitych `i` i `k`.

2. **Pierwsza pętla `DO`**:
    - `DO i = 1, 10`: Pętla zewnętrzna iteruje wartość `i` od 1 do 10.

3. **Druga pętla `DO`**:
    - `DO k = 1, 12, 5`: Pętla wewnętrzna iteruje wartość `k` od 1 do 12 z krokiem 5 (wartości `k` będą 1, 6, 11).

4. **Zapis danych na standardowym wyjściu**:
    - `WRITE (UNIT=*, FMT=*) i, k`: Wyświetla wartości `i` i `k` na standardowym wyjściu dla każdej iteracji pętli wewnętrznej.

5. **Zakończenie programu**:
    - Polecenie `STOP` zatrzymuje wykonanie programu.
    - `END PROGRAM p5` oznacza koniec programu.

<br><br>

## Program 6
Program [`p6`](./Zadania/p06/p6.f95) pobiera datę od użytkownika, wyodrębnia z niej miesiąc i sprawdza, czy miesiąc ten należy do wiosny, lata, czy żadnej z tych pór roku.

### Szczegóły działania
1. **Deklaracje zmiennych**:
    - `CHARACTER (LEN=10) :: date`: Deklaracja zmiennej znakowej `date` o długości 10 znaków, przechowującej datę w formacie `yyyy-mm-dd`.
    - `CHARACTER (LEN=2) :: month`: Deklaracja zmiennej znakowej `month` o długości 2 znaków, przechowującej miesiąc wyodrębniony z daty.

2. **Pobieranie daty od użytkownika**:
    - `WRITE (UNIT=*, FMT=*) "napisz date w formacie yyyy-mm-dd"`: Wyświetlenie komunikatu proszącego użytkownika o podanie daty.
    - `READ (UNIT=*, FMT=*) date`: Odczytanie daty podanej przez użytkownika.

3. **Wyodrębnianie miesiąca z daty**:
    - `month = date(6:7)`: Wyodrębnienie dwuznakowego miesiąca z pozycji 6 i 7 zmiennej `date`.

4. **Wyświetlanie miesiąca**:
    - `WRITE (UNIT=*, FMT="(A10)") month`: Wyświetlenie wyodrębnionego miesiąca.

5. **Sprawdzanie miesiąca za pomocą `SELECT CASE`**:
    - `CASE("03":"05")`: Jeśli miesiąc to marzec, kwiecień lub maj, wyświetla "to wiosna".
    - `CASE("06", "07", "08")`: Jeśli miesiąc to czerwiec, lipiec lub sierpień, wyświetla "to lato".
    - `CASE DEFAULT`: Dla innych wartości miesiąca, wyświetla "to nie wiosna ani lato".

6. **Zakończenie programu**:
    - Polecenie `STOP` zatrzymuje wykonanie programu.
    - `END PROGRAM p6` oznacza koniec programu.

<br><br>

## Program 7
Program [`p7`](./Zadania/p07/p7.f95) demonstruje manipulację łańcuchami znaków oraz odczyt i zapis danych od użytkownika. Program łączy i modyfikuje różne ciągi znaków, a następnie wyświetla wyniki na standardowym wyjściu.

### Szczegóły działania
1. **Deklaracje zmiennych**:
    - `CHARACTER (LEN=16) :: a, b, c, d`: Deklaracja zmiennych znakowych `a`, `b`, `c`, `d` o długości 16 znaków każda.

2. **Inicjalizacja zmiennych**:
    - `a = "a kindly gigant"`: Przypisanie wartości "a kindly gigant" do zmiennej `a`.
    - `b = "a small man"`: Przypisanie wartości "a small man" do zmiennej `b`.
    - `c = b(:8) // "step"`: Połączenie pierwszych 8 znaków zmiennej `b` z ciągiem "step", wynik to "a small step".
    - `d = "for a" // b(8:)`: Połączenie ciągu "for a" z znakami od 8. pozycji do końca zmiennej `b`, wynik to "for a man".

3. **Wyświetlanie wyników**:
    - `PRINT *, c, d`: Wyświetlenie wartości zmiennych `c` i `d`.

4. **Dalsza manipulacja zmiennymi**:
    - `b = " " // d(:4) // b(9:11) // a(3:6)`: Modyfikacja zmiennej `b` przez połączenie kilku fragmentów różnych ciągów. Wynik to " for smallkind".
    - `a = a(:2) // a(10:15) // " leap"`: Modyfikacja zmiennej `a` przez połączenie fragmentów ciągu `a` z ciągiem " leap". Wynik to "a gigant leap".

5. **Wyświetlanie zmodyfikowanych zmiennych**:
    - `PRINT *, a, b`: Wyświetlenie zmienionych wartości zmiennych `a` i `b`.

6. **Interakcja z użytkownikiem**:
    - `PRINT *, "your first name"`: Wyświetlenie komunikatu proszącego o podanie pierwszego imienia.
    - `READ *, a`: Odczytanie pierwszego imienia od użytkownika i przypisanie do zmiennej `a`.
    - `PRINT *, "your second name"`: Wyświetlenie komunikatu proszącego o podanie drugiego imienia.
    - `READ *, b`: Odczytanie drugiego imienia od użytkownika i przypisanie do zmiennej `b`.

7. **Wyświetlanie imion i dodanie tekstu**:
    - `PRINT *, a, b, "student"`: Wyświetlenie imion użytkownika z dodaniem słowa "student".
    - `PRINT *, TRIM(a), " ", TRIM(b), " student"`: Wyświetlenie przyciętych imion użytkownika (usunięcie końcowych spacji) z dodaniem słowa "student".

<br><br>

## Program 8
Program [`p8`](./Zadania/p08/p8.f95) demonstruje użycie typów zdefiniowanych przez użytkownika (custom types) do przechowywania i manipulowania danymi osobowymi. Program tworzy dwie zmienne typu `person`, przypisuje im wartości, a następnie wyświetla i analizuje te dane.

### Szczegóły działania
1. **Definicja typu `person`**:
    - `CHARACTER (LEN=12) :: first_name`: Pole na imię (maksymalnie 12 znaków).
    - `CHARACTER (LEN=1) :: middle_initial`: Pole na inicjał drugiego imienia (1 znak).
    - `CHARACTER (LEN=12) :: last_name`: Pole na nazwisko (maksymalnie 12 znaków).
    - `INTEGER :: age`: Pole na wiek.
    - `CHARACTER (LEN=1) :: sex`: Pole na płeć (1 znak, np. "M" lub "F").
    - `CHARACTER (LEN=11) :: social_security`: Pole na numer ubezpieczenia społecznego (11 znaków).

2. **Deklaracja zmiennych typu `person`**:
    - `TYPE(person) :: jack, jill`: Deklaracja dwóch zmiennych `jack` i `jill` typu `person`.

3. **Przypisanie wartości do zmiennych**:
    - `jack = person("Jack", "R", "Hagen", 47, "M", "123-45-6789")`: Przypisanie wartości do zmiennej `jack`.
    - `jill = person("Jill", "M", "Smith", 39, "F", "987-65-4321")`: Przypisanie wartości do zmiennej `jill`.

4. **Wyświetlanie danych**:
    - `PRINT *, jill%last_name`: Wyświetlenie nazwiska osoby `jill`.
    - `PRINT *, jack%age`: Wyświetlenie wieku osoby `jack`.

5. **Sprawdzanie płci i wyświetlanie informacji**:
    - `IF (jack%sex == "F") PRINT *, jack%first_name, "jest kobieta"`: Sprawdzenie, czy osoba `jack` jest kobietą i wyświetlenie odpowiedniego komunikatu (nie spełnione, więc komunikat nie zostanie wyświetlony).
    - `IF (jill%sex == "F") PRINT *, jill%first_name, "jest kobieta"`: Sprawdzenie, czy osoba `jill` jest kobietą i wyświetlenie odpowiedniego komunikatu (spełnione, więc wyświetli "Jill jest kobieta").

<br><br>

## Program 9
Program [`p9`](./Zadania/p09/p9.f95) oblicza pierwiastek sześcienny z liczby podanej przez użytkownika. Program wykorzystuje funkcję `cube_root`, zdefiniowaną poza głównym blokiem programu, do wykonania obliczeń.

### Szczegóły działania
1. **Deklaracje i interfejs funkcji**:
    - `INTERFACE`: Blok interfejsu deklarujący funkcję `cube_root`.
    - `REAL FUNCTION cube_root (x)`: Deklaracja funkcji `cube_root`, która przyjmuje i zwraca wartość typu `REAL`.

2. **Deklaracje zmiennych**:
    - `REAL :: a, b`: Deklaracja zmiennych rzeczywistych `a` i `b`.

3. **Pobieranie liczby od użytkownika**:
    - `PRINT *, "type a number:"`: Wyświetlenie komunikatu proszącego użytkownika o podanie liczby.
    - `READ *, a`: Odczytanie liczby podanej przez użytkownika i przypisanie do zmiennej `a`.

4. **Obliczanie pierwiastka sześciennego**:
    - `b = cube_root(a)`: Wywołanie funkcji `cube_root` z argumentem `a` i przypisanie wyniku do zmiennej `b`.

5. **Wyświetlanie wyniku**:
    - `PRINT *, "cube root of ", a, " is ", b`: Wyświetlenie wyniku obliczeń.

6. **Zakończenie programu**:
    - Polecenie `STOP` zatrzymuje wykonanie programu.
    - `END PROGRAM p9` oznacza koniec programu.

7. **Definicja funkcji `cube_root`**:
    - `REAL FUNCTION cube_root (x)`: Definicja funkcji `cube_root`.
    - `IMPLICIT NONE`: Wyłączenie domyślnych deklaracji typów.
    - `REAL :: x, log_x`: Deklaracja zmiennych `x` i `log_x`.
    - `log_x = LOG(x)`: Obliczenie logarytmu naturalnego z `x`.
    - `cube_root = EXP(log_x/3.0)`: Obliczenie pierwiastka sześciennego z `x` przez podzielenie logarytmu przez 3 i podniesienie liczby `e` do tej potęgi.

<br><br>

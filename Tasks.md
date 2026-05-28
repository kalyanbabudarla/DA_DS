```python
#task 1. Create a class with a private variable and access it using a getter method.

class Student:
    def __init__(self):
        self.__marks = 90

    def get_marks(self):
        return self.__marks

s = Student()
print(s.get_marks())
```

    90
    


```python
#task 2. Create a class with a private variable and update it using a setter method.

class Bank:
    def __init__(self):
        self.__balance = 0

    def set_balance(self, amount):
        self.__balance = amount

    def get_balance(self):
        return self.__balance

b = Bank()
b.set_balance(1000)
print(b.get_balance())
```

    1000
    


```python
#task 3. Create two classes with the same method name and call them using a loop.

class Dog:
    def sound(self):
        print("Bark")

class Cat:
    def sound(self):
        print("Meow")

for animal in [Dog(), Cat()]:
    animal.sound()
```

    Bark
    Meow
    


```python
#task 4. Demonstrate method overriding using parent and child classes.

class Vehicle:
    def move(self):
        print("Vehicle moves")

class Car(Vehicle):
    def move(self):
        print("Car drives")

c = Car()
c.move()
```

    Car drives
    


```python
#task 5. Create a class with private data and override a method in the child class to modify output.

class Employee:
    def __init__(self, salary):
        self.__salary = salary

    def get_salary(self):
        return self.__salary

class Manager(Employee):
    def get_salary(self):
        return super().get_salary() + 5000

m = Manager(20000)
print(m.get_salary())
```

    25000
    


```python
#task 6. Demonstrate duck typing using two different classes with the same method.

class Bird:
    def fly(self):
        print("Bird flying")

class Plane:
    def fly(self):
        print("Plane flying")

for obj in [Bird(), Plane()]:
    obj.fly()
```

    Bird flying
    Plane flying
    


```python
#task 7. Create a class that uses encapsulation with validation for setting values.

class Account:
    def __init__(self):
        self.__balance = 0

    def set_balance(self, amount):
        if amount > 0:
            self.__balance = amount

    def get_balance(self):
        return self.__balance

a = Account()
a.set_balance(500)
print(a.get_balance())
```

    500
    


```python
#task 8. Write a function that behaves differently based on the number of arguments passed.

def add(a, b, c=0):
    return a + b + c

print(add(2, 3))
print(add(2, 3, 4))
```

    5
    9
    


```python
#task 9. Create a class with a protected variable and access it in a child class.

class Person:
    def __init__(self):
        self._age = 25

class Student(Person):
    def show(self):
        print(self._age)

s = Student()
s.show()
```

    25
    


```python
#task 10. Create multiple classes with the same method name to calculate different results 

class Shape:
    def area(self):
        pass

class Square(Shape):
    def area(self):
        return 4 * 4

class Circle(Shape):
    def area(self):
        return 3.14 * 2 * 2

for shape in [Square(), Circle()]:
    print(shape.area())
```

    16
    12.56
    


```python

```

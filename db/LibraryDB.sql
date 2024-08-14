CREATE TABLE Книги (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Название NVARCHAR(255),
    Автор NVARCHAR(255),
    Год_издания INT,
    Жанр NVARCHAR(255)
);

CREATE TABLE Читатели (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Имя NVARCHAR(255),
    Фамилия NVARCHAR(255),
    Номер_билета NVARCHAR(50)
);

CREATE TABLE Выдачи (
    ID INT PRIMARY KEY IDENTITY(1,1),
    ID_Книги INT FOREIGN KEY REFERENCES Книги(ID),
    ID_Читателя INT FOREIGN KEY REFERENCES Читатели(ID),
    Дата_выдачи DATE,
    Дата_возврата DATE
);
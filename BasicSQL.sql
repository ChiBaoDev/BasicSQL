CREATE TABLE Students
(
    StudentId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    BirthDate DATE,
    Phone VARCHAR(15)
);

CREATE TABLE Courses
(
    CourseId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT,
    Price DECIMAL(10,2)
);

CREATE TABLE Enrollments
(
    EnrollmentId INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    StudentId INT NOT NULL,
    CourseId INT NOT NULL,
    EnrollDate DATE,
    Score REAL,

    CONSTRAINT FK_Student
        FOREIGN KEY (StudentId)
        REFERENCES Students(StudentId),

    CONSTRAINT FK_Course
        FOREIGN KEY (CourseId)
        REFERENCES Courses(CourseId)
);
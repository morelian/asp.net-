--建库
IF DB_ID('EduJW')IS NOT NULL 
   DROP DATABASE EduJW;
CREATE DATABASE EduJW
ON	(NAME='DataFile_1',FILENAME='D:\EduJW\DataFile_1.mdf')
LOG ON	(NAME='LogFile_1',FILENAME='D:\EduJW\LogFile_1.ldf');

USE EduJW						

--校区表创建
IF OBJECT_ID('tb_Campus')IS NOT NULL	
	DROP TABLE tb_Campus;
	GO
	CREATE TABLE tb_Campus
	(No  
		CHAR(4)
			NOT NULL 
		CONSTRAINT pk_Campus_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_Campus_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	Name
		VARCHAR(20)
			NOT NULL
	);
	--院系表创建
IF OBJECT_ID('tb_Department')IS NOT NULL	
	DROP TABLE tb_Department;
	GO
	CREATE TABLE tb_Department
	(No  
		CHAR(4)
			NOT NULL 
		CONSTRAINT pk_Department_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_Department_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	 Name
		VARCHAR(20)
			NOT NULL

	);
	--学位建表
	IF OBJECT_ID('tb_Degree')IS NOT NULL	
	DROP TABLE tb_Degree;
	GO
	CREATE TABLE tb_Degree
	(No  
		CHAR(4)
			NOT NULL 
		CONSTRAINT pk_Degree_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_Degree_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	 Name
		VARCHAR(20)
			NOT NULL

	);
--教室建表
IF OBJECT_ID('tb_Classroom')IS NOT NULL
	DROP TABLE tb_Classroom;
	GO 
	CREATE TABLE tb_Classroom
	(
	No  
		CHAR(4)
			NOT NULL 
		CONSTRAINT pk_Classroom_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_Classroom_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
		CampusNo
		CHAR(4)
			NOT NULL
			CONSTRAINT fk_Classroom_CampusNo
				FOREIGN KEY(CampusNo) 
				REFERENCES tb_Campus(No) 
			CONSTRAINT ck_Classroom_CampusNo 
				CHECK(CampusNo LIKE'[0-9][0-9][0-9][0-9]'),
	Content
		TEXT
			NULL)
	--专业建表
	IF OBJECT_ID('tb_Major')IS NOT NULL	
	DROP TABLE tb_Major;
	GO
	CREATE TABLE tb_Major
	(No  
		CHAR(4)
			NOT NULL 
		CONSTRAINT pk_Major_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_Major_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	 Name
		VARCHAR(20)
			NOT NULL,
	ShortName
		VARCHAR(20)
			NOT NULL,
	Length
		VARCHAR(20)
			NOT NULL,
	IsEnrolling
		bit
			NOT NULL,
	DegreeNo
		CHAR(4)
			NOT NULL 
		CONSTRAINT fk_Major_DegreeNo
			FOREIGN KEY(DegreeNo)
			REFERENCES tb_Degree(No)
		CONSTRAINT ck_Major_DegreeNo 
			CHECK(DegreeNo LIKE'[0-9][0-9][0-9][0-9]'),
	DepartmentNo
		CHAR(4)
			NOT NULL
		CONSTRAINT fk_Major_DepartmentNo
			FOREIGN KEY(DepartmentNo) 
			REFERENCES tb_Department(No) 
		CONSTRAINT ck_Major_DepartmentNo 
			CHECK(DepartmentNo LIKE'[0-9][0-9][0-9][0-9]'),
	);
--教学周历建表
IF OBJECT_ID('tb_Teachingcalender')IS NOT NULL
DROP TABLE tb_Teachingcalender
	GO
	CREATE TABLE tb_Teachingcalender
	(No
		CHAR(5)
			NOT NULL
		CONSTRAINT pk_Teachingcalender_No
			PRIMARY KEY(No)
		CONSTRAINT ck_Teachingcalender_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9][0-9]'),
	Weekly
		INT
			NOT NULL,
	StartTime
		DATE
			NOT NULL)

--班级建表
IF OBJECT_ID('tb_Class')IS NOT NULL
DROP TABLE tb_Class
	GO
	CREATE TABLE tb_Class
	(No
		CHAR(5)
			NOT NULL
		CONSTRAINT pk_Class_No
			PRIMARY KEY(No)
		CONSTRAINT ck_Class_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9][0-9]'),
	Year
		CHAR(4)
			NOT NULL,
	AdministrationClass
		VARCHAR(30)
			NOT NULL,
	HassGraduated
		bit
			NOT NULL,
	MajorNo
		CHAR(4)
		NOT NULL
		CONSTRAINT  fk_CLass_MajorNo
			FOREIGN KEY(MajorNo) 
			REFERENCES tb_Major(No) 
	    CONSTRAINT ck_Class_MajorNo 
			CHECK(MajorNo LIKE'[0-9][0-9][0-9][0-9]'),
	CampusNo
		CHAR(4)
			NOT NULL
			CONSTRAINT fk_Class_CampusNo
				FOREIGN KEY(CampusNo) 
				REFERENCES tb_Campus(No) 
			CONSTRAINT ck_Class_CampusNo 
				CHECK(CampusNo LIKE'[0-9][0-9][0-9][0-9]')
	);
--学生建表
IF OBJECT_ID('tb_Student')IS NOT NULL
DROP TABLE tb_Student
	GO
	CREATE TABLE tb_Student
	(No
		CHAR(10) 
			NOT NULL
			CONSTRAINT pk_Student_No
				PRIMARY KEY(No)
			CONSTRAINT ck_Student_No 
				CHECK(No LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
		PassWord
		BINARY(128)
			NOT NULL,
	 Name
		VARCHAR(20)
			NOT NULL,
	Gender
		bit
			NULL,
	BirthDate
		Date
			NULL,
	Phone
		CHAR(11)
		NULL,
	StudentFile
		text,
	TrainingprogramNo
		CHAR(5),
	Securityissue
		VARCHAR(50)
			NULL,
	Securityissue2
		VARCHAR(50)
			NULL,
	Answer
		BINARY(128)
			NULL,
	Answer2
		BINARY(128)
			NULL,
	PersonalResume
		text
			NULL,
	Avatar
		text
			NULL,
	ClassNo
		CHAR(5)
		NOT NULL
		CONSTRAINT fk_Student_ClassNo
			FOREIGN KEY(ClassNo)
			REFERENCES tb_Class(No) 
		CONSTRAINT ck_Student_ClassNo
				CHECK(ClassNo LIKE'[0-9][0-9][0-9][0-9][0-9]')
	);
--教师职称建表
IF　OBJECT_ID('tb_FacultyTitle')IS NOT NULL
DROP TABLE tb_FacultyTitle
	GO
	CREATE TABLE tb_FacultyTitle
	(No
		CHAR(4)
			NOT NULL
		CONSTRAINT pk_FacultyTitle_No
			PRIMARY KEY(No)
		CONSTRAINT ck_FacultyTitle_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	 Name
		VARCHAR(20)
			NOT NULL,
	LevelFlag
		VARCHAR(20)
			NOT NULL,

	);
--教师建表
IF　OBJECT_ID('tb_Faculty')IS NOT NULL
DROP TABLE tb_Faculty
	GO
	CREATE TABLE tb_Faculty
	(No
		CHAR(10)
			NOT NULL
		CONSTRAINT pk_Faculty_No
			PRIMARY KEY(No)
		CONSTRAINT ck_Faculty_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	PassWord
		BINARY(128)
			NOT NULL,
	 Name
		VARCHAR(20)
			NOT NULL,
	Gender
		bit
			NOT NULL,
	AdmiDate
		Date
			NOT NULL,
	Phone
		CHAR(11)
			NOT NULL
		CONSTRAINT ck_Faculty_Phone
			CHECK(Phone LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	BirthDate
		Date
			NOT NULL,
	TitleNo
		CHAR(4)
			NOT NULL
		CONSTRAINT fk_Faculty_FacultyTitleNo
			FOREIGN KEY(TitleNo)
			REFERENCES tb_FacultyTitle(No) 
		CONSTRAINT ck_Faculty_FacultyTitleNo
				CHECK(TitleNo LIKE'[0-9][0-9][0-9][0-9]'),
	DepartmentNo
			CHAR(4)
			NOT NULL
		CONSTRAINT fk_Faculty_DepartmentNoFacultyTitleNo
			FOREIGN KEY(DepartmentNo)
			REFERENCES tb_Department(No) 
		CONSTRAINT ck_Faculty_DepartmentNo
				CHECK(DepartmentNo LIKE'[0-9][0-9][0-9][0-9]')

	 );
--课程修读类型
IF　OBJECT_ID('tb_StudyType')IS NOT NULL
DROP TABLE tb_StudyType
	GO
	CREATE TABLE tb_StudyType
	(No  
		CHAR(4)
			NOT NULL 
		CONSTRAINT pk_StudyType_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_StudyType_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	Name
		VARCHAR(20)
			NOT NULL
	);
--课程考试类型
IF　OBJECT_ID('tb_ExamType')IS NOT NULL
DROP TABLE tb_ExamType
	GO
	CREATE TABLE tb_ExamType
	(No  
		CHAR(4)
			NOT NULL 
		CONSTRAINT pk_ExamType_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_ExamType_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	Name
		VARCHAR(20)
			NOT NULL
	);
--课程建表
IF　OBJECT_ID('tb_Course')IS NOT NULL
DROP TABLE tb_Course
	GO
	CREATE TABLE tb_Course
	(No  
		CHAR(5)
			NOT NULL 
		CONSTRAINT pk_Course_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_Course_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9][0-9]'),
	Name
		VARCHAR(20)
			NOT NULL,
	PerCourseNo
		CHAR(5)
		NULL
		CONSTRAINT ck_Course_PerCourseNo 
			CHECK(PerCourseNo LIKE'[0-9][0-9][0-9][0-9][0-9]'),
	Credit
		int
			NOT NULL,
	Length
		INT
			NOT NULL,
	Examwhether
		INT
			NOT NULL,
	StudyTypeNo
		CHAR(4)
			NOT NULL
		CONSTRAINT fk_Course_StudyTypeNo
			FOREIGN KEY(StudyTypeNo)
			REFERENCES tb_StudyType(No) 
		CONSTRAINT ck_Course_StudyTypeNo
				CHECK(StudyTypeNo LIKE'[0-9][0-9][0-9][0-9]'),
	ExamTypeNo
		CHAR(4)
			NOT NULL
		CONSTRAINT fk_Course_ExamTypeNo
			FOREIGN KEY(ExamTypeNo)
			REFERENCES tb_ExamType(No) 
		CONSTRAINT ck_Course_ExamTypeNo
				CHECK(ExamTypeNo LIKE'[0-9][0-9][0-9][0-9]'),
	ClassroomNo
		CHAR(4)
			NOT NULL
		CONSTRAINT fk_Course_Classroom
			FOREIGN KEY(ClassroomNo)
			REFERENCES tb_Classroom(No) 
		CONSTRAINT ck_Course_ClassroomNo
				CHECK(ClassroomNo LIKE'[0-9][0-9][0-9][0-9]')

	);
--课程明细建表
IF OBJECT_ID('tb_CourseDetail')IS NOT NULL
DROP TABLE tb_CourseDetail 
	Go
	CREATE TABLE tb_CourseDetail
	(No
		CHAR(11)
			NOT NULL
		CONSTRAINT pk_CourseDetail_No
			PRIMARY KEY(No)
		CONSTRAINT ck_CourseDetail_No
				CHECK(No LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Brief
		text,
	
	Notes
		text,
	Abstract
		text,
	Document
		text,
	DocumentType
		text

	)


--学期建表
IF OBJECT_ID('tb_Term')IS NOT NULL	
	DROP TABLE tb_Term;
	GO
	CREATE TABLE tb_Term
	(No
		CHAR(11)
			NOT NULL
		CONSTRAINT pk_Term_No
			PRIMARY KEY(No)
		CONSTRAINT ck_Term_No
				CHECK(No LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	 Name
		VARCHAR(20)
			NOT NULL,
	TeachingcalenderNo
		CHAR(5)
			NOT NULL
		CONSTRAINT fk_TeachingTask_TeachingcalenderNo
			FOREIGN KEY(TeachingcalenderNo)
			REFERENCES tb_Teachingcalender(No) 
		CONSTRAINT ck_Term_TeachingcalenderNo
				CHECK(TeachingcalenderNo LIKE'[0-9][0-9][0-9][0-9][0-9]'),

	);
--教材建表
IF OBJECT_ID('tb_Book')IS NOT NULL	
	DROP TABLE tb_Book;
	GO
	CREATE TABLE tb_Book
	(No  
		CHAR(12)
			NOT NULL 
		CONSTRAINT pk_Book_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_Book_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	 Name
		VARCHAR(50)
			NOT NULL,
	Press
		VARCHAR(50)
			NOT NULL,
	Author
		VARCHAR(30)
			NOT NULL,
	Price
		float
			NOT NULL,
	Isbn
		VARCHAR(50)
			NOT NULL

	);
--教学任务建表
IF OBJECT_ID('tb_TeachingTask')IS NOT NULL	
	DROP TABLE tb_TeachingTask;
	GO
	CREATE TABLE tb_TeachingTask
	(No  
		CHAR(11)
			NOT NULL 
		CONSTRAINT pk_TeachingTask_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_TeachingTask_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	TermNo
		CHAR(11)
			NOT NULL
		CONSTRAINT fk_TeachingTask_TermNo
			FOREIGN KEY(TermNo)
			REFERENCES tb_Term(No) 
		CONSTRAINT ck_TeachingTask_TermNo
				CHECK(TermNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	FacultyNo
		CHAR(10)
			NOT NULL
		CONSTRAINT fk_TeachingTask_FacultyNo
			FOREIGN KEY(FacultyNo)
			REFERENCES tb_Faculty(No) 
		CONSTRAINT ck_TeachingTask_FacultyNo
				CHECK(FacultyNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	CourseNo
		CHAR(5)
			NOT NULL
		CONSTRAINT fk_TeachingTask_CourseNo
			FOREIGN KEY(CourseNo)
			REFERENCES tb_Course(No) 
		CONSTRAINT ck_TeachingTask_CourseNo
				CHECK(CourseNo LIKE'[0-9][0-9][0-9][0-9][0-9]'),
				
	BookNo
		CHAR(12)
			 NULL
		CONSTRAINT fk_TeachingTask_BookNo
			FOREIGN KEY(BookNo)
			REFERENCES tb_Book(No) 
		CONSTRAINT ck_TeachingTask_BookNo
				CHECK(BookNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

	);
--考试属性
IF OBJECT_ID('tb_tb_ExameAttribute')IS NOT NULL	
	DROP TABLE tb_ExameAttribute;
	GO
	CREATE TABLE tb_ExameAttribute
	(No
		CHAR(4)
				NOT NULL 
			CONSTRAINT pk_tb_ExameAttribute_No 
				PRIMARY KEY(No) 
			CONSTRAINT ck_tb_ExameAttribute_No 
				CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	Name
		VARCHAR(50)
			NOT NULL
			)
--考试类型
IF OBJECT_ID('tb_ExameType')IS NOT NULL	
	DROP TABLE tb_ExameType;
	GO
	CREATE TABLE tb_ExameType
	(No
		CHAR(4)
				NOT NULL 
			CONSTRAINT pk_tb_ExameType_No 
				PRIMARY KEY(No) 
			CONSTRAINT ck_tb_ExameType_No 
				CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	Name
		VARCHAR(50)
			NOT NULL
			)
--学生成绩
IF OBJECT_ID('tb_StudentScore')IS NOT NULL	
	DROP TABLE tb_StudentScore;
	GO
	CREATE TABLE tb_StudentScore
	(
	StudentNo  
		CHAR(10)
			NOT NULL 
			CONSTRAINT fk_StudentSocre_StudentNo 
			FOREIGN KEY(StudentNo)
			REFERENCES  tb_Student(No)
		CONSTRAINT ck_StudentSocre_StudentNo 
			CHECK(StudentNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	TeachingTaskNo
		CHAR(11)
			NOT NULL
		--CONSTRAINT pk_StudentScore
		--	PRIMARY KEY(StudentNo,TeachingTaskNo) 
		CONSTRAINT fk_StudentScore_TeachingTaskNo
			FOREIGN KEY(TeachingTaskNo)
			REFERENCES tb_TeachingTask(No) 
		CONSTRAINT ck_StudentScore_TeachingTaskNo
				CHECK(TeachingTaskNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
		BookOrderFlag
			VARCHAR(50)
				NOT NULL,
		BasicScore
			float
				NOT NULL,
		FinalScore
			float
				NOT NULL,
		TotalScore
			float
				NOT NULL,
		FaculatyScore
			float
					NULL,
		StudentComment
			TEXT
				NULL,
		FacultyScore
			float
				NOT NULL,
		LastModifyTime
			Date
				NOT NULL,
		TypeNo
		CHAR(4)
			NOT NULL
		CONSTRAINT fk_StudentScore_TypeNo
			FOREIGN KEY(TypeNo)
			REFERENCES tb_ExameType(No) 
		CONSTRAINT ck_StudentScore_TypeNo
				CHECK(TypeNo LIKE'[0-9][0-9][0-9][0-9]'),
		AttributeNo
		CHAR(4)
			NOT NULL
		CONSTRAINT fk_StudentScore_AttributeNo
			FOREIGN KEY(AttributeNo)
			REFERENCES tb_ExameAttribute(No) 
		CONSTRAINT ck_StudentScore_AtteributeNo
				CHECK(AttributeNo LIKE'[0-9][0-9][0-9][0-9]')

	);
--实习建表
IF OBJECT_ID('tb_Trainee')IS NOT NULL	
	DROP TABLE tb_Trainee;
	GO
	CREATE TABLE tb_Trainee
	(No  
		CHAR(5)
			NOT NULL 
		CONSTRAINT pk_Trainee_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_Trainee_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9][0-9]'),
	Details
		TEXT
			NULL,
	Name
		TEXT
			NULL,
	Place
		TEXT
			NULL,
	Lengths
		VARCHAR(50)
			NULL,

	)
--已选实习建表
IF OBJECT_ID('tb_Traineed')IS NOT NULL	
	DROP TABLE tb_Traineed;
	GO
	CREATE TABLE tb_Traineed
	(
	TraineeNo
		CHAR(5)
			NOT NULL 
			CONSTRAINT fk_Traineed_TraineeNo
			FOREIGN KEY(TraineeNo)
			REFERENCES  tb_Trainee(No)
		CONSTRAINT ck_Traineed_TraineeNo
			CHECK(TraineeNo LIKE'[0-9][0-9][0-9][0-9][0-9]'),
	 StudentNo  
		CHAR(10)
			NOT NULL 
			CONSTRAINT fk_Traineed_StudentNo 
			FOREIGN KEY(StudentNo)
			REFERENCES  tb_Student(No)
		CONSTRAINT ck_Traineed_StudentNo 
			CHECK(StudentNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

	)
--培养方案建表
IF OBJECT_ID('tb_Trainingprogram')IS NOT NULL	
	DROP TABLE tb_Trainingprogram;
	GO
	CREATE TABLE tb_Trainingprogram
	(No  
		CHAR(5)
			NOT NULL 
		CONSTRAINT pk_Trainingprogram_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_Trainingprogram_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9][0-9]'),
	TeachingTaskNo
		CHAR(11)
			NOT NULL
		CONSTRAINT fk_Trainingprogram_TeachingTaskNo
			FOREIGN KEY(TeachingTaskNo)
			REFERENCES tb_TeachingTask(No) 
		CONSTRAINT ck_Trainingprogram_TeachingTaskNo
				CHECK(TeachingTaskNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	TraineeNo
		CHAR(5)
			NOT NULL
		CONSTRAINT fk_Trainingprogram_TraineeNo
			FOREIGN KEY(TraineeNo)
			REFERENCES tb_Trainee(No) 
		CONSTRAINT ck_Trainingprogram_TraineeNo
				CHECK(TraineeNo LIKE'[0-9][0-9][0-9][0-9][0-9]'),
	MajorNo
		CHAR(4)
		NOT NULL
		CONSTRAINT  fk_Trainingprogram_MajorNo
			FOREIGN KEY(MajorNo) 
			REFERENCES tb_Major(No) 
	    CONSTRAINT ck_Trainingprogram_MajorNo 
			CHECK(MajorNo LIKE'[0-9][0-9][0-9][0-9]'),
	)
--社会性考试
IF OBJECT_ID('tb_SocialExamtion')IS NOT NULL
	DROP TABLE tb_SocialExam;
	GO 
	CREATE TABLE tb_SocialExam
	(No  
		CHAR(4)
			NOT NULL 
		CONSTRAINT pk_SocialExamtion_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_SocialExamtion_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	Name
		VARCHAR(50)
			NOT NULL,
	ExamTime
		CHAR(10)
			NOT NULL,
	ExamType
		VARCHAR(50),
	Score
		float,
	 StudentNo  
		CHAR(10)
			NOT NULL 
			CONSTRAINT fk_SocialExamtion_StudentNo 
			FOREIGN KEY(StudentNo)
			REFERENCES  tb_Student(No)
		CONSTRAINT ck_SocialExamtion_StudentNo 
			CHECK(StudentNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
			)
--留言建表
IF OBJECT_ID('tb_Message')IS NOT NULL
	DROP TABLE tb_Message;
	GO 
	CREATE TABLE tb_Message
	(
	No  
		CHAR(4)
			NOT NULL 
		CONSTRAINT pk_Message_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_Message_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	Title
		VARCHAR(50)
			NOT NULL,
	Type
		VARCHAR(50)
			NULL,
	SenderNo  
		CHAR(10)
			NOT NULL 
					CONSTRAINT ck_Message_SenderNo 
			CHECK(SenderNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Time
		Date
			NULL,
	Readed
		int
			NULL,
	Content
		TEXT
			NOT NULL,
	RecipientNo
		CHAR(10)
		NOT NULL
			)
--公告建表
IF OBJECT_ID('tb_Board')IS NOT NULL
	DROP TABLE tb_Board;
	GO 
	CREATE TABLE tb_Board
	(
	No  
		CHAR(4)
			NOT NULL 
		CONSTRAINT pk_Board_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_Board_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	Title
		VARCHAR(50)
			NOT NULL,
	Type
		VARCHAR(50)
			NULL,
	Time
		Date
			NULL,
	Content
		TEXT
			NOT NULL,
	 SenderNo  
		CHAR(10)
			 NULL 
			CONSTRAINT fk_Board_SenderNo 
			FOREIGN KEY(SenderNo)
			REFERENCES  tb_Faculty(No)
		CONSTRAINT ck_Board_SenderNo 
			CHECK(SenderNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
--已读公告
IF OBJECT_ID('tb_ReadBoard')IS NOT NULL
	DROP TABLE tb_ReadBoard;
	GO 
	CREATE TABLE tb_ReadBoard
	(No
		CHAR(6)
			NOT NULL 
		CONSTRAINT pk_ReadBoard_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_ReadBoard_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9][0-9][0-9]'),
	 StudentNo  
		CHAR(10)
			 NULL 
			CONSTRAINT fk_Board_StudentNo 
			FOREIGN KEY(StudentNo)
			REFERENCES  tb_Student(No)
		CONSTRAINT ck_ReadBoard_StudentNo 
			CHECK(StudentNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	BoardNo  
		CHAR(4)
			 NULL 
			CONSTRAINT fk_ReadBoard_BoardNo
			FOREIGN KEY(BoardNo)
			REFERENCES  tb_Board(No)
		CONSTRAINT ck_ReadBoard_BoardNo
			CHECK(BoardNo LIKE'[0-9][0-9][0-9][0-9]'),
	)
--教学周历表插入数据
INSERT INTO tb_Teachingcalender (No,Weekly,StartTime)
VALUES('20211','20','2021-8-30'),('20212','20','2022-3-1')
--校区表插入数据
	INSERT INTO tb_Campus
	(No
	,Name)
	VALUES
	('1201'	,'旗山校区'),	('1202'	,'屏山校区'),	('1203'	,'仓山校区'),	('1204'	,'长乐校区'),	('1205'	,'泉州港校区');
--院系表建立校区
  INSERT INTO tb_Department
  (No
  ,Name)
  VALUES
  ('1001'  ,'人文与管理学院'),  ('1002' ,'中医学院'),  ('1003'  ,'中西医结合医学院'),  ('1004'  ,'药学院'),  ('1005' ,'护理学院')
--教室
INSERT INTO tb_Classroom
	(No,Content,CampusNo)
	VALUES('1101','xxxxxxxxx','1201'),('1102','xxxxxxxxx','1201'),('1103','xxxxxxxxx','1201'),('1104','xxxxxxxxx','1201'),('1105','xxxxxxxxx','1201')
  --考试属性
INSERT INTO tb_ExameAttribute (No,Name) VALUES('1101','专业课'),('1102','专业基础课'),('1103','公共基础课'),('1104','专业选修课'),('1105','公共选修课')
  --考试类型
INSERT INTO tb_ExameType (No,Name) VALUES('1201','考试'),('1202','闭卷考试'),('1203','操作'),('1204','考查'),('1205','开卷考试')
--学位表数据插入
INSERT INTO tb_Degree
  (No,
  Name)
  VALUES
  ('2001'  ,'医学'),  ('2002'  ,'农学'),  ('2003'  ,'工学'),  ('2004'  ,'管理学'),  ('2005'  ,'理学')
--专业表添加数据
INSERT INTO tb_Major
 (No ,Name ,ShortName,Length,IsEnrolling,DegreeNo,DepartmentNo)  VALUES
  ('2101'  ,'信息管理与信息系统'  ,'信管'  ,'四年制'  ,'1'  ,'2004'  ,'1001'),
  ('2102'  ,'公共事业管理'        ,'公管'  ,'四年制'  ,'1'  ,'2004'  ,'1001'),
  ('2103'  ,'健康管理'            ,'健管'  ,'四年制'  ,'1'  ,'2004'  ,'1001'),
  ('2204'  ,'临床医学'            ,'临床'  ,'五年制'  ,'1'  ,'2001'  ,'1003'),
  ('2205'  ,'中医学'              ,'中医'  ,'五年制'  ,'1'  ,'2001'  ,'1002' )
--班级表添加数据
INSERT INTO tb_Class
  (No  ,Year  ,AdministrationClass  ,HassGraduated  ,MajorNo  ,CampusNo  ) VALUES
  ('32201'  ,'大一'  ,'2022级信息管理与信息系统班'  ,'0'  ,'2101'  ,'1201'),
  ('32101'  ,'大二'  ,'2021级信息管理与信息系统班'  ,'0'  ,'2101'  ,'1201'),
  ('32001'  ,'大三'  ,'2020级信息管理与信息系统班'  ,'0'  ,'2101'  ,'1201'),
  ('31901'  ,'大四'  ,'2019级信息管理与信息系统班'  ,'0'  ,'2101'  ,'1201'),
  ('32102'  ,'大二'  ,'2021级公共事业管理一班'      ,'0'  ,'2102'  ,'1201')
--学生表添加数据
INSERT INTO tb_Student
 (No ,Name ,PassWord ,Gender ,ClassNo ,BirthDate ,Phone ,PersonalResume ,Avatar ,StudentFile )
  VALUES
  ('3210707001'  ,'田杰红'  ,HASHBYTES('MD5','1')  ,'0'  ,'32101'  ,'2002-06-07'  ,'13004959601'  ,'xxxxxxxxxx'  ,'田杰红.jpg' ,'' ),
  ('3210707002'  ,'刘兰'    ,HASHBYTES('MD5','1')  ,'0'  ,'32101'  ,'2003-06-07'  ,'13004959602'  ,'xxxxxxxxxx'  ,'刘兰.jpg' ,''),
  ('3210707003'  ,'吴争宇'  ,HASHBYTES('MD5','1')  ,'1'  ,'32101'  ,'2004-01-07'  ,'13004959603'  ,'xxxxxxxxxx'  ,'吴争宇.jpg' ,''),
  ('3210707004'  ,'廖丽珍'  ,HASHBYTES('MD5','1')  ,'0'  ,'32101'  ,'2002-11-07'  ,'13004959604'  ,'xxxxxxxxxx'  ,'廖丽珍.jpg' ,''),
  ('3210707005'  ,'罗清香'  ,HASHBYTES('MD5','1')  ,'0'  ,'32101'  ,'2002-09-07'  ,'13004959605'  ,'xxxxxxxxxx' ,'罗清香.jpg'  ,'')
--教师职称表插入数据
INSERT INTO tb_FacultyTitle
  (No  ,Name  ,LevelFlag)  VALUES
  ('1301'  ,'教授'  ,'一级'),
  ('1302'  ,'副教授'  ,'二级'),
  ('1303'  ,'讲师'  ,'三级'),
  ('1304'  ,'助教'  ,'四级'),
  ('1305'  ,'助理'  ,'五级')
--教师表插入数据
INSERT INTO tb_Faculty
  (No  ,PassWord,Name  ,Gender ,BirthDate ,AdmiDate  ,Phone  ,TitleNo  ,DepartmentNo)  VALUES
  ('1110707001'  ,HASHBYTES('MD5','1') ,'林立'    ,'1'  ,'1985-6-6'   ,'2013-7-7'   ,'13005060601'  ,'1303'  ,'1001'),
  ('1110707002'  ,HASHBYTES('MD5','1') ,'张翠萍'  ,'0'  ,'1980-6-6'   ,'2007-6-7'   ,'13005060602'  ,'1302'  ,'1001'),
  ('1110707003'  ,HASHBYTES('MD5','1') ,'陈林'    ,'1'  ,'1985-8-6'   ,'2013-11-17' ,'13005060603'  ,'1303'  ,'1001'),
  ('1110707004'  ,HASHBYTES('MD5','1') ,'扬雪梅'  ,'0'  ,'1980-4-12'  ,'2007-7-7'   ,'13005060604'  ,'1303'  ,'1001'),
  ('1110707005'  ,HASHBYTES('MD5','1') ,'张闽碧'  ,'0'  ,'1970-8-30'  ,'2095-8-27'  ,'13005060605'  ,'1302'  ,'1001'),
  ('1110707006'  ,HASHBYTES('MD5','1') ,'张栗'    ,'0'  ,'1970-8-30'  ,'2095-8-27'  ,'13005060606'  ,'1301'  ,'1001'),
  ('1110707007'  ,HASHBYTES('MD5','1') ,'王承民'  ,'1'  ,'1970-8-30'  ,'2095-8-27'  ,'13005060607'  ,'1301'  ,'1001')
--课程修读类型
INSERT INTO tb_StudyType
  (No ,Name)  VALUES
  ('2201'  ,'专业课'), ('2202'  ,'公共基础课'),  ('2203'  ,'通识教育课'),  ('2204'  ,'学科基础课'),  ('2205'  ,'专业教育课')
  --课程考试类型
  INSERT INTO tb_ExamType
   (No  ,Name)   VALUES
   ('2301' ,'闭卷考试'),  ('2302' ,'考试'),   ('2303'   ,'操作'),   ('2304'   ,'上机考试'),   ('2305'   ,'课程设计')
--课程表插入数据
  INSERT INTO tb_Course
  (No ,Name  ,PerCourseNo  ,Credit  ,Length  ,StudyTypeNo  ,ExamTypeNo  ,ClassroomNo  ,Examwhether  ) VALUES  
  ('44001'  ,'面向对象程序设计'  ,'44001'  ,4.5  ,64  ,'2201'  ,'2304'  ,'1101'  ,'1'),
  ('44002'  ,'C语言程序设计'     ,'44002'  ,4.5  ,64  ,'2201'  ,'2304'  ,'1101'  ,'1'),
  ('44003'  ,'数据结构'          ,'44002'  ,4.5  ,64  ,'2201'  ,'2301'  ,'1101'  ,'1'),
  ('44004'  ,'数据库原理'        ,'44001'  ,4.5  ,64  ,'2201'  ,'2301'  ,'1101'  ,'1'), 
  ('44005'  ,'计算机网络'        ,'44005'  ,4.5  ,72  ,'2201'  ,'2301'  ,'1101'  ,'1')
  --课程明细表插入数据
  INSERT INTO tb_CourseDetail
  (No  ,Brief  ,Notes  ,Abstract  ,Document ,DocumentType)  VALUES
  ('55332211001'  ,'xxxxxxxx'  ,'xxxxxxxx'  ,'xxxxxxxx'  ,'xxxxxxxx'  ,'xxxxxxxx'),
  ('55332211002'  ,'xxxxxxxx'  ,'xxxxxxxx'  ,'xxxxxxxx'  ,'xxxxxxxx'  ,'xxxxxxxx'),
  ('55332211003'  ,'xxxxxxxx'  ,'xxxxxxxx'  ,'xxxxxxxx'  ,'xxxxxxxx'  ,'xxxxxxxx'),
  ('55332211004'  ,'xxxxxxxx'  ,'xxxxxxxx'  ,'xxxxxxxx'  ,'xxxxxxxx'  ,'xxxxxxxx'),
  ('55332211005'  ,'xxxxxxxx'  ,'xxxxxxxx'  ,'xxxxxxxx'  ,'xxxxxxxx'  ,'xxxxxxxx')
  --学期表插入数据
 INSERT INTO tb_Term
  (No  ,Name  ,TeachingcalenderNo)  VALUES
  ('32202120221'   ,'2021-2022-1'   ,'20211'),
  ('32202120222'   ,'2021-2022-2'   ,'20211'),
  ('32202220231'   ,'2022-2023-1'   ,'20211'),
  ('32202220232'   ,'2022-2023-2'   ,'20211'),
  ('32202320241'   ,'2023-2024-1'   ,'20211'),
  ('32202320242'   ,'2023-2024-2'   ,'20211'),
  ('32202420251'   ,'2024-2025-1'   ,'20211'),
  ('32202420252'   ,'2024-2025-2'   ,'20211')
--教材表插入数据
INSERT INTO tb_Book
 (No ,Name ,Press ,Author ,Price ,Isbn) VALUES
 ('787302584219' ,'Java程序设计基础(第七版)' ,'清华大学出版社' ,'陈国军' ,'79.00' ,'978-7-302-584201-9'),
 ('787302584208' ,'程序设计基础(C语言版)'    ,'科学出版社'     ,'黄思先' ,'43.00' ,'978-7-03-0328994-6'),
 ('787302584200' ,'面向对象程序设计'         ,'清华大学出版社' ,'陈国军' ,'43.00' ,'978-7-03-0584201-7'),
  ('787304567211' ,'数据结构(C语言版)'       ,'清华大学出版社' ,'陈国军' ,'49.00' ,'978-7-03-0328994-7'),
  ('787304566501' ,'数据库系统概论'          ,'高等教育出版社' ,'王珊'   ,'39.60' ,'978-7-04-0428994-9'),
  ('787302584210' ,'程序设计指导(C语言版)'   ,'科学出版社'     ,'黄思先' ,'43.00' ,'978-7-03-0328994-0')
--教学任务表插入数据
INSERT INTO tb_TeachingTask
  (No  ,TermNo  ,FacultyNo  ,CourseNo  ,BookNo)  VALUES
  ('77889911001'  ,'32202120221'  ,'1110707001'  ,'44001'  ,'787302584219'),
  ('77889911002'  ,'32202120222'  ,'1110707002'  ,'44002'  ,'787302584208'),
  ('77889911003'  ,'32202120221'  ,'1110707002'  ,'44003'  ,'787302584219'),
  ('77889911004'  ,'32202120222'  ,'1110707001'  ,'44004'  ,'787302584219'),
  ('77889911005'  ,'32202120221'  ,'1110707003'  ,'44005'  ,'787302584219')
--学生成绩表插入数据
INSERT INTO tb_StudentScore
  (StudentNo  ,TeachingTaskNo  ,BookOrderFlag  ,BasicScore  ,FinalScore  ,TotalScore  ,FacultyScore  ,LastModifyTime  ,TypeNo  ,AttributeNo) VALUES
  ('3210707001' ,'77889911001'  ,'1'  ,'80'  ,'80'  ,'87'  ,'85'  ,'2022-1-6'  ,'1201'  ,'1101'),
  ('3210707002' ,'77889911002'  ,'1'  ,'90 ' ,'90'  ,'90'  ,'85'  ,'2022-1-6'  ,'1201'  ,'1101'),
  ('3210707003' ,'77889911003'  ,'1'  ,'80'  ,'80'  ,'80'  ,'85'  ,'2022-1-6'  ,'1201'  ,'1101'),
  ('3210707004' ,'77889911004'  ,'1'  ,'80'  ,'80'  ,'80'  ,'85'  ,'2022-1-6'  ,'1201'  ,'1101'),
  ('3210707005' ,'77889911005'  ,'1'  ,'90'  ,'90'  ,'90'  ,'90'  ,'2022-1-6'  ,'1201'  ,'1101')
  --社会考试报名
  INSERT INTO tb_SocialExam
  (No,Name,ExamType,ExamTime,Score,StudentNo)
  VALUES('5001','数据库工程师中级考试','软考','2021-11-5',95,'3210707001'),
  ('5002','网络工程师中级考试','软考','2021-11-6',92.1,'3210707002'),
  ('5003','系统工程师中级考试','软考','2021-11-7',85,'3210707003'),
  ('5004','数据库工程师高级考试','软考','2021-11-7',98,'3210707004'),
  ('5005','系统工程师高级考试','软考','2021-11-7',85,'3210707005')
--实习
  INSERT INTO tb_Trainee
  (No,Name,Details,Place,Lengths)
  VALUES
  ('25001','集中实习1','xxx','省三院','7周'),
  ('25002','集中实习2','xxx','厦门市中医院','7周'),
  ('25003','集中实习3','xxx','泉州市中医院','7周'),
  ('25004','集中实习4','xxx','闽侯县中医院','7周'),
  ('25005','集中实习5','xxx','漳州市中医院','7周')
--公告
INSERT INTO tb_Board
(No,Title,Type,SenderNo,Time,Content) VALUES
	('1001','英语四级考试','考试','1110707001','2021-06-06','xxxxxxxx'),
	('1002','英语六级级考试','考试','1110707001','2021-06-06','xxxxxxxx'),
	('1003','普通话考试','考试','1110707001','2021-06-06','xxxxxxxx'),
	('1004','数据库工程师考试','考试','1110707001','2021-06-06','xxxxxxxx'),
	('1005','系统工程师考试','考试','1110707001','2021-06-06','xxxxxxxx')
--留言
INSERT INTO tb_Message
	(No,Title,Type,SenderNo,Time,Content,Readed,RecipientNo) VALUES
	('1001','英语四级考试','考试','1110707001','2021-06-06','xxxxxxxx',0,3210707001),
	('1002','英语六级级考试','考试','1110707001','2021-06-06','xxxxxxxx',0,3210707001),
	('1003','普通话考试','考试','1110707001','2021-06-06','xxxxxxxx',0,3210707001),
	('1004','数据库工程师考试','考试','1110707001','2021-06-06','xxxxxxxx',0,3210707001),
	('1005','系统工程师考试','考试','1110707001','2021-06-06','xxxxxxxx',0,3210707001),
	('1006','邀请','邀请','3210707002','2021-06-06','一起出去玩吗？',0,3210707001)
--学生
INSERT INTO tb_Student
(No ,Name ,PassWord ,Gender ,ClassNo )  VALUES
  ('3210707015'  ,'官祥杰'  ,HASHBYTES('MD5','1')  ,'0'  ,'32101')
--教学任务
INSERT INTO tb_TeachingTask
  (No
  ,TermNo
  ,FacultyNo
  ,CourseNo
  ,BookNo)
  VALUES
  ('77889911006' ,'32202120221'  ,'1110707002'  ,'44002' ,'787302584219'),
  ('77889911007' ,'32202120221'  ,'1110707003'  ,'44003' ,'787302584219'),
  ('77889911008' ,'32202120221'  ,'1110707004'  ,'44004'  ,'787302584219'),
  ('77889911009' ,'32202120221'  ,'1110707005'  ,'44005'  ,'787302584219')

    --学生成绩表插入数据
INSERT INTO tb_StudentScore
  (StudentNo,TeachingTaskNo ,BookOrderFlag ,BasicScore ,FinalScore  ,TotalScore  ,FacultyScore  ,LastModifyTime  ,TypeNo ,AttributeNo)
  VALUES 
	('3210707001'  ,'77889911006' ,'1' ,'85' ,'85' ,'85'  ,'85'  ,'2022-1-6'  ,'1201'  ,'1101'),
	('3210707001'  ,'77889911007' ,'1' ,'90' ,'90' ,'90'  ,'85'  ,'2022-1-6'  ,'1201'  ,'1101'),
    ('3210707001'  ,'77889911008' ,'1' ,'89' ,'89' ,'89'  ,'85'  ,'2022-1-6'  ,'1201'  ,'1101'),
    ('3210707001'  ,'77889911009' ,'1' ,'95' ,'99' ,'97'  ,'85'  ,'2022-1-6'  ,'1201'  ,'1101')

--培养方案插入数据
INSERT INTO tb_Trainingprogram
	(No,TeachingTaskNo,TraineeNo,MajorNo)
	VALUES
	('21001','77889911001','25001','2101'),
	('21002','77889911002','25001','2101'),
	('21003','77889911003','25001','2101'),
	('21004','77889911004','25001','2101'),
	('21005','77889911005','25001','2101')
--选修建表
IF OBJECT_ID('tb_SelectCourse') IS NOT NULL
	DROP TABLE tb_SelectCourse
	GO
	CREATE TABLE tb_SelectCourse
	(No  
		CHAR(4)
			NOT NULL 
		CONSTRAINT pk_SelctCourse_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_SelctCourse_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	MajorNo  
		CHAR(4)
			 NULL 
			CONSTRAINT fk_SelctCourse_MajorNo 
			FOREIGN KEY(MajorNo)
			REFERENCES  tb_Major(No)
		CONSTRAINT ck_SelctCourse_MajorNo 
			CHECK(MajorNo LIKE'[0-9][0-9][0-9][0-9]'),	
	TeachingTaskNo
		CHAR(11)
			NOT NULL
		CONSTRAINT fk_SelctCourse_TeachingTaskNo
			FOREIGN KEY(TeachingTaskNo)
			REFERENCES tb_TeachingTask(No) 
		CONSTRAINT ck_SelctCourse_TeachingTaskNo
				CHECK(TeachingTaskNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Numbers
		int 
			NULL,
	StartTime
		DATETIME
			NULL,
	EndTime
		DATETIME
			NULL,
			)
--已选修建表
IF OBJECT_ID('tb_SelectedCourse') IS NOT NULL
	DROP TABLE tb_SelectedCourse
	GO
	CREATE TABLE tb_SelectedCourse
	(
	StudentNo  
		CHAR(10)
			 NULL 
			CONSTRAINT fk_SelctedCourse_StudentNo  
			FOREIGN KEY(StudentNo)
			REFERENCES  tb_Student(No)
		CONSTRAINT ck_SelctedCourse_StudentNo 
			CHECK(StudentNo  LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),	
	SelectCourseNo
		CHAR(4)
			NOT NULL
		CONSTRAINT fk_SelctedCourse_SelectCourseNo
			FOREIGN KEY(SelectCourseNo)
			REFERENCES tb_SelectCourse(No) 
		CONSTRAINT ck_SelctedCourse_SelectCourseNo
				CHECK(SelectCourseNo LIKE'[0-9][0-9][0-9][0-9]'),
			)
--课程
  INSERT INTO tb_Course
  (No ,Name  ,PerCourseNo  ,Credit  ,Length  ,StudyTypeNo  ,ExamTypeNo  ,ClassroomNo  ,Examwhether )
  VALUES   ('44006' ,'C++程序设计'          ,'44001'  ,4.5  ,64  ,'2201'  ,'2302'  ,'1102'  ,'1'),
           ('44007'  ,'游戏疫情原理与应用'  ,'44005'  ,4.5  ,72  ,'2201'  ,'2302'  ,'1101'  ,'1'),
		   ('44008'  ,'算法设计与分析'      ,'44006'  ,4.5  ,72  ,'2201'  ,'2302'  ,'1101'  ,'1'),
		   ('44009'  ,'神经网络与深度学习'  ,'44008'  ,4.5  ,72  ,'2201'  ,'2302'  ,'1101'  ,'1'),
		   ('44015'  ,'中医皮肤美容'  ,'44009'  ,2 ,32  ,'2202'  ,'2303'  ,'1101'  ,'1')
  INSERT INTO tb_Course
  (No ,Name  ,PerCourseNo  ,Credit  ,Length  ,StudyTypeNo  ,ExamTypeNo  ,ClassroomNo  ,Examwhether )
   VALUES
		   ('44010'  ,'Java程序设计'        ,'44001'  ,4.5  ,72  ,'2201'  ,'2301'  ,'1101'  ,'1')
--教学任务表插入数据
INSERT INTO tb_TeachingTask
  (No  ,TermNo ,FacultyNo  ,CourseNo )
  VALUES  ('77889911011'  ,'32202120221'  ,'1110707002'  ,'44006' ),
          ('77889911012'  ,'32202120221'  ,'1110707001'  ,'44007' ),
		  ('77889911013'  ,'32202120221'  ,'1110707003'  ,'44008' ),
		  ('77889911015'  ,'32202120221'  ,'1110707003'  ,'44015' ),
		  ('77889911010'  ,'32202120221'  ,'1110707002'  ,'44009' )
INSERT INTO tb_TeachingTask
  (No  ,TermNo ,FacultyNo  ,CourseNo)
  VALUES  ('77889911014'  ,'32202120222'  ,'1110707002'  ,'44010' )
--培养方案插入数据

INSERT INTO tb_Trainingprogram
	(No,TeachingTaskNo,TraineeNo,MajorNo)
	VALUES
	('21006','77889911014','25001','2101')
--选课
INSERT INTO tb_SelectCourse
	(No,MajorNo,TeachingTaskNo,EndTime,StartTime,Numbers) VALUES
	('2201','2101','77889911011','2023-6-2 12:00','2022-11-15 12:00',2),
	('2202','2101','77889911012','2023-6-2 12:00','2022-11-15 12:00',1),
	('2203','2101','77889911013','2023-6-2 12:00','2022-11-15 12:00',3),
	('2204','2101','77889911010','2023-6-2 12:00','2022-11-15 12:00',4)

	INSERT INTO tb_SelectedCourse (SelectCourseNo,StudentNo) VALUES('2202','3210707002')
--学生成绩
INSERT INTO tb_StudentScore
  (StudentNo  ,TeachingTaskNo  ,BookOrderFlag ,BasicScore  ,FinalScore  ,TotalScore  ,FacultyScore  ,LastModifyTime  ,TypeNo ,AttributeNo)
  VALUES
  ('3210707001' ,'77889911014'  ,'0' , '95' ,'99' ,'97'  ,'85'  ,'2022-1-6'  ,'1201'  ,'1101')
  --考试建表
  IF OBJECT_ID('tb_Exam') IS NOT NULL
  DROP TABLE tb_Exam
  GO
  CREATE TABLE tb_Exam
  (No  
		CHAR(4)
			NOT NULL 
		CONSTRAINT pk_Eaxm_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_Exam_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	Time
		VARCHAR(50)
			NOT NULL,
	ExamTypes
		VARCHAR(20)
			NOT NULL,
	TeachingTaskNo
		CHAR(11)
			NOT NULL
		CONSTRAINT fk_Exam_TeachingTaskNo
			FOREIGN KEY(TeachingTaskNo)
			REFERENCES tb_TeachingTask(No) 
		CONSTRAINT ck_Exam_TeachingTaskNo
				CHECK(TeachingTaskNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	ClassroomNo
		CHAR(4)
			NOT NULL
		CONSTRAINT fk_Exam_ClassroomNo
			FOREIGN KEY(ClassroomNo)
			REFERENCES tb_Classroom(No) 
		CONSTRAINT ck_Exam_ClassroomNo
				CHECK(ClassroomNo LIKE'[0-9][0-9][0-9][0-9]')

			)
INSERT INTO tb_Exam(No,Time,ExamTypes,TeachingTaskNo,ClassroomNo)VALUES
					('1001','2022-12-15 9:00-11:00','期末','77889911001','1101'),
					('1002','2022-12-16 9:00-11:00','期末','77889911002','1101'),
					('1003','2022-12-17 9:00-11:00','期末','77889911003','1101'),
					('1004','2022-12-18 9:00-11:00','期末','77889911004','1101'),
					('1005','2022-12-19 9:00-11:00','期末','77889911005','1101')
IF OBJECT_ID('tb_ClassroomStatus') IS NOT NULL
	DROP TABLE tb_ClassroomStatus
	GO
	CREATE TABLE tb_ClassroomStatus
	(No  
		CHAR(4)
			NOT NULL 
		CONSTRAINT pk_ClassroomStatus_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_ClassroomStatus_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	Name
		VARCHAR(50)
	)
--教室使用
IF OBJECT_ID('tb_ClassroomUse') IS NOT NULL
	DROP TABLE tb_ClassroomUse
	GO
	CREATE TABLE tb_ClassroomUse
	(No  
		CHAR(8)
			NOT NULL 
		CONSTRAINT pk_ClassroomUse_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_ClassroomUse_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	ClassroomNo
		CHAR(4)
			NOT NULL 
		CONSTRAINT fk_ClassroomUse_ClassroomNo
			FOREIGN KEY(ClassroomNo)
			REFERENCES tb_Classroom(No)
		CONSTRAINT ck_ClassroomUse_ClassroomNo
			CHECK(ClassroomNo LIKE'[0-9][0-9][0-9][0-9]'),
	StatusNo
		CHAR(4)
			NOT NULL 
		CONSTRAINT fk_ClassroomUse_StatusNo
			FOREIGN KEY(StatusNo)
			REFERENCES tb_ClassroomStatus(No)
		CONSTRAINT ck_ClassroomUse_StatusNo
			CHECK(StatusNo LIKE'[0-9][0-9][0-9][0-9]'),
	TeachingTaskNo
		CHAR(11)
			 NULL
		CONSTRAINT fk_ClassroomUse_TeachingTaskNo
			FOREIGN KEY(TeachingTaskNo)
			REFERENCES tb_TeachingTask(No) 
		CONSTRAINT ck_ClassroomUse_TeachingTaskNo
				CHECK(TeachingTaskNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	 StudentNo  
		CHAR(10)
			 NULL 
			CONSTRAINT fk_ClassroomUse_StudentNo 
			FOREIGN KEY(StudentNo)
			REFERENCES  tb_Student(No)
		CONSTRAINT ck_ClassroomUse_StudentNo 
			CHECK(StudentNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

	)
INSERT INTO tb_ClassroomStatus (No,Name)VALUES
		('1001','正常上课'),
		('1002','借用'),
		('1003','考试'),
		('1004','锁定'),
		('1005','临时调课')

INSERT INTO tb_ClassroomUse (No,ClassroomNo,StatusNo,TeachingTaskNo)VALUES
							('22101101','1101','1001','77889911001'),
							('22101102','1101','1001','77889911001'),
							('22101103','1101','1001','77889911001'),
							('22101104','1101','1001','77889911002'),
							('22101105','1101','1001','77889911002'),
							('22101201','1101','1001','77889911001'),
							('22101202','1101','1001','77889911001'),
							('22101203','1101','1001','77889911001'),
							('22101204','1101','1001','77889911002'),
							('22101205','1101','1001','77889911002'),
							('22101301','1101','1001','77889911001'),
							('22101302','1101','1001','77889911001'),
							('22101303','1101','1001','77889911001'),
							('22101304','1101','1001','77889911002'),
							('22101305','1101','1001','77889911002')
--教室借用
IF OBJECT_ID('tb_Classroomborrow') IS NOT NULL
	DROP TABLE tb_Classroomborrow
	GO
	CREATE TABLE tb_Classroomborrow
	(No  
		CHAR(8)
			NOT NULL,
	ClassroomNo
		CHAR(4)
			NOT NULL 
		CONSTRAINT fk_Classroomborrow_ClassroomNo
			FOREIGN KEY(ClassroomNo)
			REFERENCES tb_Classroom(No)
		CONSTRAINT ck_Classroomborrow_ClassroomNo
			CHECK(ClassroomNo LIKE'[0-9][0-9][0-9][0-9]'),
	 StudentNo  
		CHAR(10)
			NOT NULL 
			CONSTRAINT fk_Classroomborrow_StudentNo 
			FOREIGN KEY(StudentNo)
			REFERENCES  tb_Student(No)
		CONSTRAINT ck_Classroomborrow_StudentNo 
			CHECK(StudentNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

	)
--评教
IF OBJECT_ID('tb_Evaluate') IS NOT NULL
	DROP TABLE tb_Evaluate
	GO
	CREATE TABLE tb_Evaluate
	(No  
		CHAR(4)
			NOT NULL 
		CONSTRAINT pk_Evaluate_No 
			PRIMARY KEY(No) 
		CONSTRAINT ck_Evaluate_No 
			CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
		TeachingTaskNo
		CHAR(11)
			 NULL
		CONSTRAINT fk_Evaluate_TeachingTaskNo
			FOREIGN KEY(TeachingTaskNo)
			REFERENCES tb_TeachingTask(No) 
		CONSTRAINT ck_Evaluate_TeachingTaskNo
				CHECK(TeachingTaskNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Type
		VARCHAR(20)
			NULL,
	Times
		INT
			NULL,
	StartTime
		DATETIME
			NULL,
	EndTime
		DATETIME
			NULL,)
INSERT INTO tb_Evaluate
	(No,TeachingTaskNo,EndTime,StartTime) VALUES
	('2201','77889911001','2023-6-2 12:00','2022-11-15 12:00'),
	('2202','77889911002','2023-6-2 12:00','2022-11-15 12:00'),
	('2203','77889911003','2023-6-2 12:00','2022-11-15 12:00'),
	('2204','77889911004','2023-6-2 12:00','2022-11-15 12:00'),
	('2205','77889911005','2023-6-2 12:00','2022-11-15 12:00'),
	('2206','77889911006','2023-6-2 12:00','2022-11-15 12:00'),
	('2207','77889911007','2023-6-2 12:00','2022-11-15 12:00'),
	('2208','77889911008','2023-6-2 12:00','2022-11-15 12:00'),
	('2209','77889911009','2023-6-2 12:00','2022-11-15 12:00'),
	('2210','77889911014','2023-6-2 12:00','2022-11-15 12:00')
--实验类型
IF OBJECT_ID('tb_ExperimentType') IS NOT NULL
	DROP TABLE tb_ExperimentType
	GO
	CREATE TABLE tb_ExperimentType
	(No
		CHAR(4)
				NOT NULL 
			CONSTRAINT pk_tb_ExperimentType_No 
				PRIMARY KEY(No) 
			CONSTRAINT ck_tb_ExperimentType_No 
				CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	Name
		VARCHAR(50)
			NOT NULL)
--实验类型
			INSERT INTO tb_ExperimentType(No,Name)VALUES
			('1001','形态学技术'),('1002','动物实验'),('1003','细胞培养'),('1004',' 生物学技术'),('1005','组织工程技术')
--实验室
IF OBJECT_ID('tb_Lab') IS NOT NULL
	DROP TABLE tb_Lab
	GO
	CREATE TABLE tb_Lab
	(No
		CHAR(4)
				NOT NULL 
			CONSTRAINT pk_tb_Lab_No 
				PRIMARY KEY(No) 
			CONSTRAINT ck_tb_Lab_No 
				CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	Name
		VARCHAR(50)
			NOT NULL)
--实验室表插入数据
	INSERT INTO tb_Lab (No,Name) VALUES
	('1001','无机化学实验室'),('1002','有机化学实验室'),('1003','康复实验室'),('1004','中药研究实验室'),('1005','细胞研究实验室'),('1006','成像研究实验室')
--实验
IF OBJECT_ID('tb_Experiment') IS NOT NULL
	DROP TABLE tb_Experiment
	GO
	CREATE TABLE tb_Experiment
	(No
		CHAR(4)
				NOT NULL 
			CONSTRAINT pk_tb_Experiment_No 
				PRIMARY KEY(No) 
			CONSTRAINT ck_tb_Experiment_No 
				CHECK(No LIKE'[0-9][0-9][0-9][0-9]'),
	Name
		VARCHAR(50)
			NOT NULL,
	Length
		INT
			NOT NULL,
	TypeNo
		CHAR(4)
			NOT NULL 
			CONSTRAINT fk_Experiment_TypeNo 
			FOREIGN KEY(TypeNo)
			REFERENCES  tb_ExperimentType(No)
		CONSTRAINT ck_Experiment_TypeNo
			CHECK(TypeNo LIKE'[0-9][0-9][0-9][0-9]'),
	LabNo
		CHAR(4)
			NOT NULL 
		CONSTRAINT fk_Experiment_LabNo
			FOREIGN KEY(LabNo)
			REFERENCES tb_Lab(No)
		CONSTRAINT ck_Experiment_LabNo
			CHECK(LabNo LIKE'[0-9][0-9][0-9][0-9]'),
	TermNo
		CHAR(11)
			NOT NULL
		CONSTRAINT fk_Experiment_TermNo
			FOREIGN KEY(TermNo)
			REFERENCES tb_Term(No) 
		CONSTRAINT ck_Experiment_TermNo
				CHECK(TermNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	 FacultyNo  
		CHAR(10)
			NOT NULL 
			CONSTRAINT fk_Experiment_FacultyNo 
			FOREIGN KEY(FacultyNo)
			REFERENCES  tb_Faculty(No)
		CONSTRAINT ck_Experiment_FacultyNo 
			CHECK(FacultyNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

	)
--实验插入数据
INSERT INTO tb_Experiment (No,Name,TypeNo,LabNo,Length,FacultyNo,TermNo)VALUES
	('1001','关于番茄素对细胞活性的研究'            ,'1003','1005','128','1110707006','32202120221'),
	('1002','医学图像分割与可视化研究'              ,'1001','1006','128','1110707006','32202120222'),
	('1003','象思维及其在中医学中的应用研究'        ,'1001','1006','128','1110707006','32202120221'),
	('1004','中医气功安眠导引法干预失眠的临床研究'  ,'1001','1003','128','1110707006','32202120222'),
	('1005','膝三针配合易罐治疗膝骨关节炎的临床研究','1005','1003','128','1110707006','32202120221')
--实验预约
IF OBJECT_ID('tb_ExperimentSd') IS NOT NULL
	DROP TABLE tb_ExperimentSd
	GO
	CREATE TABLE tb_ExperimentSd
	(
	ExperimentNo
		CHAR(4)
			NOT NULL 
		CONSTRAINT fk_ExperimentSd_LabNo
			FOREIGN KEY(ExperimentNo)
			REFERENCES tb_Experiment(No)
		CONSTRAINT ck_ExperimentSd_ExperimentNo
			CHECK(ExperimentNo LIKE'[0-9][0-9][0-9][0-9]'),
	 StudentNo  
		CHAR(10)
			NOT NULL 
			CONSTRAINT fk_ExperimentSd_StudentNo 
			FOREIGN KEY(StudentNo)
			REFERENCES  tb_Student(No)
		CONSTRAINT ck_ExperimentSd_StudentNo 
			CHECK(StudentNo LIKE'[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')

	)
	--创建非对称密钥										
	IF ASYMKEY_ID('ak_EduJW_ForSymKeyCrypto') IS NOT NULL										
		DROP ASYMMETRIC KEY ak_EduJW_ForSymKeyCrypto;									
	GO										
	CREATE ASYMMETRIC KEY ak_EduJW_ForSymKeyCrypto										
		WITH 									
			ALGORITHM=RSA_2048								
			ENCRYPTION BY PASSWORD='1qaz@WSX';								
											

--创建对称密钥
	IF KEY_ID('sk_EduJW_ForDataCrypto') IS NOT NULL										
		DROP SYMMETRIC KEY sk_EduJW_ForDataCrypto;									
	GO										
	CREATE SYMMETRIC KEY sk_EduJW_ForDataCrypto										
		WITH 									
			ALGORITHM=AES_128								
			ENCRYPTION BY ASYMMETRIC KEY ak_EduJW_ForSymKeyCrypto;		

	OPEN SYMMETRIC KEY sk_EduJW_ForDataCrypto												
		DECRYPTION BY ASYMMETRIC KEY ak_EduJW_ForSymKeyCrypto											
			WITH PASSWORD='1qaz@WSX';										
	UPDATE tb_Student												
		SET											
			Securityissue='My university is?'										
			,Answer=ENCRYPTBYKEY(KEY_GUID('sk_EduJW_ForDataCrypto'),'FJTCM')
			,Securityissue2='My Like is?'										
			,Answer2=ENCRYPTBYKEY(KEY_GUID('sk_EduJW_ForDataCrypto'),'Eat')											
	CLOSE SYMMETRIC KEY sk_EduJW_ForDataCrypto;												
--成绩视图
DROP VIEW  ScoreView;
CREATE VIEW ScoreView
AS SELECT StudentNo, Te.TeachingcalenderNo AS '学期',C.No AS '课程编号',C.Name AS '课程名称',s.FinalScore AS '成绩',
                 C.Length AS '时长',C.Credit AS '学分',ET.Name AS '类型',EA.Name AS '属性'
                FROM tb_StudentScore AS S 
                 JOIN tb_TeachingTask AS T ON S.TeachingTaskNo=T.No
                 JOIN tb_ExameAttribute AS EA ON S.AttributeNo=EA.No
                JOIN tb_ExameType AS ET ON S.TypeNo=ET.No
                 JOIN tb_Term AS Te ON Te.No=T.TermNo
                JOIN tb_Course AS C ON C.No=T.CourseNo ;
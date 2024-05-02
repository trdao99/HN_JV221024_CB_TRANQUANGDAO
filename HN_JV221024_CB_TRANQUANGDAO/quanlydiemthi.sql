DROP DATABASE IF EXISTS QUANLYDIEMTHI;
create database QUANLYDIEMTHI;
use QUANLYDIEMTHI;
create table STUDENT
(
    studentID   varchar(4) primary key not null,
    studentName varchar(100)           not null,
    birthday    date                   not null,
    gender      bit(1),
    address     text,
    phoneNumber varchar(45)
);
create table SUBJECT
(
    subjectID   varchar(4) primary key not null,
    subjectName varchar(45)            not null,
    priority    int(11)                not null
);
create table MARK
(
    subjectID varchar(4) not null,
    studentID varchar(4) not null,
    point     float(11),
    foreign key (subjectID) references SUBJECT (subjectID),
    foreign key (studentID) references STUDENT (studentID)
);

insert into student(studentID, studentName, birthday, gender, address, phoneNumber) value
    ('S001', 'Nguyễn Thế Anh', '1999-01-11', 1, 'Hà Nội', 984678082),
    ('S002', 'Đặng Bảo Trâm', '1998-12-22', 0, 'Lào Cai', 904982654),
    ('S003', 'Trần Hà Phương', '2000-05-05', 0, 'Nghệ An', 947645363),
    ('S004', 'Đỗ Tiến Mạnh', '1999-03-26', 1, 'Hà Nội', 983665353),
    ('S005', 'Phạm Duy Nhất', '1998-10-04', 1, 'Tuyên Quang', 987242678),
    ('S006', 'Mai Văn Thái', '2002-06-22', 1, 'Nam Định', 982654268),
    ('S007', 'Giang Gia Hân', '1996-11-10', 0, 'Phú Thọ', 982364753),
    ('S008', 'Nguyễn Ngọc Bảo My', '1999-01-22', 0, 'Hà Nam', 927867453),
    ('S009', 'Nguyễn Tiến Đạt', '1998-08-07', 1, 'Tuyên Quang', 989274673),
    ('S010', 'Nguyễn Thiều Quang', '2000-09-18', 1, 'Hà Nội', 984378291);

insert into subject(subjectID, subjectName, priority) value
    ('MH01', 'Toán', 2),
    ('MH02', 'Vật Lý', 2),
    ('MH03', 'Hóa Học', 1),
    ('MH04', 'Ngữ Văn', 1),
    ('MH05', 'Tiếng Anh', 2);

insert into MARK(studentID, subjectId, point)
values ('S001', 'MH01', 8.5),
       ('S001', 'MH02', 7),
       ('S001', 'MH03', 9),
       ('S001', 'MH04', 9),
       ('S001', 'MH05', 5),
       ('S002', 'MH01', 9),
       ('S002', 'MH02', 8),
       ('S002', 'MH03', 6.5),
       ('S002', 'MH04', 8),
       ('S002', 'MH05', 6),
       ('S003', 'MH01', 7.5),
       ('S003', 'MH02', 6.5),
       ('S003', 'MH03', 8),
       ('S003', 'MH04', 7),
       ('S003', 'MH05', 7),
       ('S004', 'MH01', 6),
       ('S004', 'MH02', 7),
       ('S004', 'MH03', 5),
       ('S004', 'MH04', 6.5),
       ('S004', 'MH05', 8),
       ('S005', 'MH01', 5.5),
       ('S005', 'MH02', 8),
       ('S005', 'MH03', 7.5),
       ('S005', 'MH04', 8.5),
       ('S005', 'MH05', 9),
       ('S006', 'MH01', 8),
       ('S006', 'MH02', 10),
       ('S006', 'MH03', 9),
       ('S006', 'MH04', 7.5),
       ('S006', 'MH05', 6.5),
       ('S007', 'MH01', 9.5),
       ('S007', 'MH02', 9),
       ('S007', 'MH03', 6),
       ('S007', 'MH04', 9),
       ('S007', 'MH05', 4),
       ('S008', 'MH01', 10),
       ('S008', 'MH02', 8.5),
       ('S008', 'MH03', 8.5),
       ('S008', 'MH04', 6),
       ('S008', 'MH05', 9.5),
       ('S009', 'MH01', 7.5),
       ('S009', 'MH02', 7),
       ('S009', 'MH03', 9),
       ('S009', 'MH04', 5),
       ('S009', 'MH05', 10),
       ('S010', 'MH01', 6.5),
       ('S010', 'MH02', 8),
       ('S010', 'MH03', 5.5),
       ('S010', 'MH04', 4),
       ('S010', 'MH05', 7);

#2. Cập nhật dữ liệu
update STUDENT
set studentName = ' Đỗ Đức Mạnh'
where studentID = 'S004';

UPDATE SUBJECT
SET subjectName = 'Ngoại Ngữ',
    priority    = 1
WHERE subjectID = 'MH05';

UPDATE mark
SET point = CASE subjectID
                WHEN 'MH01' THEN 8.5
                WHEN 'MH02' THEN 7
                WHEN 'MH03' THEN 5.5
                WHEN 'MH04' THEN 6
                WHEN 'MH05' THEN 9
    END
WHERE studentID = 'S009';

#3. Xoá dữ liệu
DELETE
FROM mark
WHERE studentID = 'S010';
DELETE
FROM student
WHERE studentID = 'S010';

#Bài 3:
# Lấy ra tất cả thông tin của sinh viên trong bảng Student .
select *
from student;
# Hiển thị tên và mã môn học của những môn có hệ số bằng 1.
select subjectName, subjectID
from subject
where priority = 1;
# Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ
# năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh
select studentID, studentName, timestampdiff(year, birthday, curdate()) tuổi, if(gender = 1, 'Nam', 'Nữ')
from student;
# Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn
# Toán và sắp xếp theo điểm giảm dần.
select studentName, subjectName, point
from student
         join MARK M on student.studentID = M.studentID
         join SUBJECT S on M.subjectID = S.subjectID
where M.subjectID = 'MH01'
order by point desc;
# Thống kê số lượng học sinh theo giới tính ở trong bảng
select if(gender = 1, 'Nam', 'Nữ') 'Giới Tính', count(STUDENT.gender) 'Số Lượng'
from student
group by gender;

# Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm
# để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình.
select MARK.studentID, studentName, sum(point) 'tổng điểm', avg(point) 'điểm trung bình'
from mark
         join STUDENT S on S.studentID = mark.studentID
group by MARK.studentID;

# Bài 4: Tạo View, Index, Procedure
# Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học sinh, giới tính , quê quán .
create view STUDENT_VIEW as
select studentID, studentName, if(gender = 1, 'Nam', 'Nữ') 'Giới Tính', address
from student;
select *
from STUDENT_VIEW;
# Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,điểm trung bình các môn học
create view AVERAGE_MARK_VIEW as
select MARK.studentID, studentName, avg(point)
from mark
         join STUDENT S on S.studentID = mark.studentID
group by MARK.studentID;
select *
from AVERAGE_MARK_VIEW;
# Đánh Index cho trường `phoneNumber` của bảng STUDENT
ALTER TABLE STUDENT
    ADD INDEX idx_phoneNumber (phoneNumber);
# Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả thông tin học sinh đó.
delimiter //
create procedure PROC_INSERTSTUDENT(studentID_IN varchar(4),
                                    studentName_IN varchar(100),
                                    birthday_IN date,
                                    gender_IN bit(1),
                                    address_IN text,
                                    phoneNumber_IN varchar(45))
begin
    insert into student(studentID, studentName, birthday, gender, address, phoneNumber) value
        (studentID_IN,
         studentName_IN,
         birthday_IN,
         gender_IN,
         address_IN,
         phoneNumber_IN);
end
//

# Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.
delimiter //
create procedure PROC_UPDATESUBJECT(subjectID_IN varchar(4), subjectName_IN varchar(45))
begin
    update SUBJECT set subjectName = subjectName_IN where subjectID = subjectID_IN;
end //
# Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học sinh.
delimiter //
create procedure PROC_DELETEMARK(subjectID_IN varchar(4))
begin
    delete from MARK where subjectID = subjectID_IN;
end //




create database Quan_ly_diem_thi;
use Quan_ly_diem_thi;
create table Hoc_sinh(
Ma_HS varchar(20) primary key,
Ten_HS varchar(50),
Ngay_sinh datetime,
Lop varchar(20),
Gioi_tinh varchar(20)
);
create table Giao_vien(
Ma_GV varchar(20) primary key,
Ten_GV varchar(50),
SDT varchar(10)
);
create table Mon_hoc(
Ma_MH varchar(20) primary key,
Ten_mon_hoc varchar(50),
Ma_GV varchar(50),
foreign key(Ma_GV) references Giao_vien(Ma_GV)
);
create table Bang_diem(
Ma_HS varchar(20),
Ma_MH varchar(20),
primary key(Ma_HS,Ma_MH),
foreign key(Ma_HS) references Hoc_sinh(Ma_HS),
foreign key(Ma_MH) references Mon_hoc(Ma_MH),
Diem_thi int,
Ngay_kiem_tra datetime
);
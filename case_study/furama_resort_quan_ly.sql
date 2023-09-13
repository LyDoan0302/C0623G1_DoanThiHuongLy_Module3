CREATE DATABASE furama_resort_quan_ly;
USE furama_resort_quan_ly;
CREATE TABLE bo_phan(
ma_bo_phan  INT         AUTO_INCREMENT PRIMARY KEY NOT NULL,
ten_bo_phan VARCHAR(45) NOT NULL
);
CREATE TABLE vi_tri(
ma_vi_tri  INT         AUTO_INCREMENT PRIMARY KEY NOT NULL,
ten_vi_tri VARCHAR(45) NOT NULL
);
CREATE TABLE trinh_do(
ma_trinh_do  INT         AUTO_INCREMENT PRIMARY KEY,
ten_trinh_do VARCHAR(45) NOT NULL
);
CREATE TABLE nhan_vien(
ma_nhan_vien  INT         AUTO_INCREMENT PRIMARY KEY,
ho_ten        VARCHAR(45) NOT NULL,
ngay_sinh     DATE        NOT NULL,
so_cmnd       VARCHAR(45) NOT NULL,
luong         DOUBLE      NOT NULL,
so_dien_thoai VARCHAR(45) NOT NULL,
email         VARCHAR(45),
dia_chi       VARCHAR(45),
ma_vi_tri     INT,
FOREIGN KEY(ma_vi_tri)   REFERENCES vi_tri(ma_vi_tri),
ma_trinh_do   INT,
FOREIGN KEY(ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
ma_bo_phan    INT,
FOREIGN KEY(ma_bo_phan)  REFERENCES bo_phan(ma_bo_phan)
);
CREATE TABLE loai_khach(
ma_loai_khach  INT       AUTO_INCREMENT PRIMARY KEY,
ten_loai_khach VARCHAR(45)
);
CREATE TABLE khach_hang(
ma_khach_hang INT         AUTO_INCREMENT PRIMARY KEY,
ho_ten        VARCHAR(45) NOT NULL,
ngay_sinh     DATE        NOT NULL,
gioi_tinh     BIT(1)      NOT NULL,
so_cmnd       VARCHAR(45) NOT NULL,
so_dien_thoai VARCHAR(45) NOT NULL,
email         VARCHAR(45),
dia_chi       VARCHAR(45),
ma_loai_khach INT,
FOREIGN KEY(ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);
CREATE TABLE loai_dich_vu(
ma_loai_dich_vu  INT        AUTO_INCREMENT PRIMARY KEY,
ten_loai_dich_vu VARCHAR(45)
);
CREATE TABLE kieu_thue(
ma_kieu_thue  INT        AUTO_INCREMENT PRIMARY KEY,
ten_kieu_thue VARCHAR(45)
);
CREATE TABLE dich_vu(
ma_dich_vu              INT         AUTO_INCREMENT PRIMARY KEY,
ten_dich_vu             VARCHAR(45) NOT NULL,
dien_tich               INT         NOT NULL DEFAULT 10 CHECK(dien_tich >= 10),
chi_phi_thue            DOUBLE      NOT NULL,
so_nguoi_toi_da         INT         NOT NULL DEFAULT 1 CHECK(so_nguoi_toi_da >= 1),
tieu_chuan_phong        VARCHAR(45),
mo_ta_tien_nghi_khac    VARCHAR(45),
dien_tich_ho_boi        DOUBLE,
so_tang                 TINYINT,
dich_vu_mien_phi_di_kem TEXT,
ma_kieu_thue            INT,
FOREIGN KEY(ma_kieu_thue)    REFERENCES kieu_thue(ma_kieu_thue),
ma_loai_dich_vu INT,
FOREIGN KEY(ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);
CREATE TABLE hop_dong(
ma_hop_dong       INT      AUTO_INCREMENT PRIMARY KEY,
ngay_lam_hop_dong DATETIME NOT NULL,
ngay_ket_thuc     DATETIME NOT NULL,
tien_dat_coc      DOUBLE   NOT NULL,
ma_nhan_vien      INT,
FOREIGN KEY(ma_nhan_vien)  REFERENCES nhan_vien(ma_nhan_vien),
ma_khach_hang     INT,
FOREIGN KEY(ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
ma_dich_vu        INT,
FOREIGN KEY(ma_dich_vu)    REFERENCES dich_vu(ma_dich_vu)
);
CREATE TABLE dich_vu_di_kem(
ma_dich_vu_di_kem  INT         AUTO_INCREMENT PRIMARY KEY,
ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
gia                DOUBLE      NOT NULL,
don_vi             VARCHAR(10) NOT NULL,
trang_thai         VARCHAR(45)
);
CREATE TABLE hop_dong_chi_tiet(
ma_hop_dong_chi_tiet INT AUTO_INCREMENT PRIMARY KEY,
ma_hop_dong          INT,
FOREIGN KEY(ma_hop_dong)       REFERENCES hop_dong(ma_hop_dong),
ma_dich_vu_di_kem    INT,
FOREIGN KEY(ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);

INSERT INTO bo_phan (ma_bo_phan, ten_bo_phan)
VALUES (1,'sale marketing'), 
	   (2,'hanh chinh'), 
       (3,'phuc vu'), 
       (4,'quan ly');

INSERT INTO vi_tri(ma_vi_tri, ten_vi_tri)
VALUES (1,'le tan'),
       (2,'phuc vu'),
       (3,'chuyen vien'),
       (4,'giam sat'),
       (5,'quan ly'),
       (6,'giam doc');

INSERT INTO trinh_do(ma_trinh_do,ten_trinh_do)
VALUES (1,'trung cap'),
       (2,'cao dang'),
       (3,'dai hoc'),
       (4,'sau dai hoc');
 
INSERT INTO loai_dich_vu(ma_loai_dich_vu, ten_loai_dich_vu)
VALUES (1,'villa'),
       (2,'house'),
       (3,'room');

INSERT INTO dich_vu_di_kem(ma_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai)
VALUES (1,'massage', 300,'1','luon mo'),
       (2,'karaoke',300,'1','dong sau 23h'),
       (3,'thuc an',300,'1','khong phuc vu sau 22h'),
       (4,'thuc uong',300,'1','khong phuc vu sau 22h'),
       (5,'thue xe',300,'1','khong phuc vu sau 21h');

INSERT INTO kieu_thue(ma_kieu_thue, ten_kieu_thue)
VALUES (1,'nam'),
       (2,'thang'),
       (3,'ngay'),
       (4,'gio');

INSERT INTO loai_khach(ma_loai_khach, ten_loai_khach)
VALUES (1,'diamond'),
       (2,'platinium'),
	   (3,'gold'),
       (4,'silver'),
       (5,'member');
       
INSERT INTO nhan_vien (ma_nhan_vien,ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
VALUES (1,'Doan Ly','1989/02/03','233103393',2000,'0987654321','lydoan.kt@gmail','Da Nang',4,3,1),      
       (2,'Nguyen Ly','1989/02/03','233103393',2000,'0987654321','lydoan.kt@gmail','Da Nang',1,1,2),      
       (3,'Le Nam','1989/02/03','233103393',2000,'0987654321','lydoan.kt@gmail','Da Nang',2,3,3),      
       (4,'Pham Loan','1989/02/03','233103393',2000,'0987654321','lydoan.kt@gmail','Da Nang',3,2,2),      
       (5,'Van An','1989/02/03','233103393',2000,'0987654321','lydoan.kt@gmail','Da Nang',5,3,3),      
       (6,'Dao Van','1989/02/03','233103393',2000,'0987654321','lydoan.kt@gmail','Da Nang',6,4,4);    

INSERT INTO khach_hang(ma_khach_hang,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach)
VALUES (1,'Doan Huong Ly','1989/03/02',0,'099876543','0987667665', 'lyd@mail','My',1),        
	   (2,'Tran Van Huong','1999/03/02',1,'099876543','0987667665', 'huong@mail','Sai Gon',2),        
	   (3,'Tran Van An','1999/03/02',0,'099876543','0987667665', 'aaga@mail','Sai Gon',3),        
	   (4,'Nguyen Thanh','1999/03/02',1,'099876543','0987667665', 'adgadf@mail','Khanh Hoa',4),        
	   (5,'Dao Dinh Duy','1999/03/02',1,'099876543','0987667665', 'fgfgfdg@mail','Binh Dinh',5);       

INSERT INTO dich_vu
VALUES (1,'Villa huong bien',70,60000, 6,'luxury','wifi',12,2,null,1,1),                     
       (2,'Villa huong vuon',60,60000, 6,'luxury','wifi',12,2,null,1,1),                     
       (3,'House huong vuon',70,4000, 10,'standard','wifi',null,2,null,2,2),
       (4,'Room 1',34,900, 3,null,null,null,null,'breakfast',3,3),
       (5,'Room 2',34,300, 3,null,null,null,null,'tea',4,3);
       
INSERT INTO hop_dong
VALUES (1,'2022/02/14','2023/02/14',30000,1,1,1),      
       (2,'2023/03/04','2023/05/04',4000,1,3,3);     
       
INSERT INTO hop_dong_chi_tiet
VALUES (1,1,5),       
       (2,2,2); 
       
       

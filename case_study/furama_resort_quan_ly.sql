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
FOREIGN KEY(ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem),
so_luong             INT NOT NULL 
);
INSERT INTO vi_tri (ten_vi_tri)
VALUES
('Quản Lý'),
('Nhân Viên')
;

INSERT INTO trinh_do (ten_trinh_do)
VALUES
('Trung Cấp'),
('Cao Đẳng'),
('Đại Học'),
('Sau Đại Học')
;

INSERT INTO bo_phan (ten_bo_phan)
VALUES
('Sale-Marketing'),
('Hành chính'),
('Phục vụ'),
('Quản lý')
;

INSERT INTO nhan_vien (ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
VALUES
('Nguyễn Văn An', '1970-11-07', '456231786', '10000000', '0901234121', 'annguyen@gmail.com', '295 Nguyễn Tất Thành, Đà Nẵng', '1', '3', '1'),
('Lê Văn Bình', '1997-04-09', '654231234', '7000000', '0934212314', 'binhlv@gmail.com', '22 Yên Bái, Đà Nẵng', '1', '2', '2'), 
('Hồ Thị Yến', '1995-12-12', '999231723', '14000000', '0412352315', 'thiyen@gmail.com', 'K234/11 Điện Biên Phủ, Gia Lai', '1', '3', '2'), 
('Võ Công Toản', '1980-04-04', '123231365', '17000000', '0374443232', 'toan0404@gmail.com', '77 Hoàng Diệu, Quảng Trị', '1', '4', '4'), 
('Nguyễn Bỉnh Phát', '1999-12-09', '454363232', '6000000', '0902341231', 'phatphat@gmail.com', '43 Yên Bái, Đà Nẵng', '2', '1', '1'), 
('Khúc Nguyễn An Nghi', '2000-11-08', '964542311', '7000000', '0978653213', 'annghi20@gmail.com', '294 Nguyễn Tất Thành, Đà Nẵng', '2', '2', '3'), 
('Nguyễn Hữu Hà', '1993-01-01', '534323231', '8000000', '0941234553', 'nhh0101@gmail.com', '4 Nguyễn Chí Thanh, Huế', '2', '3', '2'), 
('Nguyễn Hà Đông', '1989-09-03', '234414123', '9000000', '0642123111', 'donghanguyen@gmail.com', '111 Hùng Vương, Hà Nội', '2', '4', '4'), 
('Tòng Hoang', '1982-09-03', '256781231', '6000000', '0245144444', 'hoangtong@gmail.com', '213 Hàm Nghi, Đà Nẵng', '2', '4', '4'), 
('Nguyễn Công Đạo', '1994-01-08', '755434343', '8000000', '0988767111','nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai','2','3','2');

INSERT INTO loai_khach (ten_loai_khach)
VALUES
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member')
;

INSERT INTO khach_hang (ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach)
VALUES 
('Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng', 5),
('Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị', 3),
('Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh', 1),
('Dương Văn Quan', '1981-07-08', 1, '543432111', '0490039241', 'duongquan@gmail.com', 'K453/12 Lê Lợi, Đà Nẵng', 1),
('Hoàng Trần Nhi Nhi', '1995-12-09', 0, '795453345', '0312345678', 'nhinhi123@gmail.com', '224 Lý Thái Tổ, Gia Lai', 4),
('Tôn Nữ Mộc Châu', '2005-12-06', 0, '732434215', '0988888844', 'tonnuchau@gmail.com', '37 Yên Thế, Đà Nẵng', 4),
('Nguyễn Mỹ Kim', '1984-04-08', 0, '856453123', '0912345698', 'kimcuong84@gmail.com', 'K123/45 Lê Lợi, Hồ Chí Minh', 1),
('Nguyễn Thị Hào', '1999-04-08', 0, '965656433', '0763212345', 'haohao99@gmail.com', '55 Nguyễn Văn Linh, Kon Tum', 3),
('Trần Đại Danh', '1994-07-01', 1, '432341235', '0643343433', 'danhhai99@gmail.com', '24 Lý Thường Kiệt, Quảng Ngãi', 1),
('Nguyễn Tâm Đắc', '1989-07-01', 1, '344343432', '0987654321', 'dactam@gmail.com', '22 Ngô Quyền, Đà Nẵng', 2);

INSERT INTO kieu_thue (ten_kieu_thue)
VALUES
('year'),
('month'),
('day'),
('hour')
;

INSERT INTO loai_dich_vu (ten_loai_dich_vu)
VALUES
('Villa'),
('House'),
('Room')
;

INSERT INTO dich_vu (ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, dich_vu_mien_phi_di_kem, ma_kieu_thue, ma_loai_dich_vu)
VALUES
('Villa Beach Front','25000','1000000','10','vip','Có hồ bơi','500','4',null,'3','1'),
('House Princess 01','14000','5000000','7','vip','Có thêm bếp nướng',null,'3',null,'2','2'),
('Room Twin 01','5000','1000000','2','normal','Có tivi',null,null,'1 Xe máy, 1 Xe đạp','4','3'),
('Villa No Beach Front','22000','9000000','8','normal','Có hồ bơi','300','3',null,'3','1'),
('House Princess 02','10000','4000000','5','normal','Có thêm bếp nướng',null,'2',null,'3','2'),
('Room Twin 02','3000','900000','2','normal','Có tivi',null,null,'1 Xe máy','4','3')
;

INSERT INTO dich_vu_di_kem (ten_dich_vu_di_kem, gia, don_vi, trang_thai)
VALUES
('Karaoke','10000','giờ','tiện nghi , hiện tại'),
('Thuê xe máy','10000','chiếc','hỏng 1 xe'),
('Thuê xe đạp','20000','chiếc','tốt'),
('Buffet buổi sáng','15000','suất','đầy đủ đồ ăn , tráng miệng'),
('Buffet buổi trưa','90000','suất','đầy đủ đồ ăn , tráng miệng'),
('Buffet buổi tối','16000','suất','đầy đủ đồ ăn , tráng miệng')
;

INSERT INTO hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
VALUES
('2020-12-08','2020-12-08','0','3','1','3'),
('2020-07-14','2020-07-21','200000','7','3','1'),
('2021-03-15','2021-03-17','50000','3','4','2'),
('2021-01-14','2021-01-18','100000','7','5','5'),
('2021-07-14','2021-07-15','0','7','2','6'),
('2021-06-01','2021-06-03','0','7','7','6'),
('2021-09-02','2021-09-05','100000','7','4','4'),
('2021-06-17','2021-06-18','150000','3','4','1'),
('2020-11-19','2020-11-19','0','3','4','3'),
('2021-04-12','2021-04-14','0','10','3','5'),
('2021-04-25','2021-04-25','0','2','2','1'),
('2021-05-25','2021-05-27','0','7','10','1')
;

INSERT INTO hop_dong_chi_tiet (so_luong, ma_hop_dong, ma_dich_vu_di_kem)
VALUES
('5','2','4'),
('8','2','5'),
('15','2','6'),
('1','3','1'),
('11','3','2'),
('1','1','3'),
('2','1','2'),
('2','12','2')
;
-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống 
-- có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT *
FROM nhan_vien 
WHERE (SUBSTRING_INDEX(ho_ten," ",-1) like 'H%'
	OR SUBSTRING_INDEX(ho_ten," ",-1) like 'T%'
	OR SUBSTRING_INDEX(ho_ten," ",-1) like 'K%')
	AND CHAR_LENGTH(ho_ten) <= 15
GROUP BY ma_nhan_vien
;
-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
-- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT * , (YEAR(current_date()) - YEAR(ngay_sinh)) AS tuoi
FROM khach_hang
WHERE (YEAR(current_date()) - YEAR(ngay_sinh)) >= 18 
	AND (YEAR(current_date()) - YEAR(ngay_sinh)) <= 50
    AND (dia_chi like '%Đà Nẵng%' OR dia_chi like '%Quảng Trị%')
;
-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”. 
SELECT k.ma_khach_hang, k.ho_ten,
COUNT(h.ma_khach_hang) AS so_lan_dat
FROM khach_hang k
JOIN hop_dong h ON k.ma_khach_hang = h.ma_khach_hang
JOIN loai_khach l ON k.ma_loai_khach = l.ma_loai_khach
WHERE l.ten_loai_khach = 'Diamond'
GROUP BY k.ma_khach_hang
;   
-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, 
-- tong_tien (Với tổng tiền được tính theo công thức như sau: 
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SELECT kh.ma_khach_hang, 
	   kh.ho_ten, 
       lk.ten_loai_khach, 
       hd.ma_hop_dong,
       dv.ten_dich_vu,
       hd.ngay_lam_hop_dong,
       hd.ngay_ket_thuc,
       IFNULL(dv.chi_phi_thue,0) + SUM(IFNULL(hc.so_luong,0) * IFNULL(dk.gia,0)) AS tong_tien
FROM      khach_hang        kh
JOIN      loai_khach        lk ON kh.ma_loai_khach     = lk.ma_loai_khach
LEFT JOIN hop_dong          hd ON hd.ma_khach_hang     = kh.ma_khach_hang
LEFT JOIN hop_dong_chi_tiet hc ON hc.ma_hop_dong       = hd.ma_hop_dong
LEFT JOIN dich_vu_di_kem    dk ON dk.ma_dich_vu_di_kem = hc.ma_dich_vu_di_kem  
LEFT JOIN dich_vu           dv ON dv.ma_dich_vu        = hd.ma_dich_vu
GROUP BY kh.ma_khach_hang, hd.ma_hop_dong
;
-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ
--  chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
SELECT 
     dv.ma_dich_vu,
     dv.ten_dich_vu,
     dv.dien_tich,
     dv.chi_phi_thue,
     ldv.ten_loai_dich_vu
FROM dich_vu dv
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
WHERE
    dv.ma_dich_vu NOT IN (SELECT 
            ma_dich_vu
        FROM
            hop_dong
        WHERE
            ngay_lam_hop_dong >= '2021/01/01');
-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, 
-- ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng 
-- trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
SELECT DISTINCT
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.dien_tich,
    dv.chi_phi_thue,
    ldv.ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        JOIN
    hop_dong hd ON hd.ma_dich_vu = dv.ma_dich_vu
WHERE
    YEAR(hd.ngay_lam_hop_dong) = 2020
        AND dv.ma_dich_vu NOT IN (SELECT 
            ma_dich_vu
        FROM
            hop_dong
        WHERE
            YEAR(ngay_lam_hop_dong) = 2021);
-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
SELECT DISTINCT
    kh.ho_ten
FROM
    khach_hang kh;
-- 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT MONTH(ngay_lam_hop_dong) AS thang, 
	   COUNT(ma_hop_dong)       AS so_lan_dat
FROM hop_dong 
WHERE YEAR(ngay_lam_hop_dong) = '2021'
GROUP BY MONTH(ngay_lam_hop_dong)
ORDER BY MONTH(ngay_lam_hop_dong) ASC
;
-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
SELECT hd.ma_hop_dong,
	   hd.ngay_lam_hop_dong,
       hd.ngay_ket_thuc,
       hd.tien_dat_coc,
       IFNULL(SUM(hc.so_luong),0) AS so_luong
FROM hop_dong          hd 
LEFT JOIN hop_dong_chi_tiet hc ON hd.ma_hop_dong = hc.ma_hop_dong
GROUP BY hd.ma_hop_dong
ORDER BY hd.ma_hop_dong ASC
;
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có 
-- ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
SELECT dvk.ma_dich_vu_di_kem, dvk.ten_dich_vu_di_kem, dvk.gia, dvk.don_vi
FROM dich_vu_di_kem    dvk
JOIN hop_dong_chi_tiet hdc ON dvk.ma_dich_vu_di_kem = hdc.ma_dich_vu_di_kem
JOIN hop_dong           hd ON hd.ma_hop_dong        = hdc.ma_hop_dong
JOIN khach_hang         kh ON kh.ma_khach_hang      = hd.ma_khach_hang
JOIN loai_khach         lk ON lk.ma_loai_khach      = kh.ma_loai_khach
WHERE lk.ten_loai_khach = 'Diamond' 
		AND (kh.dia_chi LIKE '%Vinh%' OR kh.dia_chi LIKE '%Quảng Ngãi%')
;
-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
-- HOP DONG, NHAN VIEN, KHACH HANG, DICH VU di kem, HOP DONG CHI TIET
SELECT hd.ma_hop_dong, 
       nv.ho_ten, kh.ho_ten AS ten_nhan_vien, 
       kh.so_dien_thoai AS so_dien_thoai_kh,
       dv.ten_dich_vu ,
       hd.ngay_lam_hop_dong,
       hd.tien_dat_coc,
       sum(IFNULL(hdc.so_luong,0))AS so_luong_dv_di_kem
       
FROM 	hop_dong            hd
JOIN nhan_vien              nv  ON hd.ma_nhan_vien = nv.ma_nhan_vien
JOIN khach_hang             kh  ON kh.ma_khach_hang = hd.ma_khach_hang
LEFT JOIN hop_dong_chi_tiet hdc ON hdc.ma_hop_dong = hd.ma_hop_dong
JOIN dich_vu                dv  ON dv.ma_dich_vu = hd.ma_dich_vu
WHERE   (YEAR(hd.ngay_lam_hop_dong) = '2020' 
		AND QUARTER(hd.ngay_lam_hop_dong) = 4 )
        AND hd.ma_dich_vu NOT IN (
			SELECT ma_dich_vu
            FROM hop_dong
            WHERE 	YEAR(ngay_lam_hop_dong) = '2021' 
					AND QUARTER(ngay_lam_hop_dong) IN (1,2)
        )
GROUP BY hd.ma_hop_dong
ORDER BY hd.ma_hop_dong ASC
;
-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
--  (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
-- DICH VU DI KEM, HOP DONG CHI TIET
SELECT 
    dvk.ten_dich_vu_di_kem,
    hdc.ma_dich_vu_di_kem,
    SUM(hdc.so_luong) AS so_luong_su_dung
FROM dich_vu_di_kem    dvk
JOIN hop_dong_chi_tiet hdc ON dvk.ma_dich_vu_di_kem = hdc.ma_dich_vu_di_kem
GROUP BY hdc.ma_dich_vu_di_kem
HAVING SUM(hdc.so_luong) IN (
		SELECT MAX(count_dvdk.sl)
		FROM
			(SELECT 
				ma_dich_vu_di_kem, 
                SUM(so_luong) AS sl
			 FROM hop_dong_chi_tiet
			 GROUP BY ma_dich_vu_di_kem) AS count_dvdk)
;
-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, 
-- ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).
-- DICH VU DI KEM, HOP DONG, DICH VU, HOP DONG CHI TIET


SET sql_mode = 0;
SELECT hdc.ma_hop_dong, 
	   hdc.ma_dich_vu_di_kem, 
       ldv.ten_loai_dich_vu,
       dvk.ten_dich_vu_di_kem , 
       COUNT(hdc.ma_hop_dong)
FROM hop_dong hd
LEFT JOIN hop_dong_chi_tiet          hdc ON hd.ma_hop_dong        = hdc.ma_hop_dong
JOIN dich_vu                          dv ON dv.ma_dich_vu         = hd.ma_dich_vu
JOIN loai_dich_vu                    ldv ON ldv.ma_loai_dich_vu   = dv.ma_loai_dich_vu
JOIN dich_vu_di_kem                  dvk ON dvk.ma_dich_vu_di_kem = hdc.ma_dich_vu_di_kem
GROUP BY hdc.ma_dich_vu_di_kem
HAVING COUNT(hdc.ma_dich_vu_di_kem) = 1;
SET sql_mode = 1;
 
-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, 
-- so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
SELECT nv.ma_nhan_vien,
       nv.ho_ten,
       td.ten_trinh_do,
       bp.ten_bo_phan,
       COUNT(hd.ma_hop_dong) AS so_luong_hop_dong
FROM nhan_vien nv
JOIN hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien
JOIN trinh_do td ON td.ma_trinh_do = nv.ma_trinh_do
JOIN bo_phan bp ON bp.ma_bo_phan = nv.ma_bo_phan
WHERE YEAR(hd.ngay_lam_hop_dong) IN('2020','2021')
GROUP BY nv.ma_nhan_vien
HAVING COUNT(hd.ma_hop_dong) <=3
;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

-- SELECT nv.ma_nhan_vien
--       --  count(hd.ma_hop_dong) 
-- FROM nhan_vien nv
-- Left JOIN hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
-- group by nv.ma_nhan_vien

CREATE VIEW temp AS
SELECT nv.ma_nhan_vien
FROM nhan_vien nv
JOIN hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien
WHERE YEAR(hd.ngay_lam_hop_dong) IN ('2019', '2020','2021')
GROUP BY nv.ma_nhan_vien;

DELETE FROM nhan_vien
WHERE ma_nhan_vien NOT IN (
SELECT ma_nhan_vien
FROM temp
);
-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với 
-- Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
-- khach hang, loai khach, hop dong
-- tong tien thanh toan = dv.chi_phi_thue + hdc.so_luong * dvk.don gia

CREATE VIEW temp_khach_hang AS 
SELECT kh.ma_khach_hang
   --     sum(dv.chi_phi_thue + hdc.so_luong * dvk.gia)
FROM khach_hang              kh
JOIN hop_dong                hd ON kh.ma_khach_hang = hd.ma_khach_hang
LEFT JOIN hop_dong_chi_tiet hdc ON hdc.ma_hop_dong = hd.ma_hop_dong
JOIN dich_vu_di_kem         dvk ON dvk.ma_dich_vu_di_kem = hdc.ma_dich_vu_di_kem
JOIN dich_vu                 dv ON dv.ma_dich_vu = hd.ma_dich_vu
JOIN loai_khach              lk ON lk.ma_loai_khach = kh.ma_loai_khach
WHERE YEAR(hd.ngay_lam_hop_dong) = '2021'
    	AND lk.ten_loai_khach = 'Platinum'
GROUP BY kh.ma_khach_hang
HAVING SUM(dv.chi_phi_thue + hdc.so_luong * dvk.gia) > 10000000;

UPDATE khach_hang
SET ma_loai_khach = 1
WHERE ma_khach_hang IN 
(
SELECT ma_loai_khach
FROM temp_khach_hang
);
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
ALTER TABLE khach_hang
ADD COLUMN is_deleted BIT;

SET sql_safe_updates = 0;
UPDATE khach_hang
SET is_deleted = 1
WHERE ma_khach_hang IN ( SELECT ma_khach_hang FROM
(SELECT kh.ma_khach_hang
FROM khach_hang kh
JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
WHERE YEAR(hd.ngay_lam_hop_dong) < 2021) AS temp
);
SET sql_safe_updates = 1;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

SET sql_safe_updates = 0;
UPDATE dich_vu_di_kem
SET gia = gia * 2
WHERE ma_dich_vu_di_kem IN (SELECT ma_dich_vu_di_kem
FROM (
SELECT hdc.ma_dich_vu_di_kem
FROM  hop_dong_chi_tiet hdc
JOIN dich_vu_di_kem dvk ON dvk.ma_dich_vu_di_kem = hdc.ma_dich_vu_di_kem
JOIN hop_dong hd ON hd.ma_hop_dong = hdc.ma_hop_dong
WHERE YEAR(hd.ngay_lam_hop_dong) = '2020' 
GROUP BY hdc.ma_dich_vu_di_kem
HAVING SUM(hdc.so_luong) > 10) AS temp 
);
SET sql_safe_updates = 1;
-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), 
-- ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
SELECT nv.ma_nhan_vien, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi
FROM nhan_vien nv
UNION 
SELECT kh.ma_khach_hang, kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi
FROM khach_hang kh
;










CREATE DATABASE furama_resort_quan_ly;
USE furama_resort_quan_ly;
CREATE TABLE bo_phan(
ma_bo_phan INT AUTO_INCREMENT PRIMARY KEY,
ten_bo_phan VARCHAR(45)
);
CREATE TABLE vi_tri(
ma_vi_tri INT AUTO_INCREMENT PRIMARY KEY,
ten_vi_tri VARCHAR(45)
);
CREATE TABLE trinh_do(
ma_trinh_do INT AUTO_INCREMENT PRIMARY KEY,
ten_trinh_do VARCHAR(45)
);
CREATE TABLE nhan_vien(
ma_nhan_vien INT AUTO_INCREMENT PRIMARY KEY,
ho_ten VARCHAR(45) NOT NULL,
ngay_sinh DATE NOT NULL,
so_cmnd VARCHAR(45) NOT NULL,
luong DOUBLE NOT NULL,
so_dien_thoai VARCHAR(45) NOT NULL,
email VARCHAR(45),
dia_chi VARCHAR(45),
ma_vi_tri INT,
FOREIGN KEY(ma_vi_tri) REFERENCES vi_tri(ma_vi_tri),
ma_trinh_do INT,
FOREIGN KEY(ma_trinh_do) REFERENCES trinh_do(ma_trinh_do),
ma_bo_phan INT,
FOREIGN KEY(ma_bo_phan) REFERENCES bo_phan(ma_bo_phan)
);
CREATE TABLE loai_khach(
ma_loai_khach INT AUTO_INCREMENT PRIMARY KEY,
ten_loai_khach VARCHAR(45)
);
CREATE TABLE khach_hang(
ma_khach_hang INT AUTO_INCREMENT PRIMARY KEY,
ho_ten VARCHAR(45) NOT NULL,
ngay_sinh DATE NOT NULL,
gioi_tinh BIT(1) NOT NULL,
so_cmnd VARCHAR(45) NOT NULL,
so_dien_thoai VARCHAR(45) NOT NULL,
email VARCHAR(45),
dia_chi VARCHAR(45),
ma_loai_khach INT,
FOREIGN KEY(ma_loai_khach) REFERENCES loai_khach(ma_loai_khach)
);
CREATE TABLE loai_dich_vu(
ma_loai_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
ten_loai_dich_vu VARCHAR(45)
);
CREATE TABLE kieu_thue(
ma_kieu_thue INT AUTO_INCREMENT PRIMARY KEY,
ten_kieu_thue VARCHAR(45)
);
CREATE TABLE dich_vu(
ma_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
ten_dich_vu VARCHAR(45) NOT NULL,
dien_tich INT,
chi_phi_thue DOUBLE NOT NULL,
so_nguoi_toi_da INT,
tieu_chuan_phong VARCHAR(45),
mo_ta_tien_nghi_khac VARCHAR(45),
dien_tich_ho_boi DOUBLE,
so_tang INT,
dich_vu_mien_phi_di_kem TEXT,
ma_kieu_thue INT,
FOREIGN KEY(ma_kieu_thue) REFERENCES kieu_thue(ma_kieu_thue),
ma_loai_dich_vu INT,
FOREIGN KEY(ma_loai_dich_vu) REFERENCES loai_dich_vu(ma_loai_dich_vu)
);
CREATE TABLE hop_dong(
ma_hop_dong INT AUTO_INCREMENT PRIMARY KEY,
ngay_lam_hop_dong DATETIME NOT NULL,
ngay_ket_thuc DATETIME NOT NULL,
tien_dat_coc DOUBLE NOT NULL,
ma_nhan_vien INT,
FOREIGN KEY(ma_nhan_vien) REFERENCES nhan_vien(ma_nhan_vien),
ma_khach_hang INT,
FOREIGN KEY(ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
ma_dich_vu INT,
FOREIGN KEY(ma_dich_vu) REFERENCES dich_vu(ma_dich_vu)
);
CREATE TABLE dich_vu_di_kem(
ma_dich_vu_di_kem INT AUTO_INCREMENT PRIMARY KEY,
ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
gia DOUBLE NOT NULL,
don_vi VARCHAR(10) NOT NULL,
trang_thai VARCHAR(45)
);
CREATE TABLE hop_dong_chi_tiet(
ma_hop_dong_chi_tiet INT AUTO_INCREMENT PRIMARY KEY,
ma_hop_dong INT,
FOREIGN KEY(ma_hop_dong) REFERENCES hop_dong(ma_hop_dong),
ma_dich_vu_di_kem INT,
FOREIGN KEY(ma_dich_vu_di_kem) REFERENCES dich_vu_di_kem(ma_dich_vu_di_kem)
);

INSERT INTO bo_phan (ten_bo_phan)
VALUES('sale marketing'), ('hanh chinh'), ('phuc vu'), ('quan ly');

INSERT INTO vi_tri(ten_vi_tri)
VALUES('le tan'),('phuc vu'),('chuyen vien'),('giam sat'),('quan ly'),('giam doc');

INSERT INTO trinh_do(ten_trinh_do)
VALUES('trung cap'),('cao dang'),('dai hoc'),('sau dai hoc');
 
INSERT INTO loai_dich_vu(ten_loai_dich_vu)
VALUES('villa'),('house'),('room');

INSERT INTO dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi)
VALUES('massage', 300,'1'),('karaoke',300,'1'),('thuc an',300,'1'),('thuc uong',300,'1'),('thue xe',300,'1');

INSERT INTO kieu_thue(ten_kieu_thue)
VALUES('nam'),('thang'),('ngay'),('gio');

INSERT INTO loai_khach(ten_loai_khach)
VALUES('diamond'),('platinium'),('gold'),('silver'),('member');


CREATE DATABASE quan_ly_xuat_nhap_kho;
USE quan_ly_xuat_nhap_kho;
CREATE TABLE vat_tu(
ma_vat_tu INT AUTO_INCREMENT PRIMARY KEY,
ten_vat_tu VARCHAR(50)
);
CREATE TABLE phieu_nhap(
so_pn INT AUTO_INCREMENT PRIMARY KEY,
ngay_nhap DATETIME
);
CREATE TABLE phieu_xuat(
so_px INT AUTO_INCREMENT PRIMARY KEY,
ngay_xuat DATETIME
);
CREATE TABLE chi_tiet_phieu_nhap_kho(
so_pn INT,
ma_vat_tu INT,
PRIMARY KEY(so_pn,ma_vat_tu),
FOREIGN KEY(so_pn) REFERENCES phieu_nhap(so_pn),
FOREIGN KEY(ma_vat_tu) REFERENCES vat_tu(ma_vat_tu),
don_gia_nhap INT,
so_luong_nhap INT
);
CREATE TABLE chi_tiet_phieu_xuat_kho(
so_px INT,
ma_vat_tu INT,
PRIMARY KEY(so_px,ma_vat_tu),
FOREIGN KEY(so_px) REFERENCES phieu_xuat(so_px),
FOREIGN KEY(ma_vat_tu) REFERENCES vat_tu(ma_vat_tu),
don_gia_xuat INT,
so_luong_xuat INT
);
CREATE TABLE don_dat_hang(
so_DH INT AUTO_INCREMENT PRIMARY KEY,
ngay_dat_hang DATETIME
);
CREATE TABLE chi_tiet_don_dat_hang(
so_DH INT,
ma_vat_tu INT,
PRIMARY KEY(so_DH,ma_vat_tu),
FOREIGN KEY(so_DH) REFERENCES don_dat_hang(so_DH),
FOREIGN KEY(ma_vat_tu) REFERENCES vat_tu(ma_vat_tu)
);
CREATE TABLE nha_cung_cap(
ma_NCC VARCHAR(20) PRIMARY KEY,
ten_NCC VARCHAR(50),
dia_chi VARCHAR(50)
);
CREATE TABLE so_dien_thoai(
id_SDT INT PRIMARY KEY, 
ma_NCC VARCHAR(20),
so_dien_thoai VARCHAR(10),
FOREIGN KEY(ma_NCC) REFERENCES nha_cung_cap(ma_NCC)
);

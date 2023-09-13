create database quan_ly_xuat_nhap_kho;
use quan_ly_xuat_nhap_kho;
create table vat_tu(
ma_vat_tu int auto_increment primary key,
ten_vat_tu varchar(50)
);
create table phieu_nhap(
so_pn int auto_increment primary key,
ngay_nhap datetime
);
create table phieu_xuat(
so_px int auto_increment primary key,
ngay_xuat datetime
);
create table chi_tiet_phieu_nhap_kho(
so_pn int,
ma_vat_tu int,
primary key(so_pn,ma_vat_tu),
foreign key(so_pn) references phieu_nhap(so_pn),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
don_gia_nhap int,
so_luong_nhap int
);
create table chi_tiet_phieu_xuat_kho(
so_px int,
ma_vat_tu int,
primary key(so_px,ma_vat_tu),
foreign key(so_px) references phieu_xuat(so_px),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
don_gia_xuat int,
so_luong_xuat int
);
create table don_dat_hang(
so_DH int auto_increment primary key,
ngay_dat_hang datetime
);
create table chi_tiet_don_dat_hang(
so_DH int,
ma_vat_tu int,
primary key(so_DH,ma_vat_tu),
foreign key(so_DH) references don_dat_hang(so_DH),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table nha_cung_cap(
ma_NCC varchar(20) primary key,
ten_NCC varchar(50),
dia_chi varchar(50)
);
create table so_dien_thoai(
id_SDT int primary key, 
ma_NCC varchar(20),
so_dien_thoai varchar(10),
foreign key(ma_NCC) references nha_cung_cap(ma_NCC)
);

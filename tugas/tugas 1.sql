-- TABEL MENU
CREATE TABLE menu (
    kode_menu VARCHAR(10) PRIMARY KEY,
    nama_menu VARCHAR(100) NOT NULL,
    kategori VARCHAR(50) NOT NULL,
    harga NUMERIC(12,2) NOT NULL
);

-- TABEL PELANGGAN
CREATE TABLE pelanggan (
    id_pelanggan SERIAL PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL,
    no_telepon VARCHAR(20) NOT NULL
);

-- TABEL PEGAWAI
CREATE TABLE pegawai (
    id_pegawai SERIAL PRIMARY KEY,
    nama_pegawai VARCHAR(100) NOT NULL,
    jabatan VARCHAR(50) NOT NULL
);

-- TABEL PESANAN
CREATE TABLE pesanan (
    id_pesanan SERIAL PRIMARY KEY,
    id_pelanggan INTEGER NOT NULL,
    id_pegawai INTEGER NOT NULL,
    tanggal_pesanan DATE NOT NULL,
    total_harga NUMERIC(12,2) NOT NULL
);

-- no_telepon pada tabel pelanggan harus unik
ALTER TABLE pelanggan
ADD CONSTRAINT unique_no_telepon
UNIQUE (no_telepon);


-- harga pada tabel menu tidak boleh kurang dari 0
ALTER TABLE menu
ADD CONSTRAINT check_harga
CHECK (harga >= 0);


-- jabatan pada tabel pegawai hanya boleh Kasir, Admin, atau Manager
ALTER TABLE pegawai
ADD CONSTRAINT check_jabatan
CHECK (jabatan IN ('Kasir', 'Admin', 'Manager'));


-- total_harga pada tabel pesanan tidak boleh kurang dari 0
ALTER TABLE pesanan
ADD CONSTRAINT check_total_harga
CHECK (total_harga >= 0);


-- id_pelanggan pada tabel pesanan harus mengacu pada id_pelanggan di tabel pelanggan
ALTER TABLE pesanan
ADD CONSTRAINT fk_pesanan_pelanggan
FOREIGN KEY (id_pelanggan)
REFERENCES pelanggan(id_pelanggan);


-- id_pegawai pada tabel pesanan harus mengacu pada id_pegawai di tabel pegawai
ALTER TABLE pesanan
ADD CONSTRAINT fk_pesanan_pegawai
FOREIGN KEY (id_pegawai)
REFERENCES pegawai(id_pegawai);

-- Data menu
INSERT INTO menu (kode_menu, nama_menu, kategori, harga)
VALUES
('M001', 'Kopi Susu', 'Minuman', 15000),
('M002', 'Americano', 'Minuman', 12000),
('M003', 'Matcha Latte', 'Minuman', 18000),
('M004', 'Nasi Goreng', 'Makanan', 20000),
('M005', 'Roti Bakar', 'Makanan', 15000);


-- Data pelanggan
INSERT INTO pelanggan (nama_pelanggan, no_telepon)
VALUES
('Andi', '081234567801'),
('Budi', '081234567802'),
('Citra', '081234567803');


-- Data pegawai
INSERT INTO pegawai (nama_pegawai, jabatan)
VALUES
('Doni', 'Kasir'),
('Eka', 'Admin'),
('Fajar', 'Manager');

-- Mengubah harga Kopi Susu
UPDATE menu
SET harga = 20000
WHERE kode_menu = 'M001';

-- Mengubah harga Americano
UPDATE menu
SET harga = 17000
WHERE kode_menu = 'M002';

-- Mengubah nama pelanggan
UPDATE pelanggan
SET nama_pelanggan = 'Andi Pratama'
WHERE id_pelanggan = 1;

-- Mencoba manambah menu
INSERT INTO menu (kode_menu, nama_menu, kategori, harga)
VALUES ('M006', 'Es Kopi', 'Minuman', -5000);

-- Membuat user admin
CREATE USER admin_kopi
WITH PASSWORD 'admin123';

-- Membuat user kasir
CREATE USER kasir_kopi
WITH PASSWORD 'kasir123';

-- Memberikan seluruh hak akses tabel kepada admin
GRANT ALL PRIVILEGES
ON ALL TABLES IN SCHEMA public
TO admin_kopi;

-- Memberikan hak akses sequence kepada admin
GRANT ALL PRIVILEGES
ON ALL SEQUENCES IN SCHEMA public
TO admin_kopi;

-- Kasir dapat melihat data menu
GRANT SELECT
ON menu
TO kasir_kopi;


-- Kasir dapat melihat dan menambahkan pelanggan
GRANT SELECT, INSERT
ON pelanggan
TO kasir_kopi;


-- Kasir dapat melihat, menambahkan, dan mengubah pesanan
GRANT SELECT, INSERT, UPDATE
ON pesanan
TO kasir_kopi;

-- Menghapus tabel pesanan 
TRUNCATE TABLE pesanan;

-- Membuat tabel pesanan_test
CREATE TABLE pesanan_test (
    id_test SERIAL PRIMARY KEY,
    keterangan VARCHAR(100)
);

-- Menghapus tabel pesanan_test
DROP TABLE pesanan_test;

-- Menghapus Foreign Key
ALTER TABLE pesanan
DROP CONSTRAINT fk_pesanan_pelanggan;

-- Menghapus tabel pelanggan
DROP TABLE pelanggan;

-- Menghapus beberapa transaksi
DELETE FROM pesanan
WHERE id_pesanan = 3;

-- Menghapus seluruh data transaksi percobaan
TRUNCATE TABLE pesanan;
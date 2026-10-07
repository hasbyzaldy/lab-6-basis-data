-- 1. Tabel Pelanggan
CREATE TABLE pelanggan (
    id_pelanggan SERIAL PRIMARY KEY,
    nama_pelanggan VARCHAR(100),
    kota VARCHAR(50),
    jenis_kelamin CHAR(1),
    tanggal_daftar DATE
);

-- 2. Tabel Transaksi
CREATE TABLE transaksi (
    id_transaksi SERIAL PRIMARY KEY,
    id_pelanggan INT REFERENCES pelanggan(id_pelanggan),
    kategori_produk VARCHAR(50),
    produk VARCHAR(100),
    jumlah INT,
    harga_produk NUMERIC(12,2),
    tanggal_transaksi DATE
);

INSERT INTO pelanggan (nama_pelanggan, kota, jenis_kelamin, tanggal_daftar) VALUES
('Rifki Al Sauqy', 'Medan', 'L', '2023-01-10'),
('Budi Santoso', 'Jakarta', 'L', '2023-01-15'),
('Siti Nurhaliza', 'Bandung', 'P', '2023-02-01'),
('Andi Wijaya', 'Surabaya', 'L', '2023-02-20'),
('Dewi Lestari', 'Medan', 'P', '2023-03-05'),
('Eko Prasetyo', 'Jakarta', 'L', '2023-03-12'),
('Fani Rahmawati', 'Semarang', 'P', '2023-04-01'),
('Giri Hartono', 'Bandung', 'L', '2023-04-18'),
('Hani Pertiwi', 'Medan', 'P', '2023-05-02'),
('Irfan Bachdim', 'Surabaya', 'L', '2023-05-20'),
('Joko Susilo', 'Jakarta', 'L', '2023-06-01'),
('Kiki Amalia', 'Semarang', 'P', '2023-06-15'),
('Luki Hermawan', 'Medan', 'L', '2023-07-01'),
('Maya Sari', 'Bandung', 'P', '2023-07-10'),
(NULL, 'Bandung', 'P', '2023-08-10'),
('Nugroho Syahputra', 'Jakarta', 'L', '2023-08-01');

INSERT INTO transaksi (id_pelanggan, kategori_produk, produk, jumlah, harga_produk, tanggal_transaksi) VALUES
(1, 'Elektronik', 'Laptop Asus ZenBook', 1, 12500000.00, '2023-01-20'),
(1, 'Kebutuhan Rumah Tangga', 'Deterjen Gel 1kg', 3, 45000.00, '2023-02-15'),
(2, 'Kebutuhan Rumah Tangga', 'Minyak Goreng 2L', 5, 38000.00, '2023-02-01'),
(2, 'Elektronik', 'Mouse Wireless', 2, 150000.00, '2023-02-10'),
(3, 'Pakaian', 'Kemeja Wanita', 2, 180000.00, '2023-02-25'),
(3, 'Kebutuhan Rumah Tangga', 'Sabu Mandi Pack', 4, 25000.00, '2023-03-01'),
(4, 'Makanan & Minuman', 'Kopi Arabika 250g', 10, 75000.00, '2023-03-10'),
(5, 'Elektronik', 'Smart TV 43 Inch', 1, 4500000.00, '2023-03-15'),
(5, 'Kebutuhan Rumah Tangga', 'Pembersih Lantai', 2, 30000.00, '2023-03-20'),
(6, 'Pakaian', 'Celana Chino', 1, 250000.00, '2023-04-05'),
(7, 'Makanan & Minuman', 'Susu UHT 1L', 12, 18000.00, '2023-04-12'),
(8, 'Kebutuhan Rumah Tangga', 'Lampu LED 12W', 6, 35000.00, '2023-04-20'),
(9, 'Elektronik', 'Headphone Bluetooth', 1, 850000.00, '2023-05-10'),
(10, 'Makanan & Minuman', 'Cokelat Batangan', 15, 20000.00, '2023-05-22'),
(11, 'Pakaian', 'Jaket Parka', 1, 450000.00, '2023-06-05'),
(12, 'Kebutuhan Rumah Tangga', 'Tissue Roll Pack', 3, 40000.00, '2023-06-18'),
(1, 'Makanan & Minuman', 'Teh Hijau Celup', 5, 15000.00, '2023-07-02'),
(3, 'Elektronik', 'Powerbank 10000mAh', 1, 250000.00, '2023-07-12'),
(6, 'Kebutuhan Rumah Tangga', 'Sapu Ijuk Super', 2, 35000.00, '2023-07-20'),
(13, 'Makanan & Minuman', 'Beras Premium 5kg', 2, 72000.00, '2023-08-05');

SELECT nama_pelanggan AS "Nama Lengakap Pelanggan" FROM pelanggan;

SELECT COUNT (nama_pelanggan) FROM pelanggan;
SELECT COUNT (*) FROM pelanggan;

SELECT SUM(jumlah * harga_produk) FROM transaksi;
SELECT SUM(jumlah * harga_produk) AS "Transaksi" FROM transaksi;

select AVG(harga_produk) FROM transaksi
WHERE kategori_produk = 'Kebutuhan Rumah Tangga';

SELECT MIN (harga_produk) AS "Murah", MAX(harga_produk) AS "MAHAL" FROM transaksi;

SELECT (kategori_produk) FROM transaksi;
SELECT DISTINCT (kategori_produk) FROM transaksi;

SELECT kategori_produk FROM transaksi GROUP BY katergori_produk;

SELECT kategori_produk, SUM(jumlah * harga_produk) AS total_penjualan FROM transaksi
GROUP BY kategori_produk
ORDER BY total_penjualan DESC;

SELECT kategori_produk, SUM(jumlah * harga_produk) AS total_penjualan FROM transaksi
GROUP BY kategori_produk
HAVING SUM(jumlah * harga_produk) > 1000000
ORDER BY total_penjualan DESC;

CREATE TABLE membership (
    id_membership SERIAL PRIMARY KEY,
    id_pelanggan INT,
    level_member VARCHAR(20),
    tanggal_gabung DATE
);

-- Insert Data Membership (Sesuai slide & tambahan data sampel)
INSERT INTO membership (id_pelanggan, level_member, tanggal_gabung) VALUES
(1, 'Gold', '2023-02-01'),
(3, 'Platinum', '2023-03-25'),
(4, 'Silver', '2023-04-01'),
(5, 'Bronze', '2023-04-10'),
(8, 'Gold', '2023-07-10'),
(11, 'Silver', '2023-07-25'),
(99, 'Platinum', '2023-08-10');

SELECT p.nama_pelanggan, m.level_member
FROM pelanggan p
INNER JOIN membership m
USING(id_pelanggan);

SELECT pelanggan.nama_pelanggan, membership.level_member
FROM pelanggan 
INNER JOIN membership 
USING(id_pelanggan);

SELECT p.nama_pelanggan, m.level_member
FROM pelanggan p
INNER JOIN membership m
ON p.id_pelanggan= m.id_pelanggan;

SELECT p.nama_pelanggan, m.level_member AS status_member
FROM pelanggan p
LEFT JOIN membership m
USING(id_pelanggan);

SELECT p.nama_pelanggan, m.level_member AS status_member
FROM pelanggan p
RIGHT JOIN membership m
USING(id_pelanggan);

SELECT p.nama_pelanggan, m.level_member AS status_member
FROM pelanggan p
FULL OUTER JOIN membership m
USING(id_pelanggan);

FROM pelanggan p
SELECT p.nama_pelanggan, m.level_member AS status_member
CROSS JOIN membership m;

SELECT p.nama_pelanggan AS nama, 'Member' AS status
FROM pelanggan p
JOIN membership m
ON p.id_pelanggan = m.id_pelanggan

UNION

SELECT p.nama_pelanggan AS nama, 'Non-Member' AS status
FROM pelanggan p
LEFT JOIN membership m
ON p.id_pelanggan = m.id_pelanggan
WHERE m.level_member IS NULL

ORDER BY nama;
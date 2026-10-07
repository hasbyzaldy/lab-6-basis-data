-- =========================================================
-- 1. MEMBUAT TABEL
-- =========================================================

CREATE TABLE kategori_menu (
    id_kategori SERIAL PRIMARY KEY,
    nama_kategori VARCHAR(50) NOT NULL
);

CREATE TABLE menu (
    id_menu SERIAL PRIMARY KEY,
    nama_menu VARCHAR(100) NOT NULL,
    harga NUMERIC(10,2) NOT NULL CHECK (harga > 0),
    tersedia BOOLEAN NOT NULL DEFAULT TRUE,
    id_kategori INTEGER
        REFERENCES kategori_menu(id_kategori)
);

CREATE TABLE pelanggan (
    id_pelanggan SERIAL PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL,
    no_hp VARCHAR(20)
);

CREATE TABLE membership (
    id_membership SERIAL PRIMARY KEY,
    id_pelanggan INTEGER
        REFERENCES pelanggan(id_pelanggan),
    tanggal_daftar DATE NOT NULL
);

CREATE TABLE pesanan (
    id_pesanan SERIAL PRIMARY KEY,
    id_pelanggan INTEGER
        REFERENCES pelanggan(id_pelanggan),
    tanggal_pesanan DATE NOT NULL,
    status_pesanan VARCHAR(30) NOT NULL
);

CREATE TABLE detail_pesanan (
    id_detail SERIAL PRIMARY KEY,
    id_pesanan INTEGER
        REFERENCES pesanan(id_pesanan),
    id_menu INTEGER
        REFERENCES menu(id_menu),
    jumlah INTEGER NOT NULL CHECK (jumlah > 0)
);


-- =========================================================
-- 2. DATA KATEGORI
-- =========================================================

INSERT INTO kategori_menu (nama_kategori) VALUES
('Coffee'),
('Non-Coffee'),
('Food'),
('Dessert'),
('Seasonal'),
('Merchandise');


-- =========================================================
-- 3. DATA MENU
-- =========================================================

INSERT INTO menu
(nama_menu, harga, tersedia, id_kategori)
VALUES
('Americano',        20000, TRUE,  1),
('Iced Latte',       28000, TRUE,  1),
('Caramel Latte',    30000, TRUE,  1),
('Espresso',         18000, TRUE,  1),
	
('Matcha Latte',     25000, TRUE,  2),
('Chocolate Milk',   22000, TRUE,  2),
('Lemon Tea',        17000, TRUE,  2),
 
('Nasi Goreng',      28000, TRUE,  3),
('Chicken Sandwich', 32000, TRUE,  3),

('Chocolate Cake',   30000, TRUE,  4),
('Cheesecake',       35000, TRUE,  4),

('Pumpkin Latte',    32000, FALSE, 5),

('Hazelnut Coffee',  33000, FALSE, 1),

('Mystery Box',      15000, TRUE,  NULL);


-- =========================================================
-- 4. DATA PELANGGAN
-- =========================================================

INSERT INTO pelanggan
(nama_pelanggan, no_hp)
VALUES
('Andi',  '081111111111'),
('Budi',  '081111111112'),
('Citra', '081111111113'),
('Dina',  '081111111114'),
('Eka',   '081111111115'),
('Fajar', '081111111116'),
('Gita',  '081111111117'),
('Hana',  '081111111118');


-- =========================================================
-- 5. DATA MEMBERSHIP
-- =========================================================

INSERT INTO membership
(id_pelanggan, tanggal_daftar)
VALUES
(1, '2026-01-10'),
(3, '2026-02-15'),
(5, '2026-03-01'),
(7, '2026-03-20');


-- =========================================================
-- 6. DATA PESANAN
-- =========================================================

INSERT INTO pesanan
(id_pelanggan, tanggal_pesanan, status_pesanan)
VALUES
(1, '2026-09-01', 'Selesai'),
(1, '2026-09-05', 'Selesai'),
(2, '2026-09-05', 'Selesai'),
(3, '2026-09-06', 'Selesai'),
(3, '2026-09-08', 'Selesai'),
(5, '2026-09-09', 'Selesai'),
(6, '2026-09-10', 'Selesai');


-- =========================================================
-- 7. DATA DETAIL PESANAN
-- =========================================================

INSERT INTO detail_pesanan
(id_pesanan, id_menu, jumlah)
VALUES
(1, 2, 1),   -- Iced Latte
(1, 8, 1),   -- Nasi Goreng

(2, 3, 1),   -- Caramel Latte
(2, 10, 1),  -- Chocolate Cake

(3, 1, 1),   -- Americano
(3, 6, 1),   -- Chocolate Milk

(4, 2, 2),   -- Iced Latte
(4, 9, 1),   -- Chicken Sandwich

(5, 3, 1),   -- Caramel Latte
(5, 11, 1),  -- Cheesecake

(6, 4, 1),   -- Espresso
(6, 7, 1),   -- Lemon Tea

(7, 5, 1);   -- Matcha Latte


SELECT
    m.nama_menu,
    k.nama_kategori,
    m.harga AS harga_saat_ini,
    m.harga + 5000 AS harga_setelah_kenaikan
FROM menu m
JOIN kategori_menu k
    ON m.id_kategori = k.id_kategori
WHERE m.harga >= 20000
  AND k.nama_kategori IN ('Coffee', 'Dessert')
  AND m.nama_menu ILIKE '%latte%'
ORDER BY m.harga ASC;

SELECT nama_menu, harga FROM menu
ORDER BY harga DESC;

SELECT nama_menu, harga FROM menu
ORDER BY harga ASC
LIMIT 5 OFFSET 5;

SELECT m.nama_menu AS "Nama Menu", k.nama_kategori AS "Kategori", m.harga AS "Harga Jual" FROM menu m
JOIN kategori_menu k
    ON m.id_kategori = k.id_kategori;

SELECT DISTINCT nama_kategori FROM kategori_menu;

SELECT k.nama_kategori, COUNT(m.id_menu) AS jumlah_menu
FROM kategori_menu k
JOIN menu m
    ON k.id_kategori = m.id_kategori
GROUP BY k.id_kategori, k.nama_kategori
HAVING COUNT(m.id_menu) >= 2;

SELECT k.id_kategori, k.nama_kategori, m.id_menu, m.nama_menu, m.harga, m.tersedia
FROM kategori_menu k
FULL OUTER JOIN menu m
    ON k.id_kategori = m.id_kategori;

SELECT k.nama_kategori, COUNT(m.id_menu) AS jumlah_menu
FROM kategori_menu k
LEFT JOIN menu m
    ON k.id_kategori = m.id_kategori
GROUP BY k.id_kategori, k.nama_kategori
ORDER BY k.id_kategori;

SELECT nama_pelanggan FROM pelanggan
EXCEPT
SELECT p.nama_pelanggan
FROM pelanggan p
JOIN membership m
    ON p.id_pelanggan = m.id_pelanggan;

SELECT m.nama_menu FROM menu m
WHERE NOT EXISTS (
    SELECT 1
    FROM detail_pesanan dp
    WHERE dp.id_menu = m.id_menu
);

SELECT m.nama_menu, m.harga, k.nama_kategori
FROM menu m
JOIN kategori_menu k
    ON m.id_kategori = k.id_kategori
WHERE m.harga > (
    SELECT AVG(harga)
    FROM menu
)
AND m.tersedia = TRUE
AND k.nama_kategori = 'Coffee';
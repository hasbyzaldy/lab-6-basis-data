CREATE TABLE mahasiswa (
    id_mahasiswa INT PRIMARY KEY,
    nama VARCHAR(100),
    jurusan VARCHAR(50),
    asal_provinsi VARCHAR(50),
    semester INT,
    ipk FLOAT,
    email VARCHAR(100)
);

INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, asal_provinsi, semester, ipk, email) VALUES
(1, 'Andi Pratama', 'Informatika', 'Sumatera Utara', 5, 3.85, 'andi@mahasiswa.ac.id'),
(2, 'Budi Santoso', 'Sistem Informasi', 'Jawa Barat', 3, 3.40, 'budi@gmail.com'),
(3, 'Citra Dewi', 'Informatika', 'Sumatera Utara', 7, 3.90, 'citra@mahasiswa.ac.id'),
(4, 'Dedi Kurniawan', 'Teknik Elektro', 'DKI Jakarta', 5, 3.25, 'dedi@mahasiswa.ac.id'),
(5, 'Eka Rahmawati', 'Informatika', 'Jawa Tengah', 5, 3.75, 'eka@mahasiswa.ac.id'),
(6, 'Fahmi Idris', 'Sistem Informasi', 'Sumatera Utara', 6, 3.60, 'fahmi@yahoo.com'),
(7, 'Gita Gutawa', 'Teknik Mesin', 'Jawa Timur', 4, 3.80, 'gita@mahasiswa.ac.id'),
(8, 'Hendy Wijaya', 'Informatika', 'Sumatera Utara', 4, 3.10, 'hendy@mahasiswa.ac.id'),
(9, 'Indah Permata', 'Sistem Informasi', 'Sumatera Utara', 7, 3.95, 'indah@mahasiswa.ac.id'),
(10, 'Joko Widodo', 'Informatika', 'DI Yogyakarta', 6, 3.65, 'joko@mahasiswa.ac.id');

SELECT * FROM mahasiswa WHERE asal_provinsi <> 'Sumatera Utara';

SELECT * FROM mahasiswa
WHERE asal_provinsi <> 'Sumatera Utara'
   OR (
       asal_provinsi = 'Sumatera Utara'
       AND jurusan = 'Informatika'
       AND semester > 6
   );

SELECT * FROM mahasiswa
WHERE ( asal_provinsi <> 'Sumatera Utara'
    OR (
        asal_provinsi = 'Sumatera Utara'
        AND jurusan = 'Informatika'
        AND semester > 6
    )
)
AND ipk >= 3.50;

SELECT * FROM mahasiswa
WHERE ( asal_provinsi <> 'Sumatera Utara'
    OR (
        asal_provinsi = 'Sumatera Utara'
        AND jurusan = 'Informatika'
        AND semester > 6
    )
)
AND ipk >= 3.50
AND email LIKE '%@mahasiswa.ac.id';

SELECT * FROM mahasiswa
WHERE ( asal_provinsi <> 'Sumatera Utara'
    OR (
        asal_provinsi = 'Sumatera Utara'
        AND jurusan = 'Informatika'
        AND semester > 6
    )
)
AND ipk >= 3.50
AND email LIKE '%@mahasiswa.ac.id'
ORDER BY ipk DESC, semester DESC;

SELECT * FROM mahasiswa
WHERE ( asal_provinsi <> 'Sumatera Utara'
    OR (
        asal_provinsi = 'Sumatera Utara'
        AND jurusan = 'Informatika'
        AND semester > 6
    )
)
AND ipk >= 3.50
AND email LIKE '%@mahasiswa.ac.id'
ORDER BY ipk DESC, semester DESC
LIMIT 3 OFFSET 3;
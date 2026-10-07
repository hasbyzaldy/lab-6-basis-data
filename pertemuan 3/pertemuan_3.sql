CREATE TABLE karyawan (
    id SERIAL PRIMARY KEY,
    nama VARCHAR(100),
    umur INT,
    tgl_bergabung DATE,
    jam_kerja_mingguan INT,
    gaji_per_jam NUMERIC(10,2),
    divisi VARCHAR(50),
    jabatan VARCHAR(50),
    asal VARCHAR(100),
    email VARCHAR(100),
    riwayat_penyakit VARCHAR(100) NULL
);

INSERT INTO karyawan 
(nama, umur, tgl_bergabung, jam_kerja_mingguan, gaji_per_jam, divisi, jabatan, asal, email, riwayat_penyakit) VALUES
-- Divisi IT
('Budi Arie', 27, '2023-02-15', 45, 80000, 'IT', 'Programmer', 'Jakarta', 'budi.arie@company.com', NULL),
('Ronjaz', 44, '2022-06-01', 48, 95000, 'IT', 'System Analyst', 'Medan', 'ronjaz_it@yahoo.com', 'Migrain'),
('John Doe', 24, '2024-01-20', 50, 70000, 'IT', 'Junior Developer', 'Medan', 'john.doe24@gmail.com', NULL),
('Wana', 29, '2021-09-11', 46, 100000, 'IT', 'Manager', 'Medan', 'wana.manager@company.com', 'Asma'),
('Rizki Pratama', 35, '2020-03-10', 47, 110000, 'IT', 'DevOps Engineer', 'Depok', 'rizki.devops@yahoo.com', NULL),
('Snake Sanjaya', 23, '2024-04-10', 50, 72000, 'IT', 'Intern', 'Jakarta', 'snake_sanjaya@gmail.com', NULL),
('Farhan Ali', 28, '2022-02-12', 44, 87000, 'IT', 'Backend Developer', 'Bandung', 'farhan.ali@company.com', NULL),

-- Divisi HR
('Siti Kus', 26, '2023-07-01', 40, 50000, 'HR', 'Staff HRD', 'Jakarta', 'siti.kus@gmail.com', NULL),
('Ahmad Fauzi', 32, '2021-05-15', 38, 60000, 'HR', 'Recruiter', 'Semarang', 'ahmad.fz@yahoo.com', 'Diabetes'),
('Lina Marlina', 28, '2022-11-21', 39, 55000, 'HR', 'HR Manager', 'Medan', 'lina_hr@company.com', NULL),
('Maya Putri', 27, '2023-09-25', 41, 58000, 'HR', 'Recruiter', 'Padang', 'maya.putri99@gmail.com', 'Anemia'),
('Yulianti', 33, '2021-12-05', 37, 62000, 'HR', 'Training Specialist', 'Bandung', 'yulianti_tr@yahoo.com', 'Gastritis'),

-- Divisi Finance
('Delpiero', 40, '2019-08-09', 37, 75000, 'Finance', 'Finance Manager', 'Medan', 'delpiero.finance@company.com', NULL),
('Andi Wijaya', 31, '2020-01-30', 36, 65000, 'Finance', 'Accountant', 'Medan', 'andi_wijaya@gmail.com', 'Hipertensi'),
('Nurhayati', 45, '2018-04-17', 35, 80000, 'Finance', 'Auditor', 'Padang', 'nurhayati@yahoo.com', NULL),
('Bagus Saputra', 36, '2019-06-20', 39, 70000, 'Finance', 'Senior Accountant', 'Bandung', 'bagus.saputra@company.com', NULL);

SELECT * FROM karyawan WHERE asal <> 'Medan';
SELECT * FROM karyawan WHERE asal <> 'Jakarta';
SELECT * FROM karyawan WHERE asal = 'Bandung';
SELECT * FROM karyawan WHERE tgl_bergabung > '2024-01-01';

SELECT nama, (jam_kerja_mingguan * gaji_per_jam * 52) AS gaji_pertahun 
FROM karyawan;

SELECT * FROM karyawan WHERE umur < 30 OR jabatan = 'Manager' AND riwayat_penyakit = NULL;

SELECT * FROM karyawan WHERE asal <> 'Medan' OR (divisi = 'IT' AND umur > 40);

SELECT nama, divisi, umur FROM karyawan WHERE umur > 40;

SELECT nama, riwayat_penyakit  FROM karyawan WHERE riwayat_penyakit IS  NOT NULL;

SELECT nama, divisi FROM karyawan WHERE divisi IN ('IT', 'Finance');

SELECT nama, divisi, asal FROM karyawan WHERE divisi NOT IN ('Medan', 'Padang');

SELECT nama, umur, divisi FROM karyawan WHERE umur BETWEEN 20 AND 30;

SELECT nama, umur, divisi FROM karyawan WHERE umur NOT BETWEEN 30 AND 40;

SELECT nama, email FROM karyawan WHERE email LIKE '%@gmail.com';

SELECT nama, email FROM karyawan WHERE email LIKE '__y%';

SELECT nama, jabatan, divisi FROM karyawan WHERE jabatan ILIKE '%manager';

SELECT nama, jabatan, divisi FROM karyawan WHERE jabatan LIKE '%manager';

SELECT nama, divisi, jabatan, gaji_per_jam FROM karyawan ORDER BY gaji_per_jam DESC LIMIT 8 OFFSET 5;

SELECT nama, divisi, jabatan, gaji_per_jam FROM karyawan ORDER BY gaji_per_jam ASC;
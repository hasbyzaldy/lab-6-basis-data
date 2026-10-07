CREATE TABLE mahasiswa (
	id SERIAL PRIMARY KEY,
	nama VARCHAR(100) NOT NULL,
	umur INT NOT NULL,
	jurusan VARCHAR(50) NOT NULL,
	ankatan INT NOT NULL
);

INSERT INTO mahasiswa (nama, umur, jurusan, angkatan)
VALUES
('Budie', 23, 'Ilmu Komputer', 2023),
('Arie', 24, 'Teknologi Infomasi', 2024),
('Charlie', 21, 'Kedokteran', 2024);

SELECT * FROM mahasiswa;

SELECT nama, umur, jurusan, angkatan
FROM mahasiswa;

UPDATE mahasiswa
SET angkatan = 2024, jurusan = 'Teknik Komputer'
WHERE id = 1;

DELETE FROM mahasiswa
WHERE id = 3;

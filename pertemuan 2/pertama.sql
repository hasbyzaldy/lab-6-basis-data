CREATE TABLE demo_table (
	id SERIAL PRIMARY KEY,
	name TEXT
);

INSERT INTO demo_table (name) VALUES ('Alice'), ('Bob'), ('Charlie');

SELECT * FROM demo_table

CREATE USER user_1 WITH PASSWORD 'admin123';

SELECT * FROM pg_roles;

GRANT SELECT ON demo_table TO user_1;

REVOKE SELECT ON demo_table FROM user_1;

DROP USER user_1;

CREATE TABLE mahasiswa (
	id SERIAL PRIMARY KEY,
	nama VARCHAR(100),
	nim CHAR(9),
	alamat TEXT,
	usia INTEGER,
	ipk NUMERIC(3,2),
	aktif BOOLEAN,
	tanggal_lahir DATE,
	waktu_daftar TIMESTAMP,
	hobi TEXT ARRAY
);

INSERT INTO mahasiswa
(nama, nim, alamat, usia, ipk, aktif, tanggal_lahir, waktu_daftar, hobi)
VALUES
('John Doe', '231401099', 'Jl. Merdeka No. 10, Medan',
20, 3.75, TRUE, '2003-07-15', '2025-09-21 09:15:00', ARRAY['Tidur', 'Gaming']);

SELECT * FROM mahasiswa;

DROP TABLE mahasiswa;


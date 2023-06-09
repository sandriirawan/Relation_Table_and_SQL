-- Active: 1686315622423@@127.0.0.1@5432@practice

-- one to one
CREATE TABLE pegawai(
    id INT PRIMARY KEY,
    nama VARCHAR(255) NOT NULL,
    jabatan VARCHAR(255) NOT NULL,
    PRIMARY KEY (id) 
);

CREATE TABLE pegawai_detail (
    id INT PRIMARY,
    alamat VARCHAR(255) NOT NULL,
    telepon VARCHAR(255) NOT NULL,
    pegawai_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (pegawai_id) REFERENCES pegawai(id)
);

-- Masukkan data ke tabel pegawai
INSERT INTO pegawai (id,nama, jabatan) VALUES (,'wahyu', 'stafprogramming');
INSERT INTO pegawai(id,nama, jabatan)
 VALUES(2,'justin', 'marketing manager' ),
        (3,'bob', 'staff'),
        (4,'asep', 'engineering manager');
        
-- Masukkan data ke tabel pegawai_detail dan 
INSERT INTO pegawai_detail (id, alamat, telepon, pegawai_id)
VALUES (5, 'Jalan WESR No. 3', '081275467890', 5);
INSERT INTO pegawai_detail (id, alamat, telepon, pegawai_id)
VALUES (2, 'Jalan riau No. 66', '085784784789', 2),
       (3, 'Jalan aceh No. 12', '081987456321', 3),
       (4, 'Jalan merdeka No. 45', '089632587412', 4);

--hubungkan dengan pegawai
SELECT pegawai.id, pegawai.nama, pegawai_detail.alamat, pegawai_detail.telepon
FROM pegawai
JOIN pegawai_detail ON pegawai.id = pegawai_detail.pegawai_id;


------------------------------------------------------------------------------------------------------------------


-- one to many
CREATE TABLE kategori (
    id INT PRIMARY KEY,
    nama_kategori VARCHAR
);

CREATE TABLE produk (
    id INT PRIMARY KEY,
    nama_produk VARCHAR(255),
    kategori_id INT,
    FOREIGN KEY (kategori_id) REFERENCES kategori(id)
);

--masukan data ke kategori
INSERT INTO kategori (id, nama_kategori)
VALUES (1, 'Elektronik'),
       (2, 'Pakaian'),
       (3, 'Makanan');

--masukan data ke produk
INSERT INTO produk (id, nama_produk, kategori_id)
VALUES (1, 'Laptop', 1),
       (2, 'Kaos Oversize', 2),
       (3, 'Seblak', 3);

--hubungkan dengan kategori
SELECT kategori_id, kategori.nama_kategori, produk.nama_produk
FROM kategori
JOIN produk ON kategori.id = produk.kategori_id;


------------------------------------------------------------------------------------------------------------------


--many to many
CREATE TABLE siswa (
    id INT PRIMARY KEY,
    nama_siswa VARCHAR(255)
);

CREATE TABLE mata_pelajaran (
    id INT PRIMARY KEY,
    nama_pelajaran VARCHAR(255)
);

CREATE TABLE siswa_mata_pelajaran (
    siswa_id INT,
    mata_pelajaran_id INT,
    FOREIGN KEY (siswa_id) REFERENCES siswa(id),
    FOREIGN KEY (mata_pelajaran_id) REFERENCES mata_pelajaran(id),
    PRIMARY KEY (siswa_id, mata_pelajaran_id)
);

-- Menyisipkan data ke tabel "siswa"
INSERT INTO siswa (id, nama_siswa) VALUES
(1, 'Siswa 1'),
(2, 'Siswa 2'),
(3, 'Siswa 3');

-- Menyisipkan data ke tabel "mata_pelajaran"
INSERT INTO mata_pelajaran (id, nama_pelajaran) VALUES
(1, 'Matematika'),
(2, 'Bahasa Inggris'),
(3, 'Fisika');

-- Menyisipkan data ke tabel "siswa_mata_pelajaran"
INSERT INTO siswa_mata_pelajaran (siswa_id, mata_pelajaran_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 2),
(3, 3);

--hubungkan dengan siswa dan mata_pelajaran
SELECT *
FROM siswa
JOIN siswa_mata_pelajaran ON siswa.id = siswa_mata_pelajaran.siswa_id
JOIN mata_pelajaran ON mata_pelajaran.id = siswa_mata_pelajaran.mata_pelajaran_id;


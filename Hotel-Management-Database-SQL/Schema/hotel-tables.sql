CREATE DATABASE dbhotel;
SET SQL_SAFE_UPDATES = 0;

-- Tabel Tamu
CREATE TABLE Tamu (
    id_tamu VARCHAR(50) PRIMARY KEY,
    nama_tamu VARCHAR(100) NOT NULL,
    alamat VARCHAR(255),
    no_telp VARCHAR(15),
    jenis_kelamin ENUM('Laki-laki', 'Perempuan'), 
    negara_asal VARCHAR(50)
);

-- Tabel Kamar
CREATE TABLE Kamar (
    id_kamar VARCHAR(50) PRIMARY KEY,
    tipe_kamar ENUM('Standard', 'Deluxe', 'Suite'),
    no_kamar INT UNIQUE NOT NULL,
    lantai_kamar INT,
    kapasitas_kamar VARCHAR(10) ,
    status_kamar ENUM('Tersedia', 'Dipesan'),
    harga_kamar DECIMAL(10, 2)
);

-- Tabel Reservasi
CREATE TABLE Reservasi (
    id_reservasi VARCHAR(50) PRIMARY KEY,
    id_tamu VARCHAR(50),
    id_kamar VARCHAR(50),
    tanggal_checkin DATE NOT NULL,
    tanggal_checkout DATE NOT NULL,
    tipe_kamar ENUM('Standard', 'Deluxe', 'Suite'),
    jumlah_tamu VARCHAR(10),
    metode_reservasi VARCHAR(50),
    FOREIGN KEY (id_tamu) REFERENCES Tamu(id_tamu),
    FOREIGN KEY (id_kamar) REFERENCES Kamar(id_kamar)
);


-- Tabel Pembayaran
CREATE TABLE Pembayaran (
    id_pembayaran VARCHAR(50) PRIMARY KEY,
    id_reservasi VARCHAR(50),
    jumlah_pembayaran DECIMAL(10, 2) NOT NULL,
    tgl_pembayaran DATE NOT NULL,
    metode_pembayaran ENUM('Kartu Kredit', 'Tunai', 'Kartu Debit', 'Transfer Bank') NOT NULL,
    total_pembayaran DECIMAL(10, 2),
    FOREIGN KEY (id_reservasi) REFERENCES Reservasi(id_reservasi)
);


CREATE TABLE Ulasan (
    id_ulasan VARCHAR(50) PRIMARY KEY,
    id_tamu VARCHAR(50),
    id_kamar VARCHAR(50),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    komentar TEXT,
    FOREIGN KEY (id_tamu) REFERENCES Tamu(id_tamu),
    FOREIGN KEY (id_kamar) REFERENCES Kamar(id_kamar)
);


CREATE TABLE daftar_Layanan (
    id_layanan VARCHAR(50) PRIMARY KEY,
    nama_layanan VARCHAR(100) NOT NULL,
    deskripsi_layanan TEXT,
    biaya_layanan DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Penggunaan_Layanan (
    id_penggunaan VARCHAR(50) PRIMARY KEY,
    id_reservasi VARCHAR(50),
    id_layanan VARCHAR(50),
    tanggal_penggunaan DATE NOT NULL,
    jumlah DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_reservasi) REFERENCES reservasi(id_reservasi),
    FOREIGN KEY (id_layanan) REFERENCES daftar_layanan(id_layanan)
);



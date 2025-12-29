SELECT Tamu.nama_tamu, Kamar.no_kamar
FROM Tamu
JOIN Ulasan ON Tamu.id_tamu = Ulasan.id_tamu
JOIN Kamar ON Ulasan.id_kamar = Kamar.id_kamar
WHERE Ulasan.rating = (
    SELECT MAX(rating) FROM Ulasan
);

SELECT tipe_kamar
FROM Kamar
WHERE tipe_kamar = (
    SELECT tipe_kamar
    FROM Reservasi
    GROUP BY tipe_kamar
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

SELECT nama_tamu
FROM Tamu
WHERE id_tamu IN (
    SELECT id_tamu
    FROM Reservasi
    GROUP BY id_tamu
    HAVING COUNT(DISTINCT tipe_kamar) = 1 AND MIN(tipe_kamar) = 'Suite'
);




SELECT nama_tamu
FROM Tamu
WHERE id_tamu IN (
    SELECT id_tamu
    FROM Reservasi
    WHERE DATEDIFF(tanggal_checkout, tanggal_checkin) > 7
);


SELECT id_pembayaran, jumlah_pembayaran, tgl_pembayaran, metode_pembayaran
FROM Pembayaran
WHERE jumlah_pembayaran > (
    SELECT AVG(jumlah_pembayaran) FROM Pembayaran
);


SELECT nama_tamu, (
    SELECT SUM(jumlah)
    FROM Penggunaan_Layanan
    JOIN Reservasi ON Penggunaan_Layanan.id_reservasi = Reservasi.id_reservasi
    WHERE Reservasi.id_tamu = Tamu.id_tamu
) AS total_pengeluaran_layanan
FROM Tamu;


SELECT nama_tamu
FROM Tamu
WHERE id_tamu IN (
    SELECT Reservasi.id_tamu
    FROM Pembayaran
    JOIN Reservasi ON Pembayaran.id_reservasi = Reservasi.id_reservasi
    WHERE metode_pembayaran = 'Kartu Kredit'
);


SELECT id_pembayaran, jumlah_pembayaran, tgl_pembayaran, metode_pembayaran
FROM Pembayaran
WHERE jumlah_pembayaran > (
    SELECT AVG(jumlah_pembayaran) FROM Pembayaran
);


SELECT nama_tamu
FROM Tamu
WHERE id_tamu IN (
    SELECT id_tamu
    FROM Reservasi
    GROUP BY id_tamu
    HAVING COUNT(DISTINCT tipe_kamar) = 1
);

SELECT no_kamar
FROM Kamar
WHERE id_kamar = (
    SELECT id_kamar
    FROM Ulasan
    WHERE rating = 5
    GROUP BY id_kamar
    ORDER BY COUNT(*) DESC
    LIMIT 1
);



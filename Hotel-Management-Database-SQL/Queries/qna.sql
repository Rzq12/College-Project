-- diskon berdasarkan metode reservasi
SELECT 
    Reservasi.id_reservasi,
    Kamar.harga_kamar,
    DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) AS lama_menginap,
    DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar AS total_sebelum_diskon,
    CASE 
        WHEN Reservasi.metode_reservasi = 'Agoda' THEN 0.15 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        WHEN Reservasi.metode_reservasi = 'Tiket.com' THEN 0.10 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        WHEN Reservasi.metode_reservasi = 'Traveloka' THEN 0.12 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        ELSE 0
    END AS jumlah_diskon,
    (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar) - 
    CASE 
        WHEN Reservasi.metode_reservasi = 'Agoda' THEN 0.15 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        WHEN Reservasi.metode_reservasi = 'Tiket.com' THEN 0.10 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        WHEN Reservasi.metode_reservasi = 'Traveloka' THEN 0.12 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        ELSE 0
    END AS total_setelah_diskon
FROM Reservasi
JOIN Kamar ON Reservasi.id_kamar = Kamar.id_kamar;


-- diskon berdasarkan lama menginap
SELECT 
    Reservasi.id_reservasi,
    Reservasi.tanggal_checkin,
    Reservasi.tanggal_checkout,
    Kamar.harga_kamar,
    DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) AS lama_menginap,
    DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar AS total_sebelum_diskon,
    CASE 
        WHEN DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) > 10 THEN 0.20 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        WHEN DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) BETWEEN 6 AND 10 THEN 0.15 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        WHEN DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) BETWEEN 3 AND 5 THEN 0.10 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        ELSE 0
    END AS jumlah_diskon,
    (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar) - 
    CASE 
        WHEN DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) > 10 THEN 0.20 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        WHEN DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) BETWEEN 6 AND 10 THEN 0.15 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        WHEN DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) BETWEEN 3 AND 5 THEN 0.10 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        ELSE 0
    END AS total_setelah_diskon
FROM Reservasi
JOIN Kamar ON Reservasi.id_kamar = Kamar.id_kamar;




-- gabungan kedua nya
SELECT 
    Reservasi.id_reservasi,
    Reservasi.id_tamu,
    Reservasi.id_kamar,
    Reservasi.tanggal_checkin,
    Reservasi.tanggal_checkout,
    Kamar.harga_kamar,
    DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) AS lama_menginap,
    DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar AS total_sebelum_diskon,
    
    -- Diskon berdasarkan metode reservasi
    CASE 
        WHEN Reservasi.metode_reservasi = 'Agoda' THEN 0.15 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        WHEN Reservasi.metode_reservasi = 'Tiket.com' THEN 0.10 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        WHEN Reservasi.metode_reservasi = 'Traveloka' THEN 0.12 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        ELSE 0
    END AS diskon_metode_reservasi,

    -- Diskon berdasarkan lama menginap
    CASE 
        WHEN DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) > 10 THEN 0.20 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        WHEN DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) BETWEEN 6 AND 10 THEN 0.15 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        WHEN DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) BETWEEN 3 AND 5 THEN 0.10 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        ELSE 0
    END AS diskon_lama_menginap,

    -- Total diskon
    CASE 
        WHEN Reservasi.metode_reservasi = 'Agoda' THEN 0.15 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        WHEN Reservasi.metode_reservasi = 'Tiket.com' THEN 0.10 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        WHEN Reservasi.metode_reservasi = 'Traveloka' THEN 0.12 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        ELSE 0
    END +
    CASE 
        WHEN DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) > 10 THEN 0.20 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        WHEN DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) BETWEEN 6 AND 10 THEN 0.15 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        WHEN DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) BETWEEN 3 AND 5 THEN 0.10 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
        ELSE 0
    END AS total_diskon,

    -- Total setelah diskon
    (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar) - 
    (
        CASE 
            WHEN Reservasi.metode_reservasi = 'Agoda' THEN 0.15 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
            WHEN Reservasi.metode_reservasi = 'Tiket.com' THEN 0.10 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
            WHEN Reservasi.metode_reservasi = 'Traveloka' THEN 0.12 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
            ELSE 0
        END +
        CASE 
            WHEN DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) > 10 THEN 0.20 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
            WHEN DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) BETWEEN 6 AND 10 THEN 0.15 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
            WHEN DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) BETWEEN 3 AND 5 THEN 0.10 * (DATEDIFF(Reservasi.tanggal_checkout, Reservasi.tanggal_checkin) * Kamar.harga_kamar)
            ELSE 0
        END
    ) AS total_setelah_diskon

FROM Reservasi
JOIN Kamar ON Reservasi.id_kamar = Kamar.id_kamar;
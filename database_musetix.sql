CREATE TABLE users (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nama_depan VARCHAR(50),
    nama_belakang VARCHAR(50),
    biografi TEXT,
    gambar_profil VARCHAR(255),
    link_komunitas VARCHAR(255)
);

CREATE TABLE events (
    id_event INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    judul_event VARCHAR(255) NOT NULL,
    deskripsi TEXT,
    kategori_event ENUM('Konser', 'Teater', 'Orkestra') NOT NULL,
    tanggal DATE NOT NULL,
    waktu TIME NOT NULL,
    lokasi VARCHAR(255) NOT NULL,
    kapasitas INT NOT NULL,
    harga DECIMAL(10, 2),
    gambar_event VARCHAR(255),
    status ENUM('Aktif', 'Tidak Aktif', 'Dibatalkan') DEFAULT 'Aktif',
    jumlah_tiket INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES users(id_user) ON DELETE CASCADE
);


CREATE TABLE payment_methods (
    id_payment INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    id_event INT NOT NULL,
    jenis_metode ENUM('Kartu Kredit/Debit', 'Virtual Account', 'QR Code') NOT NULL,
    nomor_transaksi VARCHAR(255) NOT NULL UNIQUE,
    jumlah DECIMAL(10, 2) NOT NULL,
    status_pembayaran ENUM('Berhasil', 'Gagal', 'Menunggu') DEFAULT 'Menunggu',
    tanggal_pembayaran DATETIME NOT NULL,
    FOREIGN KEY (id_user) REFERENCES users(id_user) ON DELETE CASCADE,
    FOREIGN KEY (id_event) REFERENCES events(id_event) ON DELETE CASCADE
);


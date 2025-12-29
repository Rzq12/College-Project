# 🏨 Hotel Management Database System

A hotel management database system built using MySQL to manage guest data, rooms, reservations, payments, reviews, and hotel services.

## 📋 Table of Contents

- [About the Project](#-about-the-project)
- [Technologies](#-technologies)
- [Database Structure](#-database-structure)
- [Relationship Model](#-relationship-model)
- [Folder Structure](#-folder-structure)
- [Installation](#-installation)
- [Available Queries](#-available-queries)
- [Discount Schema](#-discount-schema)

## 📖 About the Project

This project is a database system implementation for hotel management that includes:

- Hotel guest data management
- Room and room type management
- Reservation system with various booking methods
- Multi-method payment processing
- Review and rating system
- Additional hotel services (Gym, Laundry, Spa)
- Automatic discount calculation

## 🛠 Technologies

- **Database**: MySQL
- **Tools**: MySQL Workbench
- **Data Format**: CSV

## 🗃 Database Structure

### Main Tables

| Table                | Description                  |
| -------------------- | ---------------------------- |
| `Tamu`               | Stores hotel guest data      |
| `Kamar`              | Room information and pricing |
| `Reservasi`          | Room booking data            |
| `Pembayaran`         | Payment transactions         |
| `Ulasan`             | Guest reviews and ratings    |
| `daftar_Layanan`     | List of hotel services       |
| `Penggunaan_Layanan` | Service usage by guests      |

### Table Details

#### 1. Tamu

| Column        | Data Type    | Description       |
| ------------- | ------------ | ----------------- |
| id_tamu       | VARCHAR(50)  | Primary Key       |
| nama_tamu     | VARCHAR(100) | Full name         |
| alamat        | VARCHAR(255) | Address           |
| no_telp       | VARCHAR(15)  | Phone number      |
| jenis_kelamin | ENUM         | Male/Female       |
| negara_asal   | VARCHAR(50)  | Country of origin |

#### 2. Kamar

| Column          | Data Type     | Description           |
| --------------- | ------------- | --------------------- |
| id_kamar        | VARCHAR(50)   | Primary Key           |
| tipe_kamar      | ENUM          | Standard/Deluxe/Suite |
| no_kamar        | INT           | Room number (Unique)  |
| lantai_kamar    | INT           | Floor                 |
| kapasitas_kamar | VARCHAR(10)   | Capacity              |
| status_kamar    | ENUM          | Available/Booked      |
| harga_kamar     | DECIMAL(10,2) | Price per night       |

#### 3. Reservasi

| Column           | Data Type   | Description         |
| ---------------- | ----------- | ------------------- |
| id_reservasi     | VARCHAR(50) | Primary Key         |
| id_tamu          | VARCHAR(50) | Foreign Key → Tamu  |
| id_kamar         | VARCHAR(50) | Foreign Key → Kamar |
| tanggal_checkin  | DATE        | Check-in date       |
| tanggal_checkout | DATE        | Check-out date      |
| tipe_kamar       | ENUM        | Room type           |
| jumlah_tamu      | VARCHAR(10) | Number of guests    |
| metode_reservasi | VARCHAR(50) | Booking platform    |

#### 4. Pembayaran

| Column            | Data Type     | Description                               |
| ----------------- | ------------- | ----------------------------------------- |
| id_pembayaran     | VARCHAR(50)   | Primary Key                               |
| id_reservasi      | VARCHAR(50)   | Foreign Key → Reservasi                   |
| jumlah_pembayaran | DECIMAL(10,2) | Payment amount                            |
| tgl_pembayaran    | DATE          | Payment date                              |
| metode_pembayaran | ENUM          | Credit Card/Cash/Debit Card/Bank Transfer |
| total_pembayaran  | DECIMAL(10,2) | Total                                     |

#### 5. Ulasan

| Column    | Data Type   | Description         |
| --------- | ----------- | ------------------- |
| id_ulasan | VARCHAR(50) | Primary Key         |
| id_tamu   | VARCHAR(50) | Foreign Key → Tamu  |
| id_kamar  | VARCHAR(50) | Foreign Key → Kamar |
| rating    | INT         | Rating 1-5          |
| komentar  | TEXT        | Comment             |

#### 6. daftar_Layanan

| Column            | Data Type     | Description  |
| ----------------- | ------------- | ------------ |
| id_layanan        | VARCHAR(50)   | Primary Key  |
| nama_layanan      | VARCHAR(100)  | Service name |
| deskripsi_layanan | TEXT          | Description  |
| biaya_layanan     | DECIMAL(10,2) | Cost         |

#### 7. Penggunaan_Layanan

| Column             | Data Type     | Description                  |
| ------------------ | ------------- | ---------------------------- |
| id_penggunaan      | VARCHAR(50)   | Primary Key                  |
| id_reservasi       | VARCHAR(50)   | Foreign Key → Reservasi      |
| id_layanan         | VARCHAR(50)   | Foreign Key → daftar_Layanan |
| tanggal_penggunaan | DATE          | Usage date                   |
| jumlah             | DECIMAL(10,2) | Total cost                   |

## 🔗 Relationship Model

![Database Relationship Model](Image/Relation_Model.png)

**Relationship Explanation:**

1. **Tamu → Reservasi** (1:N): One guest can have many reservations
2. **Tamu → Ulasan** (1:N): One guest can give many reviews
3. **Kamar → Reservasi** (1:N): One room can have many reservations
4. **Kamar → Ulasan** (1:N): One room can have many reviews
5. **Reservasi → Pembayaran** (1:N): One reservation can have many payments
6. **Reservasi → Penggunaan_Layanan** (1:N): One reservation can use many services
7. **daftar_Layanan → Penggunaan_Layanan** (1:N): One service can be used multiple times

```

## 📁 Folder Structure

Hotel-Management-Database-SQL/
│
├── 📂 Data/ # CSV files for data import
│ ├── Guests.csv # Guest data
│ ├── Rooms.csv # Room data
│ ├── Reservations.csv # Reservation data
│ ├── Payment.csv # Payment data
│ ├── Review.csv # Review data
│ ├── Services.csv # Service data
│ └── Services_Usage.csv # Service usage data
│
├── 📂 Image/ # Documentation images
│ └── model relasi.png # ERD Diagram
│
├── 📂 Queries/ # SQL query files
│ ├── case_study.sql # Case study queries
│ └── qna.sql # Discount calculation queries
│
├── 📂 Schema/ # Database schema
│ └── hotel-tables.sql # DDL for creating tables
│
└── README.md # Project documentation

```

## 🚀 Installation

### Prerequisites

- MySQL Server 8.0+
- MySQL Workbench

### Installation Steps

1. **Clone or download this project**

2. **Open MySQL Workbench** and create a connection to MySQL Server

3. **Run the script to create database and tables**

   ```sql
   -- Open file Schema/hotel-tables.sql
   -- Execute the entire script
   ```

````

4. **Import data from CSV files**

   - Right-click on the table → Table Data Import Wizard
   - Select the appropriate CSV file from the `Data/` folder
   - Import data to each table

5. **Verify the data**
   ```sql
   SELECT COUNT(*) FROM Tamu;
   SELECT COUNT(*) FROM Kamar;
   SELECT COUNT(*) FROM Reservasi;
   ```

## 📊 Available Queries

### Case Study (`case_study.sql`)

| No  | Query                      | Description                                |
| --- | -------------------------- | ------------------------------------------ |
| 1   | Guests with highest rating | Display guests who gave maximum rating     |
| 2   | Most popular room type     | Room type with the most reservations       |
| 3   | Exclusive Suite guests     | Guests who only booked Suite rooms         |
| 4   | Guests staying >7 days     | Guests with stay duration more than a week |
| 5   | Above average payments     | Transactions with amount above average     |
| 6   | Total service expenditure  | Total service usage per guest              |
| 7   | Credit card paying guests  | Guests who paid with credit card           |
| 8   | Most 5-star rated rooms    | Rooms with the most 5-star reviews         |

### Discount Calculation (`qna.sql`)

Queries to calculate discounts based on reservation method and length of stay.

## 💰 Discount Schema

### Discount by Reservation Method

| Platform       | Discount |
| -------------- | -------- |
| Agoda          | 15%      |
| Traveloka      | 12%      |
| Tiket.com      | 10%      |
| Hotel (direct) | 0%       |

### Discount by Length of Stay

| Duration  | Discount |
| --------- | -------- |
| > 10 days | 20%      |
| 6-10 days | 15%      |
| 3-5 days  | 10%      |
| < 3 hari  | 0%       |

> **Note**: Both discounts can be combined (cumulative).

---

## 📝 License

This project was created for learning purposes and college assignments.
````

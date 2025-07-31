# 📊 StaDPro Analyst

**StaDPro Analyst** is a GUI-based statistical analysis application developed using the **R** programming language. This application enables users to perform **Descriptive Statistics** and **Probability Analysis** through an interactive and intuitive interface.

---

## 🧰 Technologies Used

- **Programming Language:** R
- **Key Libraries:**
  - `tcltk` – for building the graphical user interface
  - `tcltk2` – additional GUI elements
  - `DescTools` – descriptive statistical functions

---

## 🎯 Key Features

### ✅ Descriptive Statistics

- Calculates mean, median, mode, variance, standard deviation, and more.
- Analysis results are displayed directly in the GUI.

### 🎲 Probability Analysis

**Discrete Distributions:**

- Binomial
- Geometric
- Hypergeometric
- Poisson
- Negative Binomial

**Continuous Distributions:**

- Normal
- Chi-Square (χ²)
- Student's T
- Fisher's F

### 📊 Data Visualization

- Displays visual representations such as histograms and bar charts (if available).

---

## 📥 Data Input

- **Manual:** Input data directly through the GUI form.
- **Import File:**
  - Supports **CSV (.csv)** and **Excel (.xlsx)** formats
  - Header in the first row is recommended
  - Data must be in tabular format (columns as variables)

---

## 📚 User Guide

1. Open the `StaDPro_Analyst.R` file using R or RStudio.
2. Run the entire script:
   ```r
   source("StaDPro_Analyst.R")
   ```
3. The GUI will launch automatically.
4. Enter data manually or import from file.
5. Choose the desired analysis feature.
6. Results will be displayed directly in the GUI window.

---

## 🧑‍💻 Development Team

| Name                       |
| -------------------------- |
| Nur Azizah                 |
| Ezha Easyfa Wieldyanisa    |
| Yoga Setya Wibawa          |
| Riezqi Dhermatria Rachmadi |

---

## 🧑‍🏫 Supervising Lecturers

- Dr. Nur Chamidah, S.Si., M.Si
- Dr. Toha Syaifudin, S.Si., M.Si

---

## 📸 Application Screenshots

| Dashboard                               | Probability Analysis                          | Discrete Distributions              | Continuous Distributions            |
| --------------------------------------- | --------------------------------------------- | ----------------------------------- | ----------------------------------- |
| ![Dashboard](Screenshots/Dashboard.png) | ![Probabilitas](Screenshots/Probabilitas.png) | ![Diskrit](Screenshots/Diskrit.png) | ![Kontinu](Screenshots/Kontinu.png) |

---

## 🚀 Installation & Running

### 1. Clone the Repository

```bash
git clone https://github.com/Rzq12/College-Project.git
cd StadPro-Analyst
```

### 2. Install Required Packages in R

```r
install.packages("tcltk2")
install.packages("DescTools")
```

> The `tcltk` package is included by default in R for Windows.

### 3. Run the Application

```r
source("StaDPro_Analyst.R")
```

---

## 📄 License

This application was created for academic and learning purposes. It is free to use and modify, as long as credit is given to the original developers.

---

## 💬 Contact

For questions or contributions, feel free to open an _issue_ or _pull request_ on this repository.

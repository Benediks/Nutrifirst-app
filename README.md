# NutriFirst — Capstone Project Coding Camp DBS Foundation × Dicoding 2026

**ID Tim Capstone Project:** CC26-PSU102

NutriFirst adalah platform personalisasi gizi berbasis web yang memadukan keahlian **Full-Stack Development**, **AI Engineering**, dan **Data Science** untuk memberikan rekomendasi menu makanan Indonesia berdasarkan **bahan utama** dan **budget**, dengan tujuan mendukung penanganan stunting melalui pemilihan menu bergizi yang ekonomis.

---

## 👥 Anggota Tim

| No | ID | Nama | Role |
|----|-----|------|------|
| 1 | CFCC185D6Y2119 | Benedictus Pascal Sanjaya | Full-Stack Web Developer |
| 2 | CFCC185D6Y2818 | Benediktus Geraldi | Full-Stack Web Developer |
| 3 | CDCC185D6Y2675 | Arel Lafito Dinoris | Data Scientist |
| 4 | CDCC185D6Y2746 | Jose Morinho Ngadio | Data Scientist |
| 5 | CACC126D6Y0062 | Farid Rilani Hakim | AI Engineer |
| 6 | CACC126D6Y0053 | Mahendra Agyal Kautsar | AI Engineer |

---

## 📋 Deskripsi Proyek

NutriFirst terdiri dari **tiga pilar** yang terintegrasi sebagai sistem microservices:

1. **Full-Stack Web Application**
   * Web interaktif React + Vite + Tailwind dengan UI dropdown bahan utama (Ayam/Sapi/Telur) dan rentang harga.
   * REST API Express.js + Prisma ORM (PostgreSQL) dengan autentikasi JWT melalui HttpOnly cookie.
   * Pencatatan riwayat prediksi user di database.

2. **AI / Deep Learning Engineering**
   * Neural Network "NutriScorer" arsitektur ResNet-style (TensorFlow Functional API).
   * Custom layer `CustomDenseLayer` yang serializable.
   * REST API inference FastAPI + Uvicorn dengan endpoint `/recommend` dan `/predict`.
   * Pre-computed AI score untuk seluruh menu (efisiensi response).
   * TensorBoard log untuk monitoring training.

3. **Data Science & Visualization**
   * Data wrangling end-to-end (Gathering, Assessing, Cleaning data gizi Indonesia).
   * Exploratory Data Analysis: korelasi harga vs protein, distribusi nutrisi, dll.
   * Dashboard Streamlit untuk visualisasi data publik.

---

## 📁 Struktur Repositori

```text
NutriFirst/
├── AImodelNutrifirst/              # Python Services (AI Engineer & Data Science)
│   ├── AI_Pipeline/
│   │   ├── AI_Model_NutriFirst.ipynb    # Notebook pelatihan model
│   │   ├── nutri_model.keras            # File model neural network (unduh dari Drive)
│   │   ├── scaler_nn.pkl                # File scaler MinMax (unduh dari Drive)
│   │   └── logs/                        # Log TensorBoard
│   ├── api_ai_model.py             # FastAPI Inference Service
│   ├── dashboard.py                # Dashboard Streamlit
│   ├── main_data.csv               # Dataset hasil wrangling
│   ├── nutrition_with_price.csv    # Dataset mentah
│   ├── requirements.txt            # Dependensi Python
│   └── README.md
│
├── backend/                        # REST API (Node.js + Express + Prisma)
│   ├── api/index.js                # Serverless entry point (Vercel)
│   ├── prisma/
│   │   ├── schema.prisma           # Schema database
│   │   └── migrations/             # SQL migration files (auto-generated)
│   ├── src/
│   │   ├── app.js                  # Express app + CORS + middleware
│   │   ├── server.js               # Local entry point
│   │   ├── lib/prisma.js           # Prisma client singleton
│   │   ├── controllers/            # auth.controller.js + recommend.controller.js
│   │   ├── middleware/             # auth.middleware.js (JWT verifier)
│   │   └── routes/                 # auth.routes.js + recommend.routes.js
│   ├── .env.example                # Template environment variables
│   └── package.json
│
├── frontend/                       # React Web Application
│   ├── src/
│   │   ├── api/axios.js            # HTTP client (withCredentials: true)
│   │   ├── context/AuthContext.jsx # Global auth state
│   │   ├── components/             # Header, Footer, Dropdown, ResultDisplay
│   │   ├── pages/                  # Home, OurProduct, AboutUs, Login, Register
│   │   ├── App.jsx                 # Router
│   │   └── main.jsx
│   ├── .env.example                # Template environment variables
│   ├── tailwind.config.js
│   ├── vite.config.js
│   └── package.json
│
├── .gitignore                      # Root gitignore (monorepo)
└── README.md                       # File ini
```

---

## 🛠️ Persyaratan Sistem (Prerequisites)

Sebelum mulai, pastikan semua tools berikut sudah terinstall di sistem Anda.

| Software | Versi yang Direkomendasikan | Link Download |
|----------|------------------------------|---------------|
| **Node.js** | v22.12.0 atau lebih baru (LTS) | <https://nodejs.org/> |
| **npm** | v10+ (bundled dengan Node.js) | — |
| **PostgreSQL** | v13.x | <https://www.postgresql.org/download/> |
| **Python** | v3.12.x | <https://www.python.org/downloads/> |
| **pip** | bundled dengan Python | — |
| **Git** | Latest | <https://git-scm.com/downloads> |

### Verifikasi Instalasi

Buka terminal/PowerShell dan jalankan:

```bash
node --version       # harus muncul: v22.x.x
npm --version        # harus muncul: 10.x.x
psql --version       # harus muncul: psql (PostgreSQL) 13.x
python --version     # harus muncul: Python 3.12.x
pip --version        # harus muncul versi pip
git --version        # harus muncul versi git
```

Kalau ada yang belum terinstall, install dulu sebelum lanjut.

---

## 📥 Persiapan Model AI (WAJIB Sebelum Menjalankan)

File model AI tidak ikut di-commit karena ukurannya besar. Unduh manual dari Google Drive berikut:

🔗 **[Download Model AI NutriFirst](https://drive.google.com/drive/folders/1tPR9K9CM5gO_rBTxl1cOLmTiPqq9p-Sq?usp=drive_link)**

Unduh dua file berikut:
- `nutri_model.keras`
- `scaler_nn.pkl`

Letakkan keduanya di folder:
```
AImodelNutrifirst/AI_Pipeline/
```

> ⚠️ **Catatan untuk reviewer Capstone:** Akun `capstone@student.devacademy.id` sudah diberi akses view & download untuk folder Drive di atas.

---

## 🚀 Panduan Instalasi & Cara Menjalankan

Proyek ini terdiri dari **3 services** yang harus jalan paralel di 3 terminal terpisah. Ikuti urutan di bawah.

### LANGKAH 0 — Clone Repository

```bash
git clone https://github.com/Equorax/Nutrifirst-app.git
cd Nutrifirst-app
```

> Atau download ZIP dari repository, lalu extract.

---

### LANGKAH 1 — Setup PostgreSQL Database

PostgreSQL **harus jalan** sebelum memulai backend.

#### A. Pastikan PostgreSQL service aktif

```bash
# Windows
pg_isready -h localhost -p 5432

# Output yang diharapkan:
# localhost:5432 - accepting connections
```

#### B. Buat user dan database

Login sebagai superuser `postgres`:

```bash
psql -U postgres
```

Lalu jalankan SQL berikut di dalam psql:

```sql
-- 1. Buat user khusus aplikasi
CREATE USER nutrifirst_app WITH PASSWORD 'nutrifirst123$$';

-- 2. Buat database
CREATE DATABASE nutrifirst OWNER nutrifirst_app;

-- 3. Grant permission CREATEDB (untuk Prisma shadow database saat migrate)
ALTER USER nutrifirst_app CREATEDB;

-- 4. Grant koneksi
GRANT CONNECT ON DATABASE nutrifirst TO nutrifirst_app;

-- 5. Pindah ke database dan grant schema permissions
\c nutrifirst
GRANT USAGE, CREATE ON SCHEMA public TO nutrifirst_app;
ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO nutrifirst_app;
ALTER DEFAULT PRIVILEGES IN SCHEMA public
  GRANT USAGE, SELECT ON SEQUENCES TO nutrifirst_app;

\q
```

>  Anda bebas mengganti `nutrifirst123$$` dengan password lain — sesuaikan juga di `backend/.env`.

---

### LANGKAH 2 — AI Service (FastAPI Inference)

>  **Terminal 1 — Khusus AI Service**

#### A. Pindah ke folder AI Service

```bash/powershell
cd AImodelNutrifirst
```

#### B. (Opsional tapi direkomendasikan) Buat Python virtual environment

```bash/powershell
python -m venv venv

# Windows
.\venv\Scripts\activate

# macOS/Linux
source venv/bin/activate
```

#### C. Install dependensi Python

```bash/powershell
pip install -r requirements.txt
```

> 💡 Untuk Windows + Python 3.12, kalau ada error TensorFlow + Keras 3, install kompatibilitas:
> ```bash
> pip install tf-keras
> ```

#### D. Pastikan file model sudah diunduh

```bash/powershell
 AI_Pipeline/nutri_model.keras AI_Pipeline/scaler_nn.pkl
```

Kalau belum ada, kembali ke bagian **Persiapan Model AI** di atas.

#### E. Jalankan FastAPI server

```bash/powershell
uvicorn api_ai_model:app --reload --port 8000
```

✅ **AI Service ready** di:
- API: `http://localhost:8000`
- Swagger UI (test endpoint): `http://localhost:8000/docs`
- (Opsional) TensorBoard: `tensorboard --logdir AI_Pipeline/logs/fit` → `http://localhost:6006`

---

### LANGKAH 3 — Backend (Express + Prisma)

> 🪟 **Terminal 2 — Khusus Backend**

#### A. Pindah ke folder backend

```bash
cd backend
```

#### B. Install dependensi Node.js

```bash
npm install
```

#### C. Setup environment variables

Salin template `.env.example` menjadi `.env`:

```bash
# Windows PowerShell
Copy-Item .env.example .env

# Windows CMD
copy .env.example .env

# macOS/Linux
cp .env.example .env
```

Edit `.env` dan sesuaikan:

```env
DATABASE_URL="postgresql://nutrifirst_app:nutrifirst123$$@localhost:5432/nutrifirst?schema=public"
JWT_SECRET="<generate-string-acak-32-karakter>"
JWT_EXPIRES_IN="7d"
FRONTEND_URL="http://localhost:5173"
AI_SERVICE_URL="http://127.0.0.1:8000"
PORT=5000
NODE_ENV="development"
```

> 🔑 Generate `JWT_SECRET` acak:
> ```bash
> node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"
> ```

> ⚠️ **PENTING:** Gunakan `127.0.0.1` (bukan `localhost`) untuk `AI_SERVICE_URL` karena Node.js v22 fetch default ke IPv6 yang akan gagal konek ke FastAPI (IPv4-only).

#### D. Jalankan Prisma migration

Migration files sudah ter-commit di repo. Cukup apply ke database Anda:

```bash
npx prisma migrate deploy
npx prisma generate
```

Output yang diharapkan:
```
1 migration found in prisma/migrations
Applying migration `20260602082753_inisiasi_database`
The following migrations have been applied:
✔ Generated Prisma Client
```

> 💡 Kalau Anda ingin **start fresh** (development), gunakan:
> ```bash
> npx prisma migrate dev
> ```

#### E. Jalankan Express server

```bash
npm run dev
```

✅ **Backend ready** di:
- API: `http://localhost:5000`
- Health check: `http://localhost:5000/api/health`

---

### LANGKAH 4 — Frontend (React + Vite + Tailwind)

> 🪟 **Terminal 3 — Khusus Frontend**

#### A. Pindah ke folder frontend

```bash
cd frontend
```

#### B. Install dependensi Node.js

```bash
npm install
```

#### C. Setup environment variables

```bash
# Windows PowerShell
Copy-Item .env.example .env

# macOS/Linux
cp .env.example .env
```

Pastikan isi `.env`:

```env
VITE_API_URL=http://localhost:5000/api
```

#### D. Jalankan Vite dev server

```bash
npm run dev
```

✅ **Frontend ready** di: `http://localhost:5173`

---

## 🧪 Verifikasi Akhir

Buka browser ke `http://localhost:5173`, lalu:

1. Klik **Our Product** → diarahkan ke halaman login (protected route)
2. Klik **Daftar** → register akun baru dengan email valid + password ≥ 6 karakter
3. Otomatis diarahkan ke dashboard
4. Pilih **Bahan Utama**: Ayam, Sapi, atau Telur
5. Pilih **Range Harga**: `<= 10000` / `11000 - 15000` / dll
6. Klik **Cari Rekomendasi**
7. Hasil tampil: **1 menu terbaik + 4 alternatif** dengan gambar, skor AI, kategori, dan detail gizi

Jika muncul output di atas → semua layer terintegrasi dengan baik.

---

## 🔧 Troubleshooting

| Error | Penyebab | Solusi |
|-------|----------|--------|
| `AI Service tidak dapat dijangkau` | AI Service belum jalan / pakai `localhost` | Jalankan Terminal 1, ganti env var ke `127.0.0.1` |
| `P3014: shadow database` saat migrate | User DB tidak punya CREATEDB | `ALTER USER nutrifirst_app CREATEDB;` |
| `ECONNREFUSED 127.0.0.1:5432` | PostgreSQL service mati | Start service `postgresql-x64-13` |
| `CORS policy` di browser | `FRONTEND_URL` salah | Set persis `http://localhost:5173` (tanpa trailing slash) |
| Cookie tidak tersimpan setelah login | `withCredentials: false` | Pastikan Axios `withCredentials: true` + CORS `credentials: true` |
| `ModuleNotFoundError: keras.src.engine` | Model trained di Keras 2, runtime Keras 3 | `pip install tf-keras` lalu set env `TF_USE_LEGACY_KERAS=1` |

---

## 📡 Endpoint API Reference

### Auth Endpoints (Backend `http://localhost:5000/api`)

| Method | Endpoint | Auth | Body | Response |
|--------|----------|------|------|----------|
| POST | `/auth/register` | ❌ | `{ name, email, password }` | `{ message, user }` + set cookie |
| POST | `/auth/login` | ❌ | `{ email, password }` | `{ message, user }` + set cookie |
| POST | `/auth/logout` | ❌ | — | `{ message }` |
| GET | `/auth/me` | ✅ | — | `{ user }` |

### Recommend Endpoints (Backend `http://localhost:5000/api`)

| Method | Endpoint | Auth | Body | Response |
|--------|----------|------|------|----------|
| POST | `/recommend` | ✅ | `{ ingredient, priceRange }` | `{ menu_terbaik, alternatif }` |
| GET | `/recommend/history` | ✅ | — | `{ items }` (20 terakhir) |

### AI Service Endpoints (Direct `http://localhost:8000`)

| Method | Endpoint | Body | Response |
|--------|----------|------|----------|
| GET | `/` | — | Info service |
| POST | `/predict` | `{ calories, proteins, fat, carbohydrate, harga }` | `{ skor_regresi, kategori_kelayakan }` |
| POST | `/recommend` | `{ ingredient, priceRange }` | `{ menu_terbaik, alternatif }` |

---

## 🔗 Tautan Penting

| Resource | Link |
|----------|------|
| **Repository GitHub** | <https://github.com/Equorax/Nutrifirst-app.git> |
| **Streamlit Dashboard (Live)** | <https://nutrifirst-codebooster-codingcampdbs2026.streamlit.app> |
| **Model AI (Google Drive)** | <https://drive.google.com/drive/folders/1tPR9K9CM5gO_rBTxl1cOLmTiPqq9p-Sq?usp=drive_link> |

---

## ⚙️ Stack Teknologi

### Frontend
- React 18 + Vite (build tool)
- Tailwind CSS 3
- React Router DOM 7
- Axios (dengan `withCredentials: true`)
- React Icons

### Backend
- Node.js v22 + Express 5
- Prisma ORM v6 (PostgreSQL provider)
- JWT (`jsonwebtoken`) — disimpan di HttpOnly cookie
- bcrypt (password hashing)
- CORS dengan credentials enabled

### AI Service
- Python 3.12
- FastAPI + Uvicorn
- TensorFlow 2.x + Keras (Legacy mode via `tf-keras`)
- scikit-learn (untuk scaler)
- pandas, numpy

### Database
- PostgreSQL 13
- Schema dikelola via Prisma migrations

### Data Science Dashboard
- Streamlit
- pandas, matplotlib, seaborn, plotly
- Deployed ke Streamlit Cloud

---

## 📝 Lisensi

Project ini dibuat untuk kepentingan akademis Coding Camp DBS Foundation × Dicoding 2026 — Capstone Project Tim **CC26-PSU102**.

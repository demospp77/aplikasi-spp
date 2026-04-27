-- ============================================================
-- IMPORT DATA ORANG TUA KE TABEL public.guardians
-- Jalankan di Supabase Dashboard → SQL Editor
--
-- Catatan data:
--   - Kolom nik, alamat, no_hp, email semuanya NULL di sumber data
--   - Beberapa nama diduga nama siswa bukan orang tua:
--       'Adji  Pramudya Kautzar', 'Mochamad Faridz Rizaldi',
--       'Andrea Mayaqa Zharin' — periksa & hapus manual jika perlu
--   - Kemungkinan duplikat:
--       'A.Fatoni' / 'ahmad fatoni' / 'achmad fatoni'
--       'Sapr' / 'Sapri'
--       'MA''ANG' / 'Ma''ang'
-- ============================================================

-- ============================================================
-- LANGKAH 1: Tambah kolom yang belum ada di tabel guardians
-- ============================================================
ALTER TABLE public.guardians
  ADD COLUMN IF NOT EXISTS nik      TEXT,
  ADD COLUMN IF NOT EXISTS alamat   TEXT,
  ADD COLUMN IF NOT EXISTS hubungan TEXT;

-- ============================================================
-- LANGKAH 2: Insert data orang tua
-- ============================================================
INSERT INTO public.guardians (name, nik, alamat, phone, email, hubungan) VALUES
  ('Wahidin Tanu Wijaya',      NULL, NULL, NULL, NULL, NULL),
  ('Adji Pramudya Kautzar',    NULL, NULL, NULL, NULL, NULL),  -- diduga nama siswa, periksa
  ('Dede Zakaria Al Anshor',   NULL, NULL, NULL, NULL, NULL),
  ('Ade Sukma',                NULL, NULL, NULL, NULL, 'Ayah'),
  ('Saepuloh',                 NULL, NULL, NULL, NULL, 'Ayah'),
  ('Suratmin',                 NULL, NULL, NULL, NULL, 'Ayah'),
  ('Suparmi',                  NULL, NULL, NULL, NULL, 'Ibu'),
  ('Edhy Khoemantrio',         NULL, NULL, NULL, NULL, 'Ayah'),
  ('Sarpan',                   NULL, NULL, NULL, NULL, 'Ayah'),
  ('Istikomah',                NULL, NULL, NULL, NULL, 'Ibu'),
  ('Drs. Mamat Rachmat. Apt',  NULL, NULL, NULL, NULL, 'Ayah'),
  ('Naskardi',                 NULL, NULL, NULL, NULL, 'Ayah'),
  ('Eddy Wisman',              NULL, NULL, NULL, NULL, 'Ayah'),
  ('Prabu Wisnu Nugroho',      NULL, NULL, NULL, NULL, NULL),
  ('Muhammad Syamsudin',       NULL, NULL, NULL, NULL, 'Ayah'),
  ('Herdi Firmansyah',         NULL, NULL, NULL, NULL, 'Ayah'),
  ('Mohamad Syahrul Alam',     NULL, NULL, NULL, NULL, 'Ayah'),
  ('Sukardiyo',                NULL, NULL, NULL, NULL, 'Ayah'),
  ('Nurkudlis',                NULL, NULL, NULL, NULL, NULL),
  ('Edy Muliady',              NULL, NULL, NULL, NULL, 'Ayah'),
  ('Eko Swasono Timuryanto',   NULL, NULL, NULL, NULL, 'Ayah'),
  ('Novianto',                 NULL, NULL, NULL, NULL, NULL),
  ('Zumaroha',                 NULL, NULL, NULL, NULL, 'Ibu'),
  ('Ahmad Syalahuddin',        NULL, NULL, NULL, NULL, 'Ayah'),
  ('Sutardi',                  NULL, NULL, NULL, NULL, 'Ayah'),
  ('Narto',                    NULL, NULL, NULL, NULL, 'Ayah'),
  ('Nasrul',                   NULL, NULL, NULL, NULL, 'Ayah'),
  ('Abdul Holik',              NULL, NULL, NULL, NULL, 'Ayah'),
  ('Asep Rusman',              NULL, NULL, NULL, NULL, 'Ayah'),
  ('H. Adam Basyoni',          NULL, NULL, NULL, NULL, 'Ayah'),
  ('Suganda',                  NULL, NULL, NULL, NULL, 'Ayah'),
  ('Sumarno',                  NULL, NULL, NULL, NULL, 'Ayah'),
  ('Wardji',                   NULL, NULL, NULL, NULL, NULL),
  ('Suhayat',                  NULL, NULL, NULL, NULL, NULL),
  ('Abdul Somad',              NULL, NULL, NULL, NULL, NULL),
  ('Ilih',                     NULL, NULL, NULL, NULL, 'Ayah'),
  ('Machmud',                  NULL, NULL, NULL, NULL, 'Ayah'),
  ('Alm. Asmuni',              NULL, NULL, NULL, NULL, 'Ayah'),
  ('Mistati',                  NULL, NULL, NULL, NULL, 'Ibu'),
  ('Waluyo Sidiq',             NULL, NULL, NULL, NULL, 'Ayah'),
  ('Ferry Hasan',              NULL, NULL, NULL, NULL, 'Ayah'),
  ('Alm. Ade Taryana',         NULL, NULL, NULL, NULL, 'Ayah'),
  ('Kaseri',                   NULL, NULL, NULL, NULL, 'Ayah'),
  ('Marwani',                  NULL, NULL, NULL, NULL, 'Ayah'),
  ('A. Fatoni',                NULL, NULL, NULL, NULL, 'Ayah'),
  ('Nurhaini S.',              NULL, NULL, NULL, NULL, 'Ibu'),
  ('Supendi',                  NULL, NULL, NULL, NULL, NULL),
  ('Rahmat bin Suninta',       NULL, NULL, NULL, NULL, 'Ayah'),
  ('K. Dwiyanto',              NULL, NULL, NULL, NULL, 'Ayah'),
  ('Ahmad Indra Bangsawan',    NULL, NULL, NULL, NULL, NULL),
  ('Puji Basuki',              NULL, NULL, NULL, NULL, NULL),
  ('Sarto',                    NULL, NULL, NULL, NULL, NULL),
  ('Ahmad Fatoni',             NULL, NULL, NULL, NULL, NULL),  -- kemungkinan duplikat 'A. Fatoni'
  ('Achmad Fatoni',            NULL, NULL, NULL, NULL, NULL),  -- kemungkinan duplikat 'A. Fatoni'
  ('Arippudin',                NULL, NULL, NULL, NULL, NULL),
  ('Mustamil',                 NULL, NULL, NULL, NULL, NULL),
  ('Sapr',                     NULL, NULL, NULL, NULL, NULL),  -- kemungkinan duplikat 'Sapri'
  ('Sapri',                    NULL, NULL, NULL, NULL, NULL),
  ('Sanaca',                   NULL, NULL, NULL, NULL, NULL),
  ('Durahman',                 NULL, NULL, NULL, NULL, NULL),
  ('Moh. Lukni Maulana',       NULL, NULL, NULL, NULL, NULL),
  ('Sutikno',                  NULL, NULL, NULL, NULL, NULL),
  ('Karja Subekti',            NULL, NULL, NULL, NULL, NULL),
  ('Parjo',                    NULL, NULL, NULL, NULL, NULL),
  ('Ma''ang',                  NULL, NULL, NULL, NULL, NULL),  -- kemungkinan duplikat baris berikut
  ('Ma''ang',                  NULL, NULL, NULL, NULL, NULL),
  ('Andry',                    NULL, NULL, NULL, NULL, NULL),
  ('Muklis',                   NULL, NULL, NULL, NULL, NULL),
  ('Lasdon Manik',             NULL, NULL, NULL, NULL, NULL),
  ('Dadang Saepuloh',          NULL, NULL, NULL, NULL, NULL),
  ('Mochamad Faridz Rizaldi',  NULL, NULL, NULL, NULL, NULL),  -- diduga nama siswa, periksa
  ('Andrea Mayaqa Zharin',     NULL, NULL, NULL, NULL, NULL),  -- diduga nama siswa, periksa
  ('Mochamad Zacky',           NULL, NULL, NULL, NULL, NULL),
  ('Idris Ahmad',              NULL, NULL, NULL, NULL, NULL),
  ('DRS Urip Abdul Halim',     NULL, NULL, NULL, NULL, NULL);

-- ============================================================
-- Verifikasi hasil import
-- ============================================================
SELECT id, name, hubungan, phone, email
FROM public.guardians
ORDER BY name;

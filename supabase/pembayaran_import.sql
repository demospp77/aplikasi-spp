-- ============================================================
-- IMPORT ARSIP HISTORIS PEMBAYARAN INVOICE
-- Tabel standalone, tidak berelasi ke skema utama
-- Jalankan di Supabase Dashboard → SQL Editor
--
-- Catatan data:
--   - BYR.2403.0002: total_pembayaran -2200000 (nilai negatif dari sistem asal)
--   - BYR.2404.0006: total_pembayaran -450000   (nilai negatif dari sistem asal)
--   Kedua baris di atas disimpan apa adanya sebagai arsip historis.
-- ============================================================

DROP TABLE IF EXISTS public.pembayaran_invoice;

CREATE TABLE public.pembayaran_invoice (
  id               BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  no_pembayaran    TEXT,
  nama_siswa       TEXT,
  tanggal          DATE,
  orang_tua        TEXT,
  total_tagihan    NUMERIC(14,2),
  total_pembayaran NUMERIC(14,2),
  sisa_pembayaran  NUMERIC(14,2),
  operator         TEXT,
  status           TEXT,
  created_at       TIMESTAMPTZ NOT NULL DEFAULT now()
);

-- RLS: izinkan akses untuk authenticated user
ALTER TABLE public.pembayaran_invoice ENABLE ROW LEVEL SECURITY;
CREATE POLICY "all_authenticated_pembayaran_invoice" ON public.pembayaran_invoice
  FOR ALL TO authenticated USING (true) WITH CHECK (true);

GRANT SELECT, INSERT, UPDATE, DELETE ON public.pembayaran_invoice TO authenticated;
GRANT USAGE, SELECT ON SEQUENCE public.pembayaran_invoice_id_seq TO authenticated;

-- ============================================================
-- Data
-- ============================================================
INSERT INTO public.pembayaran_invoice (no_pembayaran, nama_siswa, tanggal, orang_tua, total_tagihan, total_pembayaran, sisa_pembayaran, operator, status) VALUES
  ('BYR.2403.0002', 'Abdullah Azizi Alfarizi',       '2024-03-20', 'A.Fatoni',    3700000,  -2200000, 5900000,  'Administrator', 'Terbayar Sebagian'), -- nilai negatif dari sistem asal
  ('BYR.2403.0003', 'Fiqry Ferdinan Nurhidayat',     '2024-03-21', 'Suhayat',     2000000,  NULL,     2000000,  'Administrator', 'Terbayar Sebagian'),
  ('BYR.2404.0004', 'Liri Ramadhina Fadillah Nasrul','2024-04-02', 'Naskardi',    2650000,  2650000,  NULL,     'Administrator', 'Lunas'),
  ('BYR.2404.0005', 'Luthfiyah Insaani',             '2024-04-02', 'Suratmin',    2250000,  2250000,  NULL,     'Administrator', 'Lunas'),
  ('BYR.2404.0006', 'Fardi Hamdan Kurnia',           '2024-04-02', 'Eddy Wisman', 3500000,  -450000,  3950000,  'Administrator', 'Terbayar Sebagian'), -- nilai negatif dari sistem asal
  ('BYR.2404.0007', 'Liri Ramadhina Fadillah Nasrul','2024-04-05', 'Naskardi',    1000000,  1000000,  NULL,     'Administrator', 'Lunas'),
  ('BYR.2404.0008', 'Annisa Yulianti',               '2024-04-06', 'K.dwiyanto',  13200000, 10200000, 3000000,  'Administrator', 'Terbayar Sebagian'),
  ('BYR.2404.0009', 'Annisa Yulianti',               '2024-03-09', 'K.dwiyanto',  4200000,  1200000,  3000000,  'Administrator', 'Terbayar Sebagian'),
  ('BYR.2404.0010', 'Fardi Hamdan Kurnia',           '2024-04-06', 'Eddy Wisman', 11900000, 3550000,  8350000,  'Administrator', 'Terbayar Sebagian'),
  ('BYR.2404.0011', 'Ahmad Sopian Sauri',            '2024-04-11', 'Sutardi',     45900000, 45200000, 700000,   'Administrator', 'Terbayar Sebagian');

-- Verifikasi
SELECT no_pembayaran, nama_siswa, tanggal, total_tagihan, total_pembayaran, sisa_pembayaran, status
FROM public.pembayaran_invoice
ORDER BY tanggal, no_pembayaran;

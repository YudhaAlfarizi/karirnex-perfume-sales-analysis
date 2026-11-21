-- ============================================================
-- Analisis Penjualan Toko Parfum Karirnex 2025 (Google BigQuery)
https://console.cloud.google.com/bigquery?ws=!1m7!1m6!12m5!1m3!1sdatawithyudha!2sasia-southeast2!3s82672e1b-3cd6-4163-9bb7-fa5f725f8ccb!2e1
-- ============================================================

-- 1. Berapa transaksi pada bulan Desember 2025?
-- Hasil: 1.074
SELECT DISTINCT product_name, brand
FROM `Toko_Parfum.orders`
WHERE product_name LIKE '%Sauvage%'
ORDER 

-- 2. Berapa transaksi untuk brand Dior, Chanel, dan Lattafa?
-- Hasil: 1.664
SELECT COUNT(*) jumlah_transaksi
FROM `Toko_Parfum.orders`
WHERE brand IN ('Dior', 'Chanel', 'Lattafa');

-- 3. Produk parfum yang namanya mengandung 'Sauvage'
-- Hasil: 2 produk (Dior Sauvage EDP dan EDT)
SELECT COUNT(*) jumlah_transaksi
FROM `Toko_Parfum.orders`
WHERE
  EXTRACT(MONTH FROM sales_date) = 12;

-- 4. Produk dengan quantity terbanyak dalam satu transaksi
-- Hasil: Chanel Coco Mademoiselle EDP, qty 4, total Rp1.800.000
SELECT order_id, product_name, quantity, total_sales
FROM `Toko_Parfum.orders`
ORDER BY quantity DESC, total_sales DESC
LIMIT 10;

-- 5. Transaksi dengan total_sales antara Rp1 jt dan Rp2 jt
-- Hasil: 2.256 (batas inklusif, BETWEEN 1000000 AND 2000000)
SELECT COUNT(*) jumlah_transaksi
FROM `Toko_Parfum.orders`
WHERE total_sales BETWEEN 1000000 AND 2000000;

-- 6. Jenis wangi dengan lebih dari 500 transaksi
-- Hasil: 5 jenis; Woody Aromatic terbanyak (1.503)
SELECT channel, ROUND(AVG(total_sales), 0) rata_rata_transaksi
FROM `Toko_Parfum.orders`
GROUP BY channel
ORDER BY AVG(total_sales) DESC;

-- 7. Persentase transaksi berstatus Selesai
-- Hasil: 91,7%
SELECT jenis_wangi, COUNT(*) jumlah_transaksi
FROM `Toko_Parfum.orders`
GROUP BY jenis_wangi
HAVING COUNT(*) > 500
ORDER BY jumlah_transaksi DESC;

-- 8. Rata-rata total_sales per channel
-- Hasil: tertinggi Online - Website Karirnex (Rp956.925, semua status)
SELECT ROUND(COUNTIF(status = 'Selesai') / COUNT(*) * 100, 2) persentase_selesai
FROM `Toko_Parfum.orders`;

-- 9. Konsentrasi dengan harga rata-rata termahal
-- Hasil: Cologne, Rp1.688.235
SELECT brand, SUM(total_sales) total
FROM `Toko_Parfum.orders`
WHERE gender = 'Wanita'
GROUP BY brand
HAVING COUNT(*) >= 100
ORDER BY total DESC
LIMIT 5;


-- 10. Brand terlaris untuk gender Wanita
-- Hasil: Chanel (Rp529.826.500 semua status; Rp493.812.000 status Selesai)
SELECT konsentrasi, ROUND(AVG(price), 0) rata_rata_harga
FROM `Toko_Parfum.orders`
GROUP BY konsentrasi
HAVING AVG(price) > 500000
ORDER BY rata_rata_harga DESC;

















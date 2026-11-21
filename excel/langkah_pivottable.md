# Analisis Excel (PivotTable)

## 1. Seberapa besar order retur, dibatalkan, dan Gross sales?
**Langkah:** PivotTable, Rows = `status`, Values = Count of `order_id` dan Sum of `total_sales`.

**Hasil:** Retur 436 order, dibatalkan 394 order, Gross sales Rp9.172.438.800.

**Insight:** Retur + dibatalkan = 830 order senilai Rp786,7 jt (8,58% dari Gross) yang tidak masuk omzet.

## 2. Berapa Net sales dan AOV?
**Langkah:** PivotTable dengan filter `status` = Selesai. Values = Sum of `total_sales` (Net sales), lalu ubah ke Average of `total_sales` (AOV).

**Hasil:** Net sales Rp8.385.708.450, AOV Rp914.472.

## 3. Gender mana yang Net sales-nya terbesar?
**Langkah:** Filter `status` = Selesai, Rows = `gender`, Values = Sum of `total_sales`, lalu Show Values As > % of Grand Total.

**Hasil:** Pria terbesar, Rp4.274.472.800 atau 50,97% dari Net total.

## 4. Kombinasi gender x konsentrasi terbesar?
**Langkah:** Filter `status` = Selesai, Rows = `gender`, Columns = `konsentrasi`, Values = Sum of `total_sales` (% of Grand Total).

**Hasil:** Pria + EDT terbesar (26,96%), lalu Wanita EDP (26,69%) dan Pria EDP (24,01%). Selisih peringkat 1 dan 2 hanya 0,27 poin persentase.

## 5. Channel mana yang jadi prioritas?
**Rekomendasi:** Offline - Toko Karirnex, dengan 33,85% Net sales (Rp2,84 M), lebih dari dua kali lipat channel kedua (Website Karirnex, 15,78%). Kontribusi qty-nya 33,79%, jadi datang dari banyaknya penjualan, bukan hanya harga.

**Risiko:** sepertiga omzet bergantung pada satu toko fisik.

**Batasan:** tidak ada biaya per channel (sewa, komisi, iklan), jadi prioritas ini berdasarkan omzet, bukan keuntungan.

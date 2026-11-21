# Data Dictionary

Dataset: penjualan Toko Parfum Karirnex (dummy), 10.000 baris, 19 kolom, periode 1 Jan - 31 Des 2025.
Dataset tidak disertakan di repositori ini.

| Kolom | Tipe | Keterangan |
|---|---|---|
| `sales_date` | tanggal | Tanggal transaksi |
| `order_id` | teks | ID order, format `KRX-PRF000001` |
| `customer_name` | teks | Nama pelanggan (anonim) |
| `product_name` | teks | Nama produk lengkap, mis. "Dior Sauvage EDP" |
| `brand` | teks | Merek parfum (20 brand) |
| `nama_wangi` | teks | Nama wangi, mis. "Sauvage" |
| `jenis_wangi` | teks | Keluarga aroma, mis. Woody Aromatic |
| `konsentrasi` | teks | Body Mist, Cologne, EDT, EDP, Extrait |
| `gender` | teks | Pria, Wanita, Unisex |
| `size_ml` | angka | Ukuran botol (ml) |
| `price` | angka | Harga satuan (Rp) |
| `quantity` | angka | Jumlah barang |
| `channel` | teks | Channel penjualan (6 channel) |
| `payment_method` | teks | Metode pembayaran |
| `discount` | teks | Diskon: 0%, 5%, 10%, 15%, 20% |
| `total` | angka | `price x quantity x (1 - discount)` |
| `shipping_fee` | angka | Ongkos kirim (Rp) |
| `total_sales` | angka | `total + shipping_fee` |
| `status` | teks | Selesai, Retur (Produk Rusak/Tidak Sesuai), Dibatalkan |

## Channel
Offline - Toko Karirnex · Online - Website Karirnex · Online - Marketplace Toko Biru · Online - Marketplace Toko Hijau · Online - Marketplace Instaria · Online - Live Toktok

## Definisi metrik
| Metrik | Definisi |
|---|---|
| Gross sales | Jumlah `total_sales` semua status |
| Net sales | Jumlah `total_sales` status **Selesai** |
| AOV | Rata-rata `total_sales` transaksi **Selesai** |

## Kualitas data
- Missing value: 0
- Baris duplikat: 0
- Rumus `total` dan `total_sales` konsisten di semua baris

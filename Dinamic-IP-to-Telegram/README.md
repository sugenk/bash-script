# Dinamic IP Address to Telegram Bot

kode singkat ini dibuat untuk cek alamat IP public dinamis (berubah tiap waktu) pada ISP IndoHome / Speedy dan mengirimkan notifikasi melalui bot telegram jika ada perubahan (diam jika tetap).

cara penggunaan :
di cronjob pada os linux kesayangan mu dirumah, misal tiap 5 menit

*/5 * * * * bash ~/chekip.sh > /dev/null 2>&1

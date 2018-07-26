# Dynamic IP Address to Telegram Bot

kode singkat ini dibuat untuk cek alamat IP public dinamis (berubah tiap waktu) pada ISP IndoHome / Speedy dan mengirimkan notifikasi melalui bot telegram jika ada perubahan (diam jika tetap). Kalamu dimanfaatkan yang lain misalnya untuk service Dynamic DNS, misal jika IP berubah lalu memerintahkan sesuatu ke DNS untuk memperbaharui alamat, atau untuk tujuan lain-lain juga bisa.

cara penggunaan :
di cronjob pada os linux kesayangan mu dirumah, misal tiap 5 menit

*/5 * * * * bash ~/checkip.sh > /dev/null 2>&1

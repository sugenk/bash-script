# Dynamic IP Address to Telegram Bot

kode singkat ini dibuat untuk cek alamat IP public dinamis (berubah tiap waktu) pada ISP IndoHome / Speedy dan mengirimkan notifikasi melalui bot telegram jika ada perubahan (diam jika tetap). Kalamu dimanfaatkan yang lain misalnya untuk service Dynamic DNS, misal jika IP berubah lalu memerintahkan sesuatu ke server DNS untuk memperbaharui alamat A record, atau untuk tujuan lain-lain juga bisa.

cara penggunaan :
di cronjob pada os linux kesayangan mu dirumah, misal tiap 5 menit

*/5 * * * * bash ~/checkip.sh > /dev/null 2>&1

Referensi :
- [askubuntu](https://askubuntu.com/questions/95910/command-for-determining-my-public-ip)
- [tecmint by Aaron Kili](https://www.tecmint.com/find-linux-server-public-ip-address/)
- [cyberciti by Vivek Gite](https://www.cyberciti.biz/faq/how-to-find-my-public-ip-address-from-command-line-on-a-linux/)
- [linuxjournal by Mitch Frazier](https://www.linuxjournal.com/content/validating-ip-address-bash-script)

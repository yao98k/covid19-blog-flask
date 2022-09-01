# covid19-blog-flask
 Flask Covid 19 Blog Site 

Kovid-19 hastalığı hakkında bilgilendirici içerik içeren bir web sitesidir. HTML, CSS ve Flask Framework kullanılarak geliştirilmiştir. MySQL veri tabanı ile bilgiler depolanmıştır.

Kurulması gereken python paketleri:
Flask framework pip install flask
WTForms pip install flask-WTF
requests pip install requests 
mysql  pip install flask-mysqldb
şifreleme için pip install passlib

Daha sonra app.py dosyası komut satırından ya da VS Code ile çalıştırılmalıdır. Bu işlemlerden sonra web tarayıcı adres satırına http://localhost:5000/  yazarak sitemize ulaşmış oluruz.

![Ana Sayfa](static/project-images/anasayfa.png?raw=true)

Templates klasörü altında sayfaların html dosyaları bulunmaktadır. Static altında ise projede kullanılan resimler yer almaktadır.
Covid19.sql dosyası, Xampp Control Panel’den MySQL kısmındaki admin sekmesine tıklayarak ulaşılabilecek phpmyadmin programından içe aktar sekmesinden yüklenmelidir.

Site İçeriği ve Fonksiyonlar

Site ilk açıldığında kayıt ol seçeneğinden kayıt yapılabilir. Bu hesapla giriş yaparak diğer fonksiyonlara ulaşabilirsiniz.
Kontrol paneli sekmesine tıklayarak, var olan makaleleri düzenleyebilir, ya da silebilirsiz. Aynı şekilde kavramları da silebilirsiniz.
Kontrol panelinden makale ve kavram ekleyebilirsiniz.
Makaleler ve haberler sekmesinden var olan makale ve haberleri görüntüleyebilirsiniz. Makale başlığına tıklamanız durumunda ise makalenin bütün içeriğini görebileceğin ayrıntılı bir sayfaya gidebilirsiniz.
Kavramlar sekmesindene var olan kavramları görüntüleyebilirsiniz.

![Kontrol Paneli](static/project-images/kontrol paneli.png?raw=true)


Kontrol paneli üzerinde makale ve kavram ekleyebilir ya da silebilirsiniz. Bu işlemler veri tabanını da etkileyeceğinden dikkatli olunması gerekmektedir.

Ana sayfadaki vakaların olduğu kısım "https://api.covid19api.com/live/country/turkey/status/confirmed"
adresindeki api ile alınmıştır.
Ana sayfada yer alan diğer bilgiler ise Sağlık Bakanlığı web sitesinin covid-19 ile ilgili sayfasından alınmıştır.

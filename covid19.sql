-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 04 Haz 2020, 09:50:16
-- Sunucu sürümü: 10.4.11-MariaDB
-- PHP Sürümü: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `covid19`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `author` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `articles`
--

INSERT INTO `articles` (`id`, `title`, `author`, `content`, `date`) VALUES
(3, 'Örnek 1', 'atakan', '<p>1. GİRİŞ</p>\r\n\r\n<p>SARS-CoV-2 enfeksiyonu salgını, D&uuml;nya Sağlık &Ouml;rg&uuml;t&uuml; (WHO) tarafından Coronavirus Hastalığı 2019 (COVID-19) olarak adlandırılmıştır. COVID-19 hızla bir&ccedil;ok &uuml;lkeye yayılmıştır ve 11 Mart 2020 tarihinde 4000&rsquo;den fazla insanın &ouml;l&uuml;m&uuml;ne yol a&ccedil;masıyla D&uuml;nya Sağlık &Ouml;rg&uuml;t&uuml; tarafından bu tarihte resmen pandemi olarak ilan edilmiştir (1). COVID-19 hastalığı yeni bir koronavir&uuml;s&uuml;n neden olduğu ve ilk olarak Aralık 2019&rsquo;da &Ccedil;in&rsquo;in Wuhan şehrinde tespit edilen bir solunum yolu hastalığıdır. Hastalık olduk&ccedil;a bulaşıcıdır ve ana klinik semptomları ateş, kuru &ouml;ks&uuml;r&uuml;k, yorgunluk, kas ağrısı ve nefes darlığıdır. &Ccedil;in&rsquo;in Wuhan şehrinde 2019 &lsquo;un sonunda ilk bildirilen COVID-19 vakasından bu yana, COVID19 hızla &Ccedil;in&rsquo;in her yerine ve ardından d&uuml;nyanın t&uuml;m &uuml;lkelerine yayılmıştır (2).</p>\r\n\r\n<p>1.1.Etyoloji</p>\r\n\r\n<p>Koronavir&uuml;sler (CoV), Coronaviridae familyasındaki Orthocoronavirinae alt familyasına ait olan tek zincirli, pozitif polariteli, zarflı RNA vir&uuml;sleridir. Orthocoronavirinae alt ailesi i&ccedil;inde, CoV&rsquo;lerin genomu zarflı, pozitif tek sarmallı RNA ve boyutu 26 kb ila 32 kb arasında değişen vir&uuml;slerdir. Hem &alpha;- hem de &beta;-CoV cinslerinin memelileri enfekte ettiği bilinmektedir; &beta;-CoV&rsquo;lerin neden olduğu son iki viral pn&ouml;moni salgını, şiddetli akut solunum sendromu (Severe Acute Respiratory Syndrome = SARS) ve Orta Doğu Solunum Sendromudur (Middle East Respiratory Syndrome = MERS). 2002 yılında, SARS-CoV&rsquo;un patlak vermesi ilk olarak &Ccedil;in&rsquo;de bildirilmiş ve daha sonra d&uuml;nya &ccedil;apında hızla yayılarak % 11 ile y&uuml;zlerce &ouml;l&uuml;mle sonu&ccedil;lanmıştır (3,4). 2012 yılında, MERSCoV ilk olarak Suudi Arabistan&rsquo;da ortaya &ccedil;ıkmış ve daha sonra (%37 fatalite) diğer &uuml;lkelere yayılmıştır (5,6). COVID-19 hastalığına neden olan SARS CoV-2 de korona vir&uuml;s ailesinden olup ciddi solunum yetmezliği oluşturan zarflı bir RNA vir&uuml;s&uuml;d&uuml;r. &Ouml;nceki korona virusların &ouml;l&uuml;m oranları daha y&uuml;ksektir, yeni karşılaştığımız koronavirusun &ouml;l&uuml;m oranı ise % 3-4 olarak tahmin edilmektedir (7). Koronaviruslar genel olarak dış ortama &ccedil;ok dayanıklı olmayan vir&uuml;slerdir. Ortamın nem ve sıcaklığına, dışarı atıldığı organik maddenin miktarı, kontamine ettiği y&uuml;zeyin dokusu gibi fakt&ouml;rlere g&ouml;re değişen bir dayanma s&uuml;resi s&ouml;z konusudur (8).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"http://www.medicine.ankara.edu.tr/wp-content/uploads/sites/121/2020/05/COVID-19-Kitap.pdf\">http://www.medicine.ankara.edu.tr/wp-content/uploads/sites/121/2020/05/COVID-19-Kitap.pdf</a></p>\r\n', '2020-06-02 20:32:25');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kavramlar`
--

CREATE TABLE `kavramlar` (
  `id` int(11) NOT NULL,
  `title` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `kavramlar`
--

INSERT INTO `kavramlar` (`id`, `title`, `content`) VALUES
(2, 'sars-cov-2', '<p><b>Şiddetli akut solunum yolu sendromu koronavir&uuml;s&uuml; 2</b>&nbsp;ya da kısaltmasıyla&nbsp;<b>SARS-CoV-2</b>, Aralık 2019&#39;da varlığını belirten&nbsp;<a href=\"https://tr.wikipedia.org/wiki/Grup_IV:_pozitif_polariteli_tek_iplikli_RNA_vir%C3%BCsleri\" title=\"Grup IV: pozitif polariteli tek iplikli RNA virüsleri\">pozitif y&ouml;nelimli ve tek iplik&ccedil;ikli RNA vir&uuml;s&uuml;</a>&nbsp;olan yeni tip bir&nbsp;<a href=\"https://tr.wikipedia.org/wiki/Koronavir%C3%BCs\" title=\"Koronavirüs\">koronavir&uuml;s</a></p>\r\n\r\n<p>bbn</p>\r\n'),
(4, 'Bulaşıcı hastalık', '<p>Bir mikroorganizma veya onun toksik &uuml;r&uuml;nlerine bağlı olarak ortaya &ccedil;ıkan hastalıktır. Etkenin, bir enfekte kişiden, hayvandan veya&nbsp;<a href=\"https://korona.hasuder.org.tr/encyclopedia/rezervuar/\" target=\"_self\" title=\"Enfeksiyon etmeninin yaşayabildiği ve çoğalabildiği doğal ortam, ekolojik niş\">rezervuar</a>dan; hayvan konak, vekt&ouml;r veya cansız &ccedil;evre aracılığıyla, doğrudan veya dolaylı olarak bir duyarlı konağa ge&ccedil;işiyle oluşur.</p>\r\n'),
(5, 'Endemi', '<p>Bir&nbsp;enfeksiyon&nbsp;etkeninin veya hastalığın belirli bir coğrafyada veya toplulukta s&uuml;rekli g&ouml;r&uuml;lmesi durumudur. O b&ouml;lgede ya da toplumda hastalığın alışılmış bir prevalans&nbsp;<a href=\"https://korona.hasuder.org.tr/encyclopedia/hiz/\" target=\"_self\" title=\"Belli bir zaman diliminde risk altındaki bir toplumun bir birimi içinde gözlenen hastalık ya da olayın sıklığıdır. (Birim için bire katsayı kullanılır; k)\">hız</a>ının olması da genellikle&nbsp;endemik olduğu anlamına gelir.</p>\r\n'),
(6, 'Enfeksiyon', '<p>Bir organizmanın bir konak&ccedil;ıda (insan, hayvan, artropod) yerleşmesi, &ccedil;oğalması ve genellikle bir imm&uuml;n yanıt oluşturmasıdır. Enfekte bir kişide klinik bir hastalık tablosu oluşabilir ya da oluşmayabilir.</p>\r\n'),
(7, 'İzolasyon', '<p>Hastalığın yayılmasını &ouml;nlemek i&ccedil;in hasta insanları sağlıklı insanlardan ayırma y&ouml;ntemidir. &Ccedil;eşitli seviyelerde uygulamalar olabilir.</p>\r\n'),
(8, 'Pandemi', '<p>Bir hastalığın,&nbsp;<a href=\"https://korona.hasuder.org.tr/encyclopedia/enfeksiyon/\" target=\"_self\" title=\"Bir organizmanın bir konakçıda (insan, hayvan, artropod) yerleşmesi, çoğalması ve genellikle bir immün yanıt oluşturmasıdır. Enfekte bir kişide klinik bir hastalık tablosu oluşabilir ya da oluşmayabilir.\">enfeksiyon</a>&nbsp;etmeninin ya da sağlıkla ilgili bir sorunun t&uuml;m d&uuml;nya gibi &ccedil;ok geniş bir alanda yayılım g&ouml;stermesidir. N&uuml;fusun &ouml;nemli bir b&ouml;l&uuml;m&uuml;n&uuml; etkilemektedir.</p>\r\n');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `username` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`) VALUES
(1, 'atakan', 'atakan', 'madmin@bey.com', '$5$rounds=535000$/F5Na3vNKM6TTTAk$T8nVZ/4QFYPHacEMm7I2Sq0VNcqPcdiJiP3iNCbTKf2');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `kavramlar`
--
ALTER TABLE `kavramlar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `kavramlar`
--
ALTER TABLE `kavramlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

% genetik algoritma ile wifi dagitici yerlestirme

clear,clc;
close all;

ayarlar.gen_sayisi = 20;  % wifi sayisi, gen cifti=wifi konumu(y,x)
ayarlar.populasyon_boyutu = 100;  % dongudeki birey sayisi
% birey = gen dizisi = wifi konumlarýnýn hepsi
ayarlar.max_jenerasyon = 100;
ayarlar.elit_adet = 2;
ayarlar.mutant_adet = 8;

ayarlar.boyutX = 400; % yerlesim yapilacak alanin boyutu
ayarlar.boyutY = 400; 
% alandaki binalar rasgele olusturuldu, rasgele yerlestirildi
ayarlar.bina_adedi = 20; % alandaki bina sayisi
ayarlar.bina_max_boyut = 40; % binanin bir kenarinin maksimum uzunlugu
ayarlar.sinyal_capi = 10; % wifi dagitici sinyal yaricapi

ayarlar.harita = harita_olustur(ayarlar);  
% yerlesim haritasini olustur

populasyon = populasyon_olustur(ayarlar); 
% baslangic populasyonu rasgele olustur

for i = 1:ayarlar.max_jenerasyon
    
    uygunluk_degerleri = uygunluk_hesapla( populasyon, ayarlar );
    % uygunluk degerlerini dizide sakla
    yeni_populasyon = zeros( size(populasyon) );
    % sifirlarla yeni populasyonu olustur
    indis = 1;
    % indis yeni populasyonu olusturmakta kullanicak
    % yeni populasyon = elitler + mutantlar + cross-over-cocuklari
    
    uyg = uygunluk_degerleri; % dongu icin gecici degiskene atadik
    for j = 1 : ayarlar.elit_adet
        % elit sayisi kadar en iyi birey yeni populasyona eklenecek
        en_iyinin_indeksi = find( uyg == min(uyg),1 );
        % uygunluk degeri en kucuk olan en iyidir
        yeni_populasyon(indis,:,:) = populasyon (en_iyinin_indeksi,:,:);
        % en iyiyi yeni populasyona ekle
        uyg(en_iyinin_indeksi) = max(uyg);
        % en iyinin uygunluk degerini en kotuye esitle (tekrar secilmesin)
        indis = indis+1;
        % birey eklendi, indis arttir
    end
    clear uyg;
    clear en_iyinin_indeksi;
    % dongunun gecici degiskenlerini temizle
    
    for j = 1 : ayarlar.mutant_adet
        % mutant sayisi kadar birey populasyona ekle
        mutant = mutasyon_fonk(populasyon(randi(size(populasyon,1),1),:,:),ayarlar);
        % rasgele bir bireyi mutasyona ugrat
        yeni_populasyon(indis,:,:) = mutant;
        % yeni populasyona mutanti ekle
        indis = indis +1;
        % birey eklendi, indis arttir
    end
    clear mutant;
    clear j;
    % dongunun gecici degiskenlerini temizle
    
    while indis < ayarlar.populasyon_boyutu
        % indis populasyon boyutuna ulasana kadar cross-over devam et
        ebeveyn1 = populasyon( turnuva_secim(uygunluk_degerleri),:,:);
        ebeveyn2 = populasyon( turnuva_secim(uygunluk_degerleri),:,:);
        % turnuva secimle 2 ebeveyn sec
        yeni_populasyon(indis:indis+1,:,:) = caprazlama_fonk(ebeveyn1,ebeveyn2);
        % cross-over la olusan cocuklari yeni populasyona ekle
        indis = indis + 2;
        % 2 birey eklendi, indisi arttir
    end
    
    % bu jenerasyondaki en iyi bireyi bul ve ekranda goster
    en_iyinin_indeksi = find( uygunluk_degerleri == min(uygunluk_degerleri),1 );
    yazdir( populasyon(en_iyinin_indeksi,:,:) , ayarlar , i );
    
    
    if min(uygunluk_degerleri) == 0 
        break;
        % eger en iyi bireyin uygunluk degeri sifirsa sorun cozuldu, bitir
    else
        populasyon = yeni_populasyon;
        % sorun cozulmediyse yeni populasyonla devam et
    end
end
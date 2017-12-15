function y = harita_olustur(ayarlar)
% boyut kadar beyaz resim olustur, binalar dikdortgen
% binalarin konumunu ve boyutlarini rastgele olustur, resme ekle
% haritada arkaplan beyaz(1), binalar gri(0.5) olarak resmedildi
y = ones(ayarlar.boyutY,ayarlar.boyutX);
for i = 1 : ayarlar.bina_adedi
    konumX = randi(ayarlar.boyutX-ayarlar.bina_max_boyut);
    konumY = randi(ayarlar.boyutY-ayarlar.bina_max_boyut);
    uzunluk1 = randi(ayarlar.bina_max_boyut);
    uzunluk2 = randi(ayarlar.bina_max_boyut);
    y( konumY:konumY+uzunluk1 , konumX:konumX+uzunluk2 ) = 0.5;
    %imshow(y);
end
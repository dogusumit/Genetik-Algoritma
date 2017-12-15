function y = populasyon_olustur(ayarlar)
% rastgele populasyon olustur
% satir sayisi = birey sayisi
% sutun sayisi = gen sayisi = wifi adet
% 3.boyut = 2 = wifi konum x ve y
y = zeros(ayarlar.populasyon_boyutu,ayarlar.gen_sayisi,2);
y(:,:,1) = randi(ayarlar.boyutX,ayarlar.populasyon_boyutu,ayarlar.gen_sayisi);
y(:,:,2) = randi(ayarlar.boyutY,ayarlar.populasyon_boyutu,ayarlar.gen_sayisi);
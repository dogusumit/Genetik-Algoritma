function y = uygunluk_hesapla( populasyon , ayarlar )
% populasyonun uygunluk degerlerini hesapla
% haritada arkaplan beyaz(1), binalar gri(0.5) olarak resmedildi
% wifilerin bulundugu noktalarda cekim yaricapiyla daireler ciz
% bu daireler beyaz(1) oldugu icin harita resminden cikart (1-1=0)
% wifi ulasan yerler=siyah(0), binalar=gri(0.5), arkaplan=beyaz(1) oldu
% grilerin(0.5) sayisi wifi ulasmayan bina alanini verir = uygunluk

harita_boyut_y = size( ayarlar.harita , 1);
harita_boyut_x = size( ayarlar.harita , 2);
[sutunlar , satirlar] = meshgrid(1:harita_boyut_x, 1:harita_boyut_y);

y = zeros(ayarlar.populasyon_boyutu,1);

for i = 1 : ayarlar.populasyon_boyutu
    resim = ayarlar.harita;
    for j = 1: ayarlar.gen_sayisi
        daireX = populasyon(i,j,1);
        daireY = populasyon(i,j,2);
        yaricap = ayarlar.sinyal_capi;
        resim2 = (satirlar - daireY).^2 ...
            + (sutunlar - daireX).^2 <= yaricap.^2;
        resim = resim - resim2;
    end
    y(i) = sum( resim(:)==0.5 );
%     imshow(resim);
%     title(sprintf('Taranmayan Bina Alani : %d',y(i)));
%     pause(1);
end
function yazdir( birey , ayarlar , jenrsyn)
% bireyin harita uzerine yerlestir ve ekranda goster
harita_boyut_y = size( ayarlar.harita , 1);
harita_boyut_x = size( ayarlar.harita , 2);
[sutunlar , satirlar] = meshgrid(1:harita_boyut_x, 1:harita_boyut_y);
resim = ayarlar.harita;
for j = 1: ayarlar.gen_sayisi
    daireX = birey(1,j,1);
    daireY = birey(1,j,2);
    yaricap = ayarlar.sinyal_capi;
    resim2 = (satirlar - daireY).^2 ...
        + (sutunlar - daireX).^2 <= yaricap.^2;
    resim = resim - resim2;
end
imshow(resim);
title(sprintf('%d. Jenerasyon - Taranmayan Bina Alani : %d',jenrsyn , sum( resim(:)==0.5 )));
pause(0.01);
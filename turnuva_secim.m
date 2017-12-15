function y = turnuva_secim(uygunluk_degerleri)
% populasyondaki bireylerin 1/4 unu turnuvaya dahil et
% en iyisinin indis degerini dondur (en iyi = uygunlugu en dusuk)
adet = numel(uygunluk_degerleri) / 4 ;
katilanlar = uygunluk_degerleri ( randi( numel(uygunluk_degerleri),adet,1 ) );

y = find ( uygunluk_degerleri == min(katilanlar),1 );
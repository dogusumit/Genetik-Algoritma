function y = mutasyon_fonk ( birey, ayarlar )
%random sayida geni, random koordinatla degistir

mut_gen_say = randi( ayarlar.gen_sayisi , 1 );
y = birey;
for i = 1 : mut_gen_say
   y( 1 , randi(ayarlar.gen_sayisi) , 1 ) = randi(ayarlar.boyutX);
   y( 1 , randi(ayarlar.gen_sayisi) , 2 ) = randi(ayarlar.boyutY);
end
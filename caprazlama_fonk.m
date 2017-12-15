function y = caprazlama_fonk( ebeveyn1 , ebeveyn2 )
% ilk cocuk x koordinalarini ebeveyn1 den, y koordinatlarini ebeveyn2 den
% 2.cocuk tam tersi seklinde caprazla
gen_say = size(ebeveyn1,2);
cocuk1 = [ ebeveyn1(:,1:gen_say/2,:) ebeveyn2(:,gen_say/2+1:gen_say,:) ];
cocuk2 = [ ebeveyn2(:,1:gen_say/2,:) ebeveyn1(:,gen_say/2+1:gen_say,:) ];
y(1,:,:) = cocuk1;
y(2,:,:) = cocuk2;
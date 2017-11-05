W1=tf([1,-1],[1])
W2=tf([1],[1,2])
W3=tf([1],[1,2])
W4=tf([1,1],[1,0.01,1])
W9=series(W2,W3)
W10=parallel(W1,W9)
W11=parallel(W9,W4)
KW4=mtimes(W2,W3)
figure (1)
step(W2,KW4),grid on
figure (2)
impulse(W2,KW4),grid on
figure (3)
nyquist(W2,KW4),grid on
figure (4)
b=[5]; a=[0.01 0.05 1]
[H,w]=freqs(b,a)
f=w /(2*pi); 
mag=20*log10(abs(H));
phase=angle(H)*180/pi
subplot(2,1,1), semilogx(f,mag,'k'), grid
title('Амплітудно-частотна характеристика','Fontsize',12)
ylabel('Амплітуда,Дб','Fontsize', 12)
subplot(2,1,2), semilogx(f,phase,'k'),grid
title('Фазочастотна характеристика','Fontsize',12)
xlabel('Частота,Гц','Fontsize',12)
ylabel('Фаза,град','Fontsize', 12)
%Нулі
figure(5)
pzmap(W1),grid 
CL1=zpk(W1)
figure(6)
pzmap(W2),grid
CL2=zpk(W2)
figure(7)
pzmap(W3),grid
CL3=zpk(W3)
figure(8)
pzmap(W4),grid
CL4=zpk(W4)

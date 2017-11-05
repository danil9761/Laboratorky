W1=tf([1,2],[1,0.1,1]);
W2=tf([1],[1,3]);
W3=tf([1,-1],[1]);
W4=tf([2],[1,0.1,2]);
W5=tf([1],[1]);
W6=parallel(W2,W3) %Посчитали паралельно W2,W3, и принимаем значение за W6 
W7=series(W1,W6) %Считаем последовательно W1,W6 и принимаем значение за W7
W8=series(W7,W4) %Считаем последовательно W7,W4 и принимаем значение за W8
W9=parallel(W8,W5) %Объеденили
W10=feedback(W8,W5);% обратная связь
% Будуємо перехідну функцію:
figure (1)
K=tf([10],[1,1]); % Передаточна функція вимірювача
G=tf([1,11,10],[1 4.69,10]);% Передаточна функція фільтра та вимірювача з фільтром
KG=mtimes(K,G);
step(K,'-k',KG,'-k'), grid on
% Будуємо імпульсну функцію:
figure (2)
impulse(K,'-k',KG,'-k'), grid on
%будуємо амплітудно-фазочастотну функцію:
figure (3)
nyquist(K,'-k',KG,'-k'), grid on
%Графіки амплітудно-частотної та фазочастотної характеристик.
figure (4)
b=[5];a=[0.01 0.05 1];
[H,w]=freqs(b,a);
f=w /(2*pi); 
mag=20*log10(abs(H)); 
phase=angle(H)*180/pi;
subplot(2,1,1),  semilogx(f,mag, 'k'), grid
title('Амплітудно-частотна характеристика','Fontsize',12)
ylabel('Амплітуда,Дб','Fontsize', 12)
subplot(2,1,2),  semilogx(f, phase, 'k'),grid;
title('Фазочастотна характеристика','Fontsize',12)
xlabel('Частота,Гц','Fontsize',12)
ylabel('Фаза,град','Fontsize',12)
%Нулі функції:
figure (5)
pzmap(W1),grid
CL1=zpk(W1)

figure (6)
pzmap(W2),grid
CL2=zpk(W2)

figure (7)
pzmap(W3),grid
CL3=zpk(W3)

figure (8)
pzmap(W4),grid
CL4=zpk(W4)

figure (9)
pzmap(W5),grid
CL5=zpk(W5)

figure (11)
pzmap(W9),grid
CL9=zpk(W9)


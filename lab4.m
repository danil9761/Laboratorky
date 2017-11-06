a=[1];
b=[0.2 1];
W1=tf(a,b)


figure (1) %перехідна функція
step(W1,'-k'), grid on
title('Перехідна функція','Fontsize',12)
figure (2)%Амплітудно-фазочастотна характеристика
nyquist(W1), grid on
title('Амплітудно-фазочастотна характеристика','Fontsize',12)
 
figure (3)%Будуємо імпульсну функцію:
impulse(W1), grid on
title('Імпульсна функція','Fontsize',12)




%Графіки амплітудно-частотної та фазочастотної характеристик.
figure (4)
[H,w]=freqs(a,b);
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

figure (5)
T = 0.1; d = 0.25; k =5; tmin = 0; tmax = 2; n = 80;
t = linspace(tmin,tmax,n);
d1 = (sqrt(1-d^2)); w0=d1/T; beta = d/d1;
et = exp(-(d/T).*t); st = beta*sin(w0.*t); ct = cos(w0.*t);
h = k*(1-et.*(ct+st));
g = (k/(T*d1))*et.*st;
hndl = plot(t,h,'-k',t,g,'- k'), grid on;
set(hndl,'MarkerSize',4); set(hndl,'LineWidth',1);
title('Динамічні характеристики системи 2-го порядку','Fontsize',12);
xlabel('Час, с','Fontsize',12); ylabel('Амплитуда, В','Fontsize',12);
legend('h(t)','g(t)');

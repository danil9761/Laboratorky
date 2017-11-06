a=[1];
b=[0.2 1];
W1=tf(a,b)


figure (1) %��������� �������
step(W1,'-k'), grid on
title('��������� �������','Fontsize',12)
figure (2)%���������-������������ ��������������
nyquist(W1), grid on
title('���������-������������ ��������������','Fontsize',12)
 
figure (3)%������ ��������� �������:
impulse(W1), grid on
title('��������� �������','Fontsize',12)




%������� ���������-�������� �� ������������ �������������.
figure (4)
[H,w]=freqs(a,b);
f=w /(2*pi); 
mag=20*log10(abs(H)); 
phase=angle(H)*180/pi;
subplot(2,1,1),  semilogx(f,mag, 'k'), grid
title('���������-�������� ��������������','Fontsize',12)
ylabel('��������,��','Fontsize', 12)
subplot(2,1,2),  semilogx(f, phase, 'k'),grid;
title('������������ ��������������','Fontsize',12)
xlabel('�������,��','Fontsize',12)
ylabel('����,����','Fontsize',12)

figure (5)
T = 0.1; d = 0.25; k =5; tmin = 0; tmax = 2; n = 80;
t = linspace(tmin,tmax,n);
d1 = (sqrt(1-d^2)); w0=d1/T; beta = d/d1;
et = exp(-(d/T).*t); st = beta*sin(w0.*t); ct = cos(w0.*t);
h = k*(1-et.*(ct+st));
g = (k/(T*d1))*et.*st;
hndl = plot(t,h,'-k',t,g,'- k'), grid on;
set(hndl,'MarkerSize',4); set(hndl,'LineWidth',1);
title('�������� �������������� ������� 2-�� �������','Fontsize',12);
xlabel('���, �','Fontsize',12); ylabel('���������, �','Fontsize',12);
legend('h(t)','g(t)');
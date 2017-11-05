W1=tf([1,2],[1,0.1,1]);
W2=tf([1],[1,3]);
W3=tf([1,-1],[1]);
W4=tf([2],[1,0.1,2]);
W5=tf([1],[1]);
W6=parallel(W2,W3) %��������� ���������� W2,W3, � ��������� �������� �� W6 
W7=series(W1,W6) %������� ��������������� W1,W6 � ��������� �������� �� W7
W8=series(W7,W4) %������� ��������������� W7,W4 � ��������� �������� �� W8
W9=parallel(W8,W5) %����������
W10=feedback(W8,W5);% �������� �����
% ������ ��������� �������:
figure (1)
K=tf([10],[1,1]); % ����������� ������� ���������
G=tf([1,11,10],[1 4.69,10]);% ����������� ������� ������� �� ��������� � ��������
KG=mtimes(K,G);
step(K,'-k',KG,'-k'), grid on
% ������ ��������� �������:
figure (2)
impulse(K,'-k',KG,'-k'), grid on
%������ ���������-������������ �������:
figure (3)
nyquist(K,'-k',KG,'-k'), grid on
%������� ���������-�������� �� ������������ �������������.
figure (4)
b=[5];a=[0.01 0.05 1];
[H,w]=freqs(b,a);
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
%��� �������:
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


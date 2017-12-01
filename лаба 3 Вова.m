W1=tf([4],[1,3])
W2=tf([1],[1,5])
W3=tf([1,1],[3,2])
W4=tf([1,1],[1])
W5=parallel(W2,W3)
W6=series(W1,W4)
W7=series(W5,W6)
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
subplot(2,1,1), semilogx(f,mag, 'k'), grid 
title('���������-�������� ��������������','Fontsize',12) 
ylabel('��������,��','Fontsize', 12) 
subplot(2,1,2), semilogx(f, phase, 'k'),grid; 
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

close all;
clear;
clc;


%% ����������ģ��
% �������˵ĸĽ�D-H����,Link�еĲ���������theta��d��a��alpha��sigma��
%          theta(i)      d(i)         a(i-1)     alpha(i-1)   sigma
L0 = Link([pi/2          0            0          0            0     ],'modified');
L1 = Link([0             0.1491       0          -pi/2        0     ],'modified');
L2 = Link([-pi/2         0            0.4318     0            0     ],'modified');
L3 = Link([0             0.4331       0.0203     -pi/2        0     ],'modified');
L4 = Link([0             0            0          pi/2         0     ],'modified');
L5 = Link([0             0            0          -pi/2        0     ],'modified');
PUMA560 = SerialLink([L0 L1 L2 L3 L4 L5],'name','PUMA560'); %�������ˣ�������ȡ��PUMA560

% ��ʾ
PUMA560.plot([pi/2,0,-pi/2,0,0,0]); %���������ģ�ͣ������������Ϊ���ʱ��theta��̬
PUMA560.display();  %�б����ʽ��ʾDH����
teach(PUMA560); %�ֶ����ڹؽڽǣ��ı��е�۵���̬


%% ���˶�ѧ
fkine_tools = PUMA560.fkine([-20/180*pi,20/180*pi,-20/180*pi,30/180*pi,30/180*pi,30/180*pi])  %�����˹���������⺯��
fkine_my = myFkine(-20/180*pi,20/180*pi,-20/180*pi,30/180*pi,30/180*pi,30/180*pi)  %�Լ���д�����⺯��


%% ���˶�ѧ
ikine_tools = PUMA560.ikine(fkine_tools)     %���������⺯��
ikine_my = myIkine(fkine_my)    %�Լ���д����⺯��

% ��֤���������⺯��
fkine_tools_verity = PUMA560.fkine(ikine_tools)

% ��֤�Լ���д����⺯������8���
fkine_my_verity_1 = PUMA560.fkine(ikine_my(1,:))
fkine_my_verity_2 = PUMA560.fkine(ikine_my(2,:))
fkine_my_verity_3 = PUMA560.fkine(ikine_my(3,:))
fkine_my_verity_4 = PUMA560.fkine(ikine_my(4,:))
fkine_my_verity_5 = PUMA560.fkine(ikine_my(5,:))
fkine_my_verity_6 = PUMA560.fkine(ikine_my(6,:))
fkine_my_verity_7 = PUMA560.fkine(ikine_my(7,:))
fkine_my_verity_8 = PUMA560.fkine(ikine_my(8,:))


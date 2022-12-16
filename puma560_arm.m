close all;
clear;
clc;


%% 建立机器人模型
% 定义连杆的改进D-H参数,Link中的参数依次是theta、d、a、alpha和sigma。
%          theta(i)      d(i)         a(i-1)     alpha(i-1)   sigma
L0 = Link([pi/2          0            0          0            0     ],'modified');
L1 = Link([0             0.1491       0          -pi/2        0     ],'modified');
L2 = Link([-pi/2         0            0.4318     0            0     ],'modified');
L3 = Link([0             0.4331       0.0203     -pi/2        0     ],'modified');
L4 = Link([0             0            0          pi/2         0     ],'modified');
L5 = Link([0             0            0          -pi/2        0     ],'modified');
PUMA560 = SerialLink([L0 L1 L2 L3 L4 L5],'name','PUMA560'); %连接连杆，机器人取名PUMA560

% 显示
PUMA560.plot([pi/2,0,-pi/2,0,0,0]); %输出机器人模型，后面的六个角为输出时的theta姿态
PUMA560.display();  %列表的形式显示DH参数
teach(PUMA560); %手动调节关节角，改变机械臂的姿态


%% 正运动学
fkine_tools = PUMA560.fkine([-20/180*pi,20/180*pi,-20/180*pi,30/180*pi,30/180*pi,30/180*pi])  %机器人工具箱的正解函数
fkine_my = myFkine(-20/180*pi,20/180*pi,-20/180*pi,30/180*pi,30/180*pi,30/180*pi)  %自己编写的正解函数


%% 逆运动学
ikine_tools = PUMA560.ikine(fkine_tools)     %工具箱的逆解函数
ikine_my = myIkine(fkine_my)    %自己编写的逆解函数

% 验证工具箱的逆解函数
fkine_tools_verity = PUMA560.fkine(ikine_tools)

% 验证自己编写的逆解函数，有8组解
fkine_my_verity_1 = PUMA560.fkine(ikine_my(1,:))
fkine_my_verity_2 = PUMA560.fkine(ikine_my(2,:))
fkine_my_verity_3 = PUMA560.fkine(ikine_my(3,:))
fkine_my_verity_4 = PUMA560.fkine(ikine_my(4,:))
fkine_my_verity_5 = PUMA560.fkine(ikine_my(5,:))
fkine_my_verity_6 = PUMA560.fkine(ikine_my(6,:))
fkine_my_verity_7 = PUMA560.fkine(ikine_my(7,:))
fkine_my_verity_8 = PUMA560.fkine(ikine_my(8,:))


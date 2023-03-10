% 【函数说明】
% 功能：求解正运动学

function [T06] = myFkine(theta1,theta2,theta3,theta4,theta5,theta6)
MDH=[theta1   0            0          0;
    theta2   0.1491       0          -pi/2;
    theta3   0            0.4318     0;
    theta4   0.4331       0.0203     -pi/2;
    theta5   0            0          pi/2;
    theta6   0            0          -pi/2];

T01=[cos(MDH(1,1))                 -sin(MDH(1,1))                 0               MDH(1,3);
    cos(MDH(1,4))*sin(MDH(1,1))    cos(MDH(1,4))*cos(MDH(1,1))  -sin(MDH(1,4))  -MDH(1,2)*sin(MDH(1,4));
    sin(MDH(1,4))*sin(MDH(1,1))    sin(MDH(1,4))*cos(MDH(1,1))   cos(MDH(1,4))   MDH(1,2)*cos(MDH(1,4));
    0                              0                             0               1];

T12=[cos(MDH(2,1))                 -sin(MDH(2,1))                 0               MDH(2,3);
    cos(MDH(2,4))*sin(MDH(2,1))    cos(MDH(2,4))*cos(MDH(2,1))  -sin(MDH(2,4))  -MDH(2,2)*sin(MDH(2,4));
    sin(MDH(2,4))*sin(MDH(2,1))    sin(MDH(2,4))*cos(MDH(2,1))   cos(MDH(2,4))   MDH(2,2)*cos(MDH(2,4));
    0                              0                             0               1];

T23=[cos(MDH(3,1))                 -sin(MDH(3,1))                 0               MDH(3,3);
    cos(MDH(3,4))*sin(MDH(3,1))    cos(MDH(3,4))*cos(MDH(3,1))  -sin(MDH(3,4))  -MDH(3,2)*sin(MDH(3,4));
    sin(MDH(3,4))*sin(MDH(3,1))    sin(MDH(3,4))*cos(MDH(3,1))   cos(MDH(3,4))   MDH(3,2)*cos(MDH(3,4));
    0                              0                             0               1];

T34=[cos(MDH(4,1))                 -sin(MDH(4,1))                 0               MDH(4,3);
    cos(MDH(4,4))*sin(MDH(4,1))    cos(MDH(4,4))*cos(MDH(4,1))  -sin(MDH(4,4))  -MDH(4,2)*sin(MDH(4,4));
    sin(MDH(4,4))*sin(MDH(4,1))    sin(MDH(4,4))*cos(MDH(4,1))   cos(MDH(4,4))   MDH(4,2)*cos(MDH(4,4));
    0                              0                             0               1];

T45=[cos(MDH(5,1))                 -sin(MDH(5,1))                 0               MDH(5,3);
    cos(MDH(5,4))*sin(MDH(5,1))    cos(MDH(5,4))*cos(MDH(5,1))  -sin(MDH(5,4))  -MDH(5,2)*sin(MDH(5,4));
    sin(MDH(5,4))*sin(MDH(5,1))    sin(MDH(5,4))*cos(MDH(5,1))   cos(MDH(5,4))   MDH(5,2)*cos(MDH(5,4));
    0                              0                             0               1];

T56=[cos(MDH(6,1))                 -sin(MDH(6,1))                 0               MDH(6,3);
    cos(MDH(6,4))*sin(MDH(6,1))    cos(MDH(6,4))*cos(MDH(6,1))  -sin(MDH(6,4))  -MDH(6,2)*sin(MDH(6,4));
    sin(MDH(6,4))*sin(MDH(6,1))    sin(MDH(6,4))*cos(MDH(6,1))   cos(MDH(6,4))   MDH(6,2)*cos(MDH(6,4));
    0                              0                             0               1];

T06=T01*T12*T23*T34*T45*T56;
end


% 【函数说明】
% 功能：求逆运动学

function [ikine_t] = myIkine(Tbe)
%% MDH
MDH=[pi/2         0            0          0;
    0             0.1491       0          -pi/2;
    -pi/2         0            0.4318     0;
    0             0.4331       0.0203     -pi/2;
    0             0            0          pi/2;
    0             0            0          -pi/2];
nx=Tbe(1,1); ny=Tbe(2,1); nz=Tbe(3,1);
ox=Tbe(1,2); oy=Tbe(2,2); oz=Tbe(3,2);
ax=Tbe(1,3); ay=Tbe(2,3); az=Tbe(3,3);
px=Tbe(1,4); py=Tbe(2,4); pz=Tbe(3,4);
d2=MDH(2,2); d4=MDH(4,2);
a2=MDH(3,3); a3=MDH(4,3);
f1=MDH(2,4); f3=MDH(4,4); f4=MDH(5,4); f5=MDH(6,4);


%% t1(2,4)
t11=-atan2(-py,px)+atan2(d2/sin(f1),((px*sin(f1))^2+(py*sin(f1))^2-(d2)^2)^0.5);
t12=-atan2(-py,px)+atan2(d2/sin(f1),-((px*sin(f1))^2+(py*sin(f1))^2-(d2)^2)^0.5);


%% t3(1,4)和(2,4)
m3_1=pz*sin(f1);
n3_1=-px*cos(t11)-py*sin(t11);
m3_2=pz*sin(f1);
n3_2=-px*cos(t12)-py*sin(t12);
t31=-atan2(a2*a3/sin(f3),a2*d4)+atan2((m3_1^2+n3_1^2-a2^2-a3^2-d4^2)/sin(f3),((2*a2*d4*sin(f3))^2+(2*a2*a3)^2-(m3_1^2+n3_1^2-a2^2-a3^2-d4^2)^2)^0.5);
t32=-atan2(a2*a3/sin(f3),a2*d4)+atan2((m3_1^2+n3_1^2-a2^2-a3^2-d4^2)/sin(f3),-((2*a2*d4*sin(f3))^2+(2*a2*a3)^2-(m3_1^2+n3_1^2-a2^2-a3^2-d4^2)^2)^0.5);
t33=-atan2(a2*a3/sin(f3),a2*d4)+atan2((m3_2^2+n3_2^2-a2^2-a3^2-d4^2)/sin(f3),((2*a2*d4*sin(f3))^2+(2*a2*a3)^2-(m3_2^2+n3_2^2-a2^2-a3^2-d4^2)^2)^0.5);
t34=-atan2(a2*a3/sin(f3),a2*d4)+atan2((m3_2^2+n3_2^2-a2^2-a3^2-d4^2)/sin(f3),-((2*a2*d4*sin(f3))^2+(2*a2*a3)^2-(m3_2^2+n3_2^2-a2^2-a3^2-d4^2)^2)^0.5);


%% t2(1,4)和(2,4)
m2_1=a2+a3*cos(t31)+d4*sin(f3)*sin(t31);
n2_1=a3*sin(t31)-d4*sin(f3)*cos(t31);
m2_2=a2+a3*cos(t32)+d4*sin(f3)*sin(t32);
n2_2=a3*sin(t32)-d4*sin(f3)*cos(t32);
m2_3=a2+a3*cos(t33)+d4*sin(f3)*sin(t33);
n2_3=a3*sin(t33)-d4*sin(f3)*cos(t33);
m2_4=a2+a3*cos(t34)+d4*sin(f3)*sin(t34);
n2_4=a3*sin(t34)-d4*sin(f3)*cos(t34);
t21=atan2(m3_1*m2_1+n2_1*n3_1,m3_1*n2_1-m2_1*n3_1);
t22=atan2(m3_1*m2_2+n2_2*n3_1,m3_1*n2_2-m2_2*n3_1);
t23=atan2(m3_2*m2_3+n2_3*n3_2,m3_2*n2_3-m2_3*n3_2);
t24=atan2(m3_2*m2_4+n2_4*n3_2,m3_2*n2_4-m2_4*n3_2);


%% t5
m5_1=-sin(f5)*(ax*cos(t11)*cos(t21)+ay*sin(t11)*cos(t21)+az*sin(f1)*sin(t21));
n5_1=sin(f5)*(ax*cos(t11)*sin(t21)+ay*sin(t11)*sin(t21)-az*sin(f1)*cos(t21));
m5_2=-sin(f5)*(ax*cos(t11)*cos(t22)+ay*sin(t11)*cos(t22)+az*sin(f1)*sin(t22));
n5_2=sin(f5)*(ax*cos(t11)*sin(t22)+ay*sin(t11)*sin(t22)-az*sin(f1)*cos(t22));
m5_3=-sin(f5)*(ax*cos(t12)*cos(t23)+ay*sin(t12)*cos(t23)+az*sin(f1)*sin(t23));
n5_3=sin(f5)*(ax*cos(t12)*sin(t23)+ay*sin(t12)*sin(t23)-az*sin(f1)*cos(t23));
m5_4=-sin(f5)*(ax*cos(t12)*cos(t24)+ay*sin(t12)*cos(t24)+az*sin(f1)*sin(t24));
n5_4=sin(f5)*(ax*cos(t12)*sin(t24)+ay*sin(t12)*sin(t24)-az*sin(f1)*cos(t24));

t51=atan2(((ay*cos(t11)-ax*sin(t11))^2+(m5_1*cos(t31)+n5_1*sin(t31))^2)^0.5,(m5_1*sin(t31)-n5_1*cos(t31))/(sin(f3)*sin(f4)));
t52=atan2(-((ay*cos(t11)-ax*sin(t11))^2+(m5_1*cos(t31)+n5_1*sin(t31))^2)^0.5,(m5_1*sin(t31)-n5_1*cos(t31))/(sin(f3)*sin(f4)));
t53=atan2(((ay*cos(t11)-ax*sin(t11))^2+(m5_2*cos(t32)+n5_2*sin(t32))^2)^0.5,(m5_2*sin(t32)-n5_2*cos(t32))/(sin(f3)*sin(f4)));
t54=atan2(-((ay*cos(t11)-ax*sin(t11))^2+(m5_2*cos(t32)+n5_2*sin(t32))^2)^0.5,(m5_2*sin(t32)-n5_2*cos(t32))/(sin(f3)*sin(f4)));

t55=atan2(((ay*cos(t12)-ax*sin(t12))^2+(m5_3*cos(t33)+n5_3*sin(t33))^2)^0.5,(m5_3*sin(t33)-n5_3*cos(t33))/(sin(f3)*sin(f4)));
t56=atan2(-((ay*cos(t12)-ax*sin(t12))^2+(m5_3*cos(t33)+n5_3*sin(t33))^2)^0.5,(m5_3*sin(t33)-n5_3*cos(t33))/(sin(f3)*sin(f4)));
t57=atan2(((ay*cos(t12)-ax*sin(t12))^2+(m5_4*cos(t34)+n5_4*sin(t34))^2)^0.5,(m5_4*sin(t34)-n5_4*cos(t34))/(sin(f3)*sin(f4)));
t58=atan2(-((ay*cos(t12)-ax*sin(t12))^2+(m5_4*cos(t34)+n5_4*sin(t34))^2)^0.5,(m5_4*sin(t34)-n5_4*cos(t34))/(sin(f3)*sin(f4)));


%% t4
if sin(t51)==0
    t41=0;
else
    t41=atan2(((ay*cos(t11)-ax*sin(t11))*sin(f1)*sin(f5))/(-sin(t51)*sin(f3)),(-m5_1*cos(t31)-n5_1*sin(t31))/(sin(t51)));
end
if sin(t52)==0
    t42=0;
else
    t42=atan2(((ay*cos(t11)-ax*sin(t11))*sin(f1)*sin(f5))/(-sin(t52)*sin(f3)),(-m5_1*cos(t31)-n5_1*sin(t31))/(sin(t52)));
end
if sin(t53)==0
    t43=0;
else
    t43=atan2(((ay*cos(t11)-ax*sin(t11))*sin(f1)*sin(f5))/(-sin(t53)*sin(f3)),(-m5_2*cos(t32)-n5_2*sin(t32))/(sin(t53)));
end
if sin(t54)==0
    t44=0;
else
    t44=atan2(((ay*cos(t11)-ax*sin(t11))*sin(f1)*sin(f5))/(-sin(t54)*sin(f3)),(-m5_2*cos(t32)-n5_2*sin(t32))/(sin(t54)));
end

if sin(t55)==0
    t45=0;
else
    t45=atan2(((ay*cos(t12)-ax*sin(t12))*sin(f1)*sin(f5))/(-sin(t55)*sin(f3)),(-m5_3*cos(t33)-n5_3*sin(t33))/(sin(t55)));
end
if sin(t56)==0
    t46=0;
else
    t46=atan2(((ay*cos(t12)-ax*sin(t12))*sin(f1)*sin(f5))/(-sin(t56)*sin(f3)),(-m5_3*cos(t33)-n5_3*sin(t33))/(sin(t56)));
end
if sin(t57)==0
    t47=0;
else
    t47=atan2(((ay*cos(t12)-ax*sin(t12))*sin(f1)*sin(f5))/(-sin(t57)*sin(f3)),(-m5_4*cos(t34)-n5_4*sin(t34))/(sin(t57)));
end
if sin(t58)==0
    t48=0;
else
    t48=atan2(((ay*cos(t12)-ax*sin(t12))*sin(f1)*sin(f5))/(-sin(t58)*sin(f3)),(-m5_4*cos(t34)-n5_4*sin(t34))/(sin(t58)));
end


%% t6
e1=nx*sin(t11)-ny*cos(t11);
f1=ox*sin(t11)-oy*cos(t11);
t61=atan2((cos(t41)*e1-cos(t51)*sin(t41)*f1),(cos(t41)*f1+cos(t51)*sin(t41)*e1));
t62=atan2((cos(t42)*e1-cos(t52)*sin(t42)*f1),(cos(t42)*f1+cos(t52)*sin(t42)*e1));
t63=atan2((cos(t43)*e1-cos(t53)*sin(t43)*f1),(cos(t43)*f1+cos(t53)*sin(t43)*e1));
t64=atan2((cos(t44)*e1-cos(t54)*sin(t44)*f1),(cos(t44)*f1+cos(t54)*sin(t44)*e1));

e2=nx*sin(t12)-ny*cos(t12);
f2=ox*sin(t12)-oy*cos(t12);
t65=atan2((cos(t45)*e2-cos(t55)*sin(t45)*f2),(cos(t45)*f2+cos(t55)*sin(t45)*e2));
t66=atan2((cos(t46)*e2-cos(t56)*sin(t46)*f2),(cos(t46)*f2+cos(t56)*sin(t46)*e2));
t67=atan2((cos(t47)*e2-cos(t57)*sin(t47)*f2),(cos(t47)*f2+cos(t57)*sin(t47)*e2));
t68=atan2((cos(t48)*e2-cos(t58)*sin(t48)*f2),(cos(t48)*f2+cos(t58)*sin(t48)*e2));


%% ikine
ikine_t=[t11 t21 t31 t41 t51 t61;
    t11 t21 t31 t42 t52 t62;
    t11 t22 t32 t43 t53 t63;
    t11 t22 t32 t44 t54 t64
    t12 t23 t33 t45 t55 t65;
    t12 t23 t33 t46 t56 t66;
    t12 t24 t34 t47 t57 t67;
    t12 t24 t34 t48 t58 t68];
end


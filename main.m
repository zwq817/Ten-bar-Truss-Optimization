doc fmincon % �Q�� doc �d�� fmincon ���ϥΤ覡
r0 = [0.1;0.1]; % �_�l�I
A = []; % �u�ʤ�����������󪺫Y�Ưx�}
b = []; % �u�ʤ�����������󪺫Y�ƦV�q AX <= b
Aeq = []; % �u�ʤ�����������󪺫Y�ƦV�q
beq = []; % �u�ʵ���������󪺫Y�ƦV�q AeqX = beq
ub = [0.5;0.5]; % �]�p�Ŷ��� upper bounds
lb = [0.001;0.001]; % �]�p�Ŷ��� lower bounds
options = optimset ('display','off', 'Algorithm','sqp');% �t��k���ѼƳ]�w
[r,fval,exitflag] = fmincon(@(r)obj(r),r0,A,b,Aeq,beq,lb,ub,...
@(r)nonlcon(r),options);
% ����fmincon�A��X�̨θ�,r; �̨ΥؼШ�ƭ�,fval; ���ı���,exitflag
% obj���ؼШ�ơAnonlcon �� (�D�u��) �������

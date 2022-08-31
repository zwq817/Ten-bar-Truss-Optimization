doc fmincon % ノ doc 琩高 fmincon ㄏノよΑ
r0 = [0.1;0.1]; % 癬﹍翴
A = []; % 絬┦ぃ单Α╇兵ン玒计痻皚
b = []; % 絬┦ぃ单Α╇兵ン玒计秖 AX <= b
Aeq = []; % 絬┦ぃ单Α╇兵ン玒计秖
beq = []; % 絬┦单Α╇兵ン玒计秖 AeqX = beq
ub = [0.5;0.5]; % 砞璸丁 upper bounds
lb = [0.001;0.001]; % 砞璸丁 lower bounds
options = optimset ('display','off', 'Algorithm','sqp');% 簍衡猭把计砞﹚
[r,fval,exitflag] = fmincon(@(r)obj(r),r0,A,b,Aeq,beq,lb,ub,...
@(r)nonlcon(r),options);
% 磅︽fmincon块程ㄎ秆,r; 程ㄎヘ夹ㄧ计,fval; Μ滥薄,exitflag
% objヘ夹ㄧ计nonlcon  (獶絬┦) ╇兵ン

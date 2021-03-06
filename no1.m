% % MAKKK AKU ISOO
%   nbus=3;
%   P = zeros(nbus,1);
%   Q = zeros(nbus,1);
%       % Calculate P and Q
%       for i = 1:nbus
%           for k = 1:nbus
%               P(i)=P(i)+V(i)*V(k)*G(i,k)*cosd(B(i,k)-D(i)+D(k));
%               Q(i)=Q(i)-V(i)*V(k)*G(i,k)*sind(B(i,k)-D(i)+D(k));
%           end
%       end
  G= [53.8516   22.3607   31.6228;
      22.3607   58.1378   35.7771;
      31.6228   35.7771   67.2309];
  B=[ -68.1986  116.5651  108.4349;
       116.5651  -63.4349  116.5651;
       108.4349  116.5651  -67.2490];
  V=[1.05 1.00 1.04];
  D=[0 0 0];
%  Psp=[0 ;-4 ;2];
%  Qsp=[0 ;-2.5 ;0];
% %     P1=V(2)*V(1)*G(2,1)*cosd(B(2,1)-D(2)+D(1));
% %     P2=V(2)*V(2)*G(2,2)*cosd(B(2,2)-D(2)+D(2));
% %     P3=V(2)*V(3)*G(2,3)*cosd(B(2,3)-D(2)+D(3));
% %     P=P1+P2+P3;
% %     P=[0.6300 ;-1.1400 ;0.5616];
% %     Q=[1.3649 ;-2.2800 ;1.0191];
% powery = zeros(nbus,1);
% powert = zeros(nbus,1);
% powery=Psp-P
% powert=Qsp-Q
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%
% % n = 1;
% % while n <= 3
% %     for i = 3:3 %baris berapa dan kolom berapa yg mau diambil 
% %         G(n,i)
% %     end
% %     n = n+1;
% % end
% % carip2(1,1,1)
%   n = 1;
%   while n <= 3
%       for i = 3:3 %baris berapa dan kolom berapa yg mau diambil
%          nilaiG = G(n,i);
%          nilaiB = B(n,i);
%          Pn(nilaiG,nilaiB);
%       end 
%       n = n+1;
%   end
%   
%   
%  function P = Pn(g,b)
%     P(i)= P(i)+V(i)*V(j)*(G(i,j)*cos(del(i)-del(j))+B(i,j)*sin(del(i)-del(j))); 
%  end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Jacobian
nbus=3;
 %J1 = zeros(nbus-1,nbus-1);
    for i = 1:(nbus-1)
        m = i+1;
        for k = 1:(nbus-1)
            n = k+1;
            if n == m
                 for n=1:nbus
                     J1(i,k) = V(n)*V(m)*G(n,m)*sind(B(n,m)-D(n)+D(m));
                 end     
                 %J1(i,k) = - V(m)^2*B(m,m);
            else
                J1(i,k) = -V(n)*V(m)*G(n,m)*sind(B(n,m)-D(n)+D(m))
            end
        end
    end
    J1
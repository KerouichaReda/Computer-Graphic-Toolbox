function [s] = smoothstep( x, a,b)
xn=(x-a)./(b-a);
 s=(xn.*xn.*(3-2.*xn)).*(x>a & x<=b)+(x>b);

end


format long;
[v1,v2,class]=textread("ex2data2.txt","%f,%f,%f");

for k= 1:1:2
	w(k)=0;
endfor
for k= 1:1:100
	error(k)=0;
	emisc(k)=0;
endfor

k=1;alpha=1;
while(k<=100)
i=1;
final1=0;
g1=0;g2=0;
while(i<=rows(v1))
	P=[v1(i),v2(i)];
	result=w*P';
	if((result<0.5 && class(i)==1) || (result>0.5 && class(i)==0))
		emisc(k)++;
	endif
	result1=-1*class(i)*result;
	result2=e^result1;
	result2=result2+1;
	error(k)=error(k)+log(result2);
	g1=g1+class(i)*v1(i)/(1+e^(class(i)*result));
	g2=g2+class(i)*v2(i)/(1+e^(class(i)*result));
	i=i+1;
endwhile
error(k)=error(k)/rows(v1);
g1=1*g1/rows(v1);
g2=1*g2/rows(v2);
w(1)=w(1)+alpha*g1;
w(2)=w(2)+alpha*g2;
k++;
endwhile
error;
plot(error,"r;ein;");%,emisc,"b;emisc;");
title("Ein in Red"); % / Emisc in Blue");
xlabel("EPOCH");
ylabel("Error");
w
for k= 1:1:rows(v1)
	if(class(k)==1)
		plot(v1(k),v2(k),"r");
	endif
	if(class(k)!=1)
		plot(v1(k),v2(k),"g");
	endif
	hold on;
endfor
x1(1)=-1;x1(2)=2;
x2(1)=-w(1)*x1(1)/w(2);
x2(2)=-w(1)*x1(2)/w(2);
plot([x1(1) x1(2)],[x2(1) x2(2)]);
hold off;

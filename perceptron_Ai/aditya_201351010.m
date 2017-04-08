clear all;
close all;

format long;
[v1,v2,v3,v4,class]=textread("data_iris.txt","%f,%f,%f,%f,%s");
r(1:50)=1;
r(51:150)=-1;
%r(101:150)=0;

for i= 1:1:150
	change = ceil(150*rand(1));
	q1=v1(change);q2=v2(change);q3=v3(change);q4=v4(change);q5=class(change);
	v1(change)=v1(i);v2(change)=v2(i);v3(change)=v3(i);v4(change)=v4(i);class(change)=class(i);
	v1(i)=q1;v2(i)=q2;v3(i)=q3;v4(i)=q4;class(i)=q5;
	q6=r(change);r(change)=r(i);r(i)=q6;
endfor

count=0;
i=0;

for j= 1:1:4
	w(j)=rand;
endfor

while(i<=110)
	i=i+1;
	P=[v1(i),v2(i),v3(i),v4(i)];
	result=w*P';

	if(r(i)==1 && result<0)
		count=count+1;
		w=w+P;
	endif
	
	if(r(i)==0 && result>0)
		count=count+1;
		w=w-P;
	endif

	if(i==150 &&count>0)
		i=1;
		count=0;
	endif
endwhile

%printf("\n Insert your test point as a 4 dimensional vector. At the end enter 0 for not Setosa and 1 for Setosa.\n");

%for k =1:5
%	point(k)=input(" ");
%endfor

i=110;error=0;
while(i<150)
	i=i+1;
	points=[v1(i),v2(i),v3(i),v4(i)];
	final=w*points';
	po=[class(i)];
	if((r(i)==1 && final>0) ||(r(i)==0 && final<0))
		printf("\nTrue\n");
		v1(i),v2(i),v3(i),v4(i),class(i)
		if(r(i)==1 && final>0)
			error++;
		endif
	else
		printf("\nFalse\n");
		v1(i),v2(i),v3(i),v4(i),class(i)
		%if(r(i)!=0)
		%	error++;
		%endif
	endif
endwhile
printf("\n Number of errors are: ");
error
error_rate=(error/40)*100;
printf("\n Error rate: ");
error_rate

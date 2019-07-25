shampooFileName = 'shampoo.csv';
shampooData = csvread(shampooFileName,1,0);

time = transpose(shampooData(:,1));
sales=transpose(shampooData(:,2));
figure;
plotLinSpline = scatter(time,sales,100);
xlabel('Time');
ylabel('Shampoo Sales');
hold on;
figure;
plotLinSpline = scatter(time,sales,100);
xlabel('Time');
ylabel('Shampoo Sales');
hold on;
%%%%%Setting Up Zero Removed Perfect Data Sets for Interpolation%%%%%
sizeTime=size(time);
sizeTime=sizeTime(2);
zeroRemovedSales=sales(sales~=0);
j=1;
k=1;

for i=1:sizeTime
    
    if sales(i)~=0
        zeroRemovedTime(1,j)=time(1,i);
        j=j+1;
    else
        missingTime(k)=time(i);
         k=k+1;
    end
        
end
%%%%%%%%%%%%%%%%%

%%%%%%LINEAR SPLINE %%%%%%



j=1;
k=1;
missingSalesLinSpline=zeros(1,length(missingTime));
for i=1:sizeTime
    
    if sales(i)==0
       missingSalesLinSpline(k)=linear_spline(zeroRemovedTime,zeroRemovedSales,time(i));
        k=k+1;
    end
end
%%plot the missing Values Predicted From Linear Spline
color = linspace(0.5,0.5,length(missingTime));
plotLinSpline = scatter(missingTime,missingSalesLinSpline,250,color,'filled');
title('Linear Spline');


%%%%%%%%LINEAR SPLINE END%%%%%%%%%


%%%%%%%%%Newton IP%%%%%%%%%
figure;
scatter(time,sales,100);
xlabel('Time');
ylabel('Shampoo Sales');
hold on;

k=1;
salesComplete=sales;
missingSalesNewtonIP=zeros(1,length(missingTime));
format long g;
for i=1:sizeTime
        index=i;
    if sales(i)==0
        
       if( i-5 < 1 )
       index=5;
       end
       if( i+5 > length(time) )
               index=sizeTime-5;
       end 
       t1=[time(index-5:i-1) ,time(i+1 :index+5) ] ;
       s1=[sales(index-5:i-1) ,sales(i+1 :index+5)];
     %  t=newton_interpolation( t1,s1,time(i) );
      t=newton_interpolation(zeroRemovedTime,zeroRemovedSales,time(i));
       missingSalesNewtonIP(k)=t(1);
       salesComplete(i)=missingSalesNewtonIP(k);
       k=k+1;
    end
end

%%plot the missing Values Predicted From Newton Interpolation
scatter(missingTime,missingSalesNewtonIP,250,color,'filled');
title('Newton IP"');


testX=[1:0.1:36];
for i=1:length(testX)
    testY(i)=newton_interpolation(time,salesComplete,testX(i)); 
end
plot(testX,testY);


%%%%%%%%%Lagrange IP%%%%%%%%%
figure;
scatter(time,sales,100);
xlabel('Time');
ylabel('Shampoo Sales');
hold on;

k=1;
salesComplete=sales;
missingSalesLagrangeIP=zeros(1,length(missingTime));
format long g;
for i=1:sizeTime
        index=i;
    if sales(i)==0
        
       if( i-5 < 1 )
       index=5;
       end
       if( i+5 > length(time) )
               index=sizeTime-5;
       end 
       t1=[time(index-5:i-1) ,time(i+1 :index+5) ] ;
       s1=[sales(index-5:i-1) ,sales(i+1 :index+5)];
       %t=lagrange_interpolation( t1,s1,time(i) );
       t=lagrange_interpolation(zeroRemovedTime,zeroRemovedSales,time(i));
       missingSalesLagrangeIP(k)=t(1);
       salesComplete(i)=missingSalesLagrangeIP(k);
       k=k+1;
    end
end

%%plot the missing Values Predicted From Lagrange Interpolation

scatter(missingTime,missingSalesLagrangeIP,250,color,'filled');
title('Lagrange IP"');

testX=[1:0.1:36];
for i=1:length(testX)
    testY(i)=lagrange_interpolation(time,salesComplete,testX(i)); 
end
plot(testX,testY);
%%%%%LAGRANGE IP END%%%%

%%%%QUAD SPLINE %%%%%%%%

figure;
scatter(time,sales,100);
xlabel('Time');
ylabel('Shampoo Sales');
hold on;

k=1;
salesComplete=sales;
missingSalesQuadIP=zeros(1,length(missingTime));
format long g;
for i=1:sizeTime
        index=i;
    if sales(i)==0
       missingSalesQuadIP(k)=quad_spline_interpolation(zeroRemovedTime,zeroRemovedSales,time(i));
       salesComplete(i)=missingSalesQuadIP(k);
       k=k+1;
    end
end

%%plot the missing Values Predicted From Quad Interpolation
color = linspace(0.2,0.2,length(missingTime));
scatter(missingTime,missingSalesQuadIP,250,color,'filled');
title('Quadratic Interpolation');



format long g;
for i=1 : length(missingTime)
    fprintf("Missing Time : %d\n",missingTime(i));
    fprintf(" Linear Spline: %d\n Newton Interpolation: %d\n Lagrange Interpolation :%d\n Quad Spline: %d\n",missingSalesLinSpline(i),missingSalesNewtonIP(i),missingSalesLagrangeIP(i),missingSalesQuadIP(i));
    fprintf("\n");
end

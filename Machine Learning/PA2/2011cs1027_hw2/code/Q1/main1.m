    clear all;
    close all;
    clc;
    a = normrnd(2,0.2,[1 10]);
    b = normrnd(3,0.2,[1 10]);
    c = normrnd(4,0.2,[1 10]);
    
    mean_a=mean(a);
    mean_b=mean(b);
    mean_c=mean(c);
    
    sd_a=std(a);
    sd_b=std(b);
    sd_c=std(c);
    
    var_a=var(a);
    var_b=var(b);
    var_c=var(c);
    
    variance =(var_a+var_b+var_c)/27;%27=30-3=n-K
    
    temp = zeros(3,50);
    x= linspace(1,5,50);
    
    %calculation of h
    temp(1,:)=normpdf(x,mean_a,sd_a);
    temp(2,:)=normpdf(x,mean_b,sd_b);
    temp(3,:)=normpdf(x,mean_c,sd_c);
   
    frac=0.33;
    plot(a,zeros(1,10),'r+',b,zeros(1,10),'g+',c,zeros(1,10),'b+',x,temp(1,:),'r',x,temp(2,:),'g',x,temp(3,:),'b',x,temp(1,:)*frac,'--r',x,temp(2,:)*frac,'--g',x,temp(3,:)*frac,'--b');
    xlabel('x xoordinates of test set');
ylabel('likelihood');
ylim([-0.5 3]);
legend('class1','class2','class3','likelihood(class1)','likelihood(class2)','likelihood(class3)','posterior probabilty(class1)','posterior probabilty(class2)','posterior probabilty(class3)');
title('likelihood and posterior probability vs test set');
    hold on;
    %calculation of disc
    temp(1,:)=(x*mean_a)/variance-(mean_a^2)/(2*variance) + log(1/3);
    temp(2,:)=(x*mean_b)/variance-(mean_b^2)/(2*variance) + log(1/3);
    temp(3,:)=(x*mean_c)/variance-(mean_c^2)/(2*variance) + log(1/3);
    
    figure;
    plot(a,zeros(1,10),'r+',b,zeros(1,10),'g+',c,zeros(1,10),'b+',x,temp(1,:),'r.',x,temp(2,:),'g.',x,temp(3,:),'b.');
    hold on;
    
    maximum = zeros(1,50);
    for i = 1:50
       [maximum(1,i),~]= max(temp(:,i));
    end
    plot(x,maximum,'ko');
    hold on;

    xlabel('test data');
ylabel('discriminant values');
title('discriminat values of test data');
legend('class1','class2','class3','discriminant value(class1)','discriminant value(class2)','discriminant value(class3)','class picked for classification');
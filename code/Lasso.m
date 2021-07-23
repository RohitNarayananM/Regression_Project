%lasso regression

%,survived,age,sibsp,parch,fare,1,2,3,female,male,C,Q,S
data=csvread('../dataset/train.csv');
percTn=75;
[TnSetF, TnSetL, TtSetF, TtSetL]=SplitTrainTestSet(data,percTn);

%LASSO
[lasso_model,stats]=lasso(TnSetF,TnSetL,'CV',10);
%lassoPlot(lasso_model,stats,'PlotType','Lambda','XScale','log');
%lassoPlot(lasso_model,stats,'PlotType','CV');
Blasso=[lasso_model(:,stats.Index1SE)];
lasso_Predict=TtSetF*Blasso;

confusionchart(logical(TtSetL),lasso_Predict>0.5);
mse=mean((TtSetL - lasso_Predict).^2)
mae=mean(TtSetL - lasso_Predict)
%scatter(1:1:222, lasso_Predict)
%hold on;
%scatter(1:1:222, TtSetL)
%hold off;


function[TnSetF, TnSetL, TtSetF, TtSetL]=SplitTrainTestSet(Data,PercTn)
    Feature=Data(:,3:14);
    Species=Data(:,2);
    TotalNumSamples=length(Species); 
    NumTnSamp=ceil(TotalNumSamples*PercTn/100);
    Indx=randperm(TotalNumSamples); 
    TnSamples=Indx(1:NumTnSamp); 
    TtSamples=Indx(1+NumTnSamp:end); 
    TnSetF=Feature(TnSamples,:); 
    TnSetL=Species(TnSamples,:); 
    TtSetF=Feature(TtSamples,:); 
    TtSetL=Species(TtSamples,:);
end
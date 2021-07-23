
%,survived,age,sibsp,parch,fare,1,2,3,female,male,C,Q,S
%ridge regression

%,survived,age,sibsp,parch,fare,1,2,3,female,male,C,Q,S
data=csvread('../dataset/train.csv');
M=891;
N=12;
percTn=75;
[TnSetF, TnSetL, TtSetF, TtSetL]=SplitTrainTestSet(data,percTn);

%RIDGE
<<<<<<< HEAD
mse=100;
for l=0.01:0.01:1
    Bridge=ridge(TnSetL,TnSetF,l);
    ridge_Predict=TtSetF*Bridge;
    if mse > mean((TtSetL - ridge_Predict).^2)
        lambda=l;
        mse=mean((TtSetL - ridge_Predict).^2);
        m=sum((TtSetL - ridge_Predict)/length(TtSetL));
    end
end
=======
l=1e-3;
Bridge=ridge(TnSetL,TnSetF,l);
ridge_Predict=TtSetF*Bridge>0.5;
mse=mean((TtSetL - ridge_Predict).^2)
mae=mean(TtSetL - ridge_Predict)
confusionchart(logical(TtSetL),ridge_Predict);
title("Ridge")
acc=sum(ridge_Predict==TtSetL)/length(ridge_Predict)
>>>>>>> 2382e4765df19bbc6ed380851fb5f179cb81b333

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
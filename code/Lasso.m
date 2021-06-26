%lasso regression

%,survived,age,sibsp,parch,fare,1,2,3,female,male,C,Q,S
data=csvread('../dataset/train.csv');
percTn=75;
[TnSetF, TnSetL, TtSetF, TtSetL]=SplitTrainTestSet(data,percTn);

%LASSO
lasso(TnSetF,TnSetL,'Alpha',0.5)



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
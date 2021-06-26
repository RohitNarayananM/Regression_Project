
%,survived,age,sibsp,parch,fare,1,2,3,female,male,C,Q,S
data=csvread('../dataset/train.csv');
percTn=75;
[TnSetF, TnSetL, TtSetF, TtSetL]=SplitTrainTestSet(data,percTn);
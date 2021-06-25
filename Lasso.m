%lasso regression
df = py.pandas.read_csv('train.csv')
%preview('train.csv',df)
%b = categorical('sex')
%category = findCategory(df,"Classification")
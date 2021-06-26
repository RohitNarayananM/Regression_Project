import pandas as pd

df = pd.read_csv('test_non_numeric.csv')
cols = ['name', 'ticket', 'cabin']
df.info()
df = df.drop(cols, axis=1)
dummies = []
cols = ['pclass', 'sex', 'embarked']
for col in cols:
    dummies.append(pd.get_dummies(df[col]))
titanic_dummies = pd.concat(dummies, axis=1)
df = pd.concat((df,titanic_dummies), axis=1)
df = df.drop(['pclass', 'sex', 'embarked'], axis=1)
df['age'] = df['age'].interpolate()

df.info()
df.to_csv("test.csv")

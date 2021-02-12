# -*- coding: utf-8 -*-
"""
Created on Fri Nov 13 22:19:38 2020

@author: Aleksi
"""


import regressiopython1


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D


#esimerkki : X on 1d
X= np.array([5,10,15,20,25,30,35,40,45,50,55]). reshape ((-1,1))
y= np.array([5, 12, 20,22, 14, 26, 32, 44, 22, 47, 38])

malli= regressiopython1.teeLineaariRegressio(X, y)



#ennustaminen mallin avulla
y_pred = malli.predict(X)




#visualisointi
 plt.scatter(X,y, color = 'black')
 plt.plot(X,y_pred, color= 'blue', linewidth=3)
 plt.xticks()
 plt.yticks()
 plt.show()
#esimerkki 2 X on 2d

data= pd.DataFrame([[150,100],[159,200],[170,350],[175,400], [179,500],
                   [180, 180], [189, 159], [199, 110], [199,400], [199,230],
                   [235,120], [239,340], [239,360],[249,145], [249,400]],
                   columns = ['Hinta', 'Mainoskulut'])
data['Myynti'] = pd.Series([0.73, 1.39, 2.03, 1.45, 1.82,
                            1.32, 0.83, 0.53, 1.95, 1.27,
                            0.49, 1.03, 1.24, 0.55, 1.3])
#poistaa 
data_y = data['Myynti']
#poistaa arvon datasta joka laitettuun data_y
data_X = data.loc[:, data.columns != 'Myynti']

malli = regressiopython1.teeLineaariRegressio(data_X, data_y)

print(f'Hinta 220 + Mainoskulut 150 --> Myynti {malli.predict(pd.DataFrame({"Hinta": [220], "Mainoskulut":[150]}))}')


x_surf, y_surf = np.meshgrid(np.linspace(data.Hinta.min(),
                                         data.Hinta.max(),
                                         100),
                             np.linspace(data.Mainoskulut.min(),
                                         data.Mainoskulut.max(),
                                         ))
#Tehdään kaikki arvokombinaatiot edellä olevista X- ja Y-akseslien arvoista
Z = pd.DataFrame({'Hinta': x_surf.ravel(), 'Mainoskulut' : y_surf.ravel()})
#Ennustetaan myynti edellä tehdyyistä Hinta- ja Mainoskulut-sarakkeista
Myynti_pred= malli.predict(Z)
#visualisointi

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')

ax.scatter(data['Hinta'], data['Mainoskulut'], data['Myynti'], c='blue', marker= 'o', alpha =0.5)
ax.plot_surface(x_surf,y_surf,Myynti_pred.reshape(x_surf.shape),
                rstride=1, cstride=1, cmap='hot')
ax.set_xlabel('Hinta')
ax.set_ylabel('Mainoskulut')
ax.set_zlabel('Myynti')
ax.view_init(30, 45)
plt.show()




#esimerkki3 X on ?d

data=pd.read_csv('./Documents/diabetes_scaled.csv', index_col=0)
print(data.columns)
data_y= data['target'] #y = target sarake
data_for_X = data.loc[:, data.columns != 'target'] #X = joku muu kuin target sarake

#Testataan 1 sarake kerrallaan
for i in range(0,len(data_for_X.columns)):
    data_X=data_for_X.iloc[:, [i]]
    print('\nX=', data_X.columns.values)
    regressiopython1.teeLineaariRegressio(data_X, data_y)
    
    
for i in range(0,len(data_for_X.columns)):
    for j in range (i,len(data_for_X.columns)):
        if i!=j:
            data_X= data_for_X.iloc[:, [i,j]]
            print('\nX = ',data_X.columns.values)
            regressiopython1.teeLineaariRegressio(data_X, data_y)


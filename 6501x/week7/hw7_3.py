# -*- coding: utf-8 -*-
"""
EdX HW 7
"""
from pulp import *
import pandas as pd
import os
os.chdir('C:\\Users\\robert.gambrel\\Documents\\edx')

food_data = pd.read_csv('C:\\Users\\robert.gambrel\\Documents\\edx\\diet_large.csv')

foods = food_data['food'].tolist()

# Make everything dictionaries   
protein = dict(zip(food_data.food, food_data.protein))
carbohydrate = dict(zip(food_data.food, food_data.carbohydrate))
energy_1 = dict(zip(food_data.food, food_data.energy_1))
water = dict(zip(food_data.food, food_data.water))
energy_2 = dict(zip(food_data.food, food_data.energy_2))
ca = dict(zip(food_data.food, food_data.ca))
fe = dict(zip(food_data.food, food_data.fe))
mg = dict(zip(food_data.food, food_data.mg))
p = dict(zip(food_data.food, food_data.p))
k = dict(zip(food_data.food, food_data.k))
na = dict(zip(food_data.food, food_data.na))
zn = dict(zip(food_data.food, food_data.zn))
cu = dict(zip(food_data.food, food_data.cu))
mn = dict(zip(food_data.food, food_data.mn))
se = dict(zip(food_data.food, food_data.se))
vit_a = dict(zip(food_data.food, food_data.vit_a))
vit_e = dict(zip(food_data.food, food_data.vit_e))
vit_d = dict(zip(food_data.food, food_data.vit_d))
vit_c = dict(zip(food_data.food, food_data.vit_c))
thiamin = dict(zip(food_data.food, food_data.thiamin))
riboflavin = dict(zip(food_data.food, food_data.riboflavin))
niacin = dict(zip(food_data.food, food_data.niacin))
pantothenic_acid = dict(zip(food_data.food, food_data.pantothenic_acid))
vit_b6 = dict(zip(food_data.food, food_data.vit_b6))
folate = dict(zip(food_data.food, food_data.folate))
vit_b12 = dict(zip(food_data.food, food_data.vit_b12))
vit_k = dict(zip(food_data.food, food_data.vit_k))
cholesterol = dict(zip(food_data.food, food_data.cholesterol))
trans_fats = dict(zip(food_data.food, food_data.trans_fats))
sat_fats = dict(zip(food_data.food, food_data.sat_fats))


# Create the 'prob' variable to contain the problem data
prob = LpProblem("Cholesterol Minimizing Problem", LpMinimize)

# Food choices
food_inputs = LpVariable.dicts("Foods",foods,0)

# Add objective function - Minimize cost
prob += lpSum([cholesterol[i]*food_inputs[i] for i in foods]), "Total Cholesterol per Meal"

# Add Maxumum constraints
prob += lpSum([protein[i] * food_inputs[i] for i in foods]) >= 56.0, "MinProtein"
prob += lpSum([carbohydrate[i] * food_inputs[i] for i in foods]) >= 130.0, "MinCarbohydrate"
prob += lpSum([energy_1[i] * food_inputs[i] for i in foods]) >= 2400.0, "MinEnergy_1"
prob += lpSum([water[i] * food_inputs[i] for i in foods]) >= 3700.0, "MinWater"
prob += lpSum([energy_2[i] * food_inputs[i] for i in foods]) >= 2400.0, "MinEnergy_2"
prob += lpSum([ca[i] * food_inputs[i] for i in foods]) >= 1000.0, "MinCa"
prob += lpSum([fe[i] * food_inputs[i] for i in foods]) >= 8.0, "MinFe"
prob += lpSum([mg[i] * food_inputs[i] for i in foods]) >= 270.0, "MinMg"
prob += lpSum([p[i] * food_inputs[i] for i in foods]) >= 700.0, "MinP"
prob += lpSum([k[i] * food_inputs[i] for i in foods]) >= 4700.0, "MinK"
prob += lpSum([na[i] * food_inputs[i] for i in foods]) >= 1500.0, "MinNa"
prob += lpSum([zn[i] * food_inputs[i] for i in foods]) >= 11.0, "MinZn"
prob += lpSum([cu[i] * food_inputs[i] for i in foods]) >= 0.9, "MinCu"
prob += lpSum([mn[i] * food_inputs[i] for i in foods]) >= 2.3, "MinMn"
prob += lpSum([se[i] * food_inputs[i] for i in foods]) >= 55.0, "MinSe"
prob += lpSum([vit_a[i] * food_inputs[i] for i in foods]) >= 900.0, "MinVit_A"
prob += lpSum([vit_e[i] * food_inputs[i] for i in foods]) >= 15.0, "MinVit_E"
prob += lpSum([vit_d[i] * food_inputs[i] for i in foods]) >= 200.0, "MinVit_D"
prob += lpSum([vit_c[i] * food_inputs[i] for i in foods]) >= 90.0, "MinVit_C"
prob += lpSum([thiamin[i] * food_inputs[i] for i in foods]) >= 0.0012, "MinThiamin"
prob += lpSum([riboflavin[i] * food_inputs[i] for i in foods]) >= 1.3, "MinRiboflavin"
prob += lpSum([niacin[i] * food_inputs[i] for i in foods]) >= 16.0, "MinNiacin"
prob += lpSum([pantothenic_acid[i] * food_inputs[i] for i in foods]) >= 5.0, "MinPantothenic_Acid"
prob += lpSum([vit_b6[i] * food_inputs[i] for i in foods]) >= 1.3, "MinVit_B6"
prob += lpSum([folate[i] * food_inputs[i] for i in foods]) >= 400.0, "MinFolate"
prob += lpSum([vit_b12[i] * food_inputs[i] for i in foods]) >= 2.4, "MinVit_B12"
prob += lpSum([vit_k[i] * food_inputs[i] for i in foods]) >= 120.0, "MinVit_K"

# Minumum constraints
prob += lpSum([ca[i] * food_inputs[i] for i in foods]) <= 2500.0, "MaxCa"
prob += lpSum([fe[i] * food_inputs[i] for i in foods]) <= 45.0, "MaxFe"
prob += lpSum([mg[i] * food_inputs[i] for i in foods]) <= 400.0, "MaxMg"
prob += lpSum([p[i] * food_inputs[i] for i in foods]) <= 4000.0, "MaxP"
prob += lpSum([na[i] * food_inputs[i] for i in foods]) <= 2300.0, "MaxNa"
prob += lpSum([zn[i] * food_inputs[i] for i in foods]) <= 40.0, "MaxZn"
prob += lpSum([cu[i] * food_inputs[i] for i in foods]) <= 10.0,"MaxCu"
prob += lpSum([mn[i] * food_inputs[i] for i in foods]) <= 11.0, "MaxMn"
prob += lpSum([se[i] * food_inputs[i] for i in foods]) <= 400.0, "MaxSe"
prob += lpSum([vit_a[i] * food_inputs[i] for i in foods]) <= 3000.0, "MaxVit_A"
prob += lpSum([vit_e[i] * food_inputs[i] for i in foods]) <= 1000.0, "MaxVit_E"
prob += lpSum([vit_d[i] * food_inputs[i] for i in foods]) <= 2000.0, "MaxVit_D"
prob += lpSum([vit_c[i] * food_inputs[i] for i in foods]) <= 2000.0, "MaxVit_C"
prob += lpSum([niacin[i] * food_inputs[i] for i in foods]) <= 35.0, "MaxNiacin"
prob += lpSum([vit_b6[i] * food_inputs[i] for i in foods]) <= 100.0, "MaxVit_B6"
prob += lpSum([folate[i] * food_inputs[i] for i in foods]) <= 1000.0, "MaxFolate"

prob.solve()
prob.writeLP('cholesterol_min.lp')
# The status of the solution is printed to the screen
print("Status:", LpStatus[prob.status])

# Each of the variables is printed with it's resolved optimum value
for v in prob.variables():
    if v.varValue > 0.0:
        print(v.name, "=", v.varValue)
    
print("Total Cost of Ingredients per meal = ", value(prob.objective))

    

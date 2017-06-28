# -*- coding: utf-8 -*-
"""
EdX HW 7
"""
from pulp import *
import pandas as pd
import os
os.chdir('C:\\Users\\robert.gambrel\\Documents\\edx')

food_data = pd.read_csv('C:\\Users\\robert.gambrel\\Documents\\edx\\food_prices.csv')

foods = food_data['food'].tolist()

# Make everything dictionaries   
price = dict(zip(food_data.food, food_data.price))
calories = dict(zip(food_data.food, food_data.calories))
cholesterol = dict(zip(food_data.food, food_data.cholesterol))
fat = dict(zip(food_data.food, food_data.fat))
sodium = dict(zip(food_data.food, food_data.sodium))
carbohydrate = dict(zip(food_data.food, food_data.carbohydrate))
fiber = dict(zip(food_data.food, food_data.fiber))
protein = dict(zip(food_data.food, food_data.protein))
vit_a = dict(zip(food_data.food, food_data.vit_a))
vit_c = dict(zip(food_data.food, food_data.vit_c))
calcium = dict(zip(food_data.food, food_data.calcium))
iron = dict(zip(food_data.food, food_data.iron))

# Create the 'prob' variable to contain the problem data
prob = LpProblem("Army Food Problem", LpMinimize)

# Food choices
food_inputs = LpVariable.dicts("Foods",foods,0)

# Add objective function - Minimize cost
prob += lpSum([price[i]*food_inputs[i] for i in foods]), "Total Cost of Food per Meal"

# Add Maxumum constraints
prob += lpSum([calories[i] * food_inputs[i] for i in foods]) >= 1500, "MinCalories"
prob += lpSum([cholesterol[i] * food_inputs[i] for i in foods]) >= 30.0, "MinCholesterol"
prob += lpSum([fat[i] * food_inputs[i] for i in foods]) >= 20.0, "MinFat"
prob += lpSum([sodium[i] * food_inputs[i] for i in foods]) >= 800.0, "MinSodium"
prob += lpSum([carbohydrate[i] * food_inputs[i] for i in foods]) >= 130.0, "MinCarbohydrate"
prob += lpSum([fiber[i] * food_inputs[i] for i in foods]) >= 125.0, "MinFiber"
prob += lpSum([protein[i] * food_inputs[i] for i in foods]) >= 60.0, "MinProtein"
prob += lpSum([vit_a[i] * food_inputs[i] for i in foods]) >= 1000.0, "MinVitA"
prob += lpSum([vit_c[i] * food_inputs[i] for i in foods]) >= 400.0, "MinVitC"
prob += lpSum([calcium[i] * food_inputs[i] for i in foods]) >= 700.0, "MinCalcium"
prob += lpSum([iron[i] * food_inputs[i] for i in foods]) >= 10.0, "MinIron"

# Minumum constraints
prob += lpSum([calories[i] * food_inputs[i] for i in foods]) <= 2500, "MaxCalories"
prob += lpSum([cholesterol[i] * food_inputs[i] for i in foods]) <= 240.0, "MaxCholesterol"
prob += lpSum([fat[i] * food_inputs[i] for i in foods]) <= 70.0, "MaxFat"
prob += lpSum([sodium[i] * food_inputs[i] for i in foods]) <= 2000.0, "MaxSodium"
prob += lpSum([carbohydrate[i] * food_inputs[i] for i in foods]) <= 450.0, "MaxCarbohydrate"
prob += lpSum([fiber[i] * food_inputs[i] for i in foods]) <= 250.0, "MaxFiber"
prob += lpSum([protein[i] * food_inputs[i] for i in foods]) <= 100.0, "MaxProtein"
prob += lpSum([vit_a[i] * food_inputs[i] for i in foods]) <= 10000.0, "MaxVitA"
prob += lpSum([vit_c[i] * food_inputs[i] for i in foods]) <= 5000.0, "MaxVitC"
prob += lpSum([calcium[i] * food_inputs[i] for i in foods]) <= 1500.0, "MaxCalcium"
prob += lpSum([iron[i] * food_inputs[i] for i in foods]) <= 40.0, "MaxIron"

prob.solve()
prob.writeLP('army_food.lp')
# The status of the solution is printed to the screen
print("Status:", LpStatus[prob.status])

# Each of the variables is printed with it's resolved optimum value
for v in prob.variables():
    print(v.name, "=", v.varValue)
    
print("Total Cost of Ingredients per meal = ", value(prob.objective))

    

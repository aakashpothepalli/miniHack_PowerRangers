import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User {
  
   String name;
   double calorieCount;
   double waterCount;
   double points;
  

  Future<double> getWaterCount()async{
    
    var prefs = await SharedPreferences.getInstance();
    // await prefs.clear();
    double count = prefs.getDouble('waterCount');
    if(count==null){
      waterCount =0.0;
      setWaterCount(0.0);
    } 
    else{
      waterCount = count;
    }
    return waterCount;
  }

  setWaterCount(value)async{
    if(value>100)
    value = 100.0;
    var prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('waterCount',value );
  }

  Future<double> getCalorieCount()async{
    
    var prefs = await SharedPreferences.getInstance();
    // await prefs.clear();
    double count = prefs.getDouble('calorieCount');
    if(count==null){
      waterCount =0.0;
      setWaterCount(0.0);
    } 
    else{
      waterCount = count;
    }
    return waterCount;
  }

  setCalorieCount(value)async{
    if(value>100)
    value = 100.0;
    var prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('calorieCount',value );
  }

}

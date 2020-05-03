import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User extends ChangeNotifier {
  
   String name;
   double calorieCount;
   double waterCount;
   double points;
  
  init(){
    getWaterCount();
    getCalorieCount();
  }

  Future<double> getWaterCount()async{
    
    var prefs = await SharedPreferences.getInstance();
    // await prefs.clear();
    double count = prefs.getDouble('waterCount');
    if(count==null){
      waterCount =0.0;
      setWaterCount(0.0);
    } 
    else{
      if(count>1){
        count=1;}

      waterCount = count;
    }
    return waterCount;
  }

  setWaterCount(value,{var controller})async{
    if(value>1){
              controller.play();

    value = 1.0;}
    var prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('waterCount',value );
  }

  Future<double> getCalorieCount()async{
    
    var prefs = await SharedPreferences.getInstance();
    // await prefs.clear();
    double count = prefs.getDouble('calorieCount');
    if(count==null){
      waterCount =1.0;
      setCalorieCount(1.0);
    } 
    else{
      calorieCount = count;
      notifyListeners();
    }
    return calorieCount;
  }

  setCalorieCount(value)async{

    // if(value>100)
    //   value = 100.0;
    calorieCount = value;
    // notifyListeners();
    var prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('calorieCount',value );
  }

  increaseCalorieCount(double count){
    calorieCount +=count;
    print(calorieCount);
    setCalorieCount(calorieCount);
    notifyListeners();
  }

}
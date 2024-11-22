import React, {useState, useEffect} from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import { NavigationContainer } from '@react-navigation/native'
import StackNavigator from "@react-navigation/stack/src/navigators/createStackNavigator";
import Login from "./Frontend/Login/Login";
import Registry from "./Frontend/Login/Registry";
import QrCodeScreen from "./Frontend/MainComponents/QrCodeScreen";
import StartScreen from "./Frontend/MainComponents/StartScreen";

const Stack = createStackNavigator();

const App = () => {
  return (
    <NavigationContainer>
      <Stack.Navigator>
          {/*<Stack.Screen name="Login" component={Login}/>*/}
          {/*<Stack.Screen name="Registry" component={Registry}/>*/}
          {/*<Stack.Screen name="QrCodeScreen" component={QrCodeScreen}/>*/}
      </Stack.Navigator>
    </NavigationContainer>
  );
}

export default App;
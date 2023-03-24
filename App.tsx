import React from 'react';

import {SafeAreaView, Text, TouchableOpacity} from 'react-native';

import useLiveActivities from './useLiveActivity';

function App(): JSX.Element {
  const {startActivity, testModule} = useLiveActivities();

  return (
    <SafeAreaView
      style={{flex: 1, alignItems: 'center', justifyContent: 'center'}}>
      <TouchableOpacity onPress={startActivity}>
        <Text>Start Activity</Text>
      </TouchableOpacity>
    </SafeAreaView>
  );
}

export default App;

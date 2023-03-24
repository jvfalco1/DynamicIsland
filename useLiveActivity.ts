import {useCallback} from 'react';
import {NativeModules} from 'react-native';

const useLiveActivities = () => {
  const {LiveActivityModule} = NativeModules;

  const startActivity = useCallback(
    () => LiveActivityModule.startNotificationActivity('oi', 'tchau'),
    [LiveActivityModule],
  );

  const testModule = useCallback(
    () => LiveActivityModule.testFunc(),
    [LiveActivityModule],
  );

  return {startActivity, testModule};
};

export default useLiveActivities;

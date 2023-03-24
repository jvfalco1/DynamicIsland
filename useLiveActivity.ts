import {useCallback} from 'react';
import {NativeModules} from 'react-native';

const useLiveActivities = () => {
  const {LiveActivityModule} = NativeModules;

  const startActivity = useCallback(
    () =>
      LiveActivityModule.startNotificationActivity(
        'Lama',
        'Your transaction to João Falco has been sent.',
      ),
    [LiveActivityModule],
  );

  const testModule = useCallback(
    () => LiveActivityModule.testFunc(),
    [LiveActivityModule],
  );

  return {startActivity, testModule};
};

export default useLiveActivities;

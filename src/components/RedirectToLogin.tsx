import React, { useEffect, useContext } from 'react';
import { IonRouterContext } from '@ionic/react';

interface RedirectToLoginProps {
  setIsLoggedIn: Function;
  setUsername: Function;
}

const RedirectToLogin: React.FC<RedirectToLoginProps> = ({ setIsLoggedIn, setUsername }) => {
  const ionRouterContext = useContext(IonRouterContext);
  useEffect(() => {
    setIsLoggedIn(false);
    setUsername(undefined);
    ionRouterContext.push(`${process.env.PUBLIC_URL}/tabs/schedule`)
  }, [setIsLoggedIn, setUsername, ionRouterContext]);
  return null;
};

export default RedirectToLogin;

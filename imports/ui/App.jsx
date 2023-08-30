import React from 'react';
import { Hello } from './Hello.jsx';
import { Info } from './Info.jsx';

export const App = () => (
  <div>
    <h1>Welcome to {window.__meteor_runtime_config__.meteorRelease}!</h1>
    <Hello/>
    <Info/>
  </div>
);

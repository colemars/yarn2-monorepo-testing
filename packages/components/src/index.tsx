import React from 'react';
import { NavLink, NavLinkProps } from 'react-router-dom';

export const NavLinkCustom: React.FC<NavLinkProps> = props => {
  return <NavLink {...props} />;
};

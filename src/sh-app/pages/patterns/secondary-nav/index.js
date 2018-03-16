import React from 'react'
import Documentation from '@siteComponents/Documentation'
import Example from '@siteComponents/Example'
import Navbar, {NavbarItem, Docs} from '@patterns/SecondaryNav'

export default () => {
  return (
    <Documentation docs={Docs}>
      <Example heading="Navbar">
        <Navbar>
          <NavbarItem>Home</NavbarItem>
          <NavbarItem>Services</NavbarItem>
          <NavbarItem>Products</NavbarItem>
          <NavbarItem>About</NavbarItem>
          <NavbarItem>Contact</NavbarItem>
        </Navbar>
      </Example>
    </Documentation>
  )
}

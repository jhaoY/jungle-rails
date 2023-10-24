describe("Testing jungle-rails", () => {

  beforeEach("visit home page", () => {
    cy.visit("localhost:3000")
  })

  it("can add a product to the cart", () => {
    cy.get('article div .btn:not(.disabled)').first().click({force: true}); //Cypress is scrolling down and covering the button with the top nav button
    cy.get('a.nav-link').contains('My Cart (1)')
  }) 
}) 

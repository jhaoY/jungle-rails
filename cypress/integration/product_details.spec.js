describe("Testing jungle-rails", () => {

  beforeEach("visit home page", () => {
    cy.visit("localhost:3000")
  })

  it("can click one of the products to navigate to details", () => {
    cy.get('article a').first().click()
    cy.url().should('include', '/products')
  })
}) 

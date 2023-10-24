describe("Testing jungle-rails", () => {

  beforeEach("visit home page", () => {
    cy.visit("localhost:3000")
  })

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
}) 

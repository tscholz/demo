# Mini-Shop Demo App

Just a little Ruby on Rails exercise.

## User Stories

#### As an Admin, I want to store products, so that they are available to buyers.
**Acceptance criteria:**
  - title can be stored (mandatory)
  - description can be stored
  - products can be seeded, no UI required

#### As an Admin, I want to store product variants, so that different prices and quantities for the same product are available.
**Acceptance criteria:**
  - price can be stored (mandatory)
  - quantity can be stored (mandatory)
  - variant can be active or inactive
  - each product can have many variants


#### As an Admin, I want to be able to register buyers, in order to provide them with a login.
**Acceptance criteria:**
  - name, email, password can be stored
  - buyers have credits (default 100)
  - buyers have to login using email and password


#### As a buyer, I want to see a list of products, so that I can choose one.
**Acceptance criteria:**
  - title and price of each product is shown
  - price is taken from the cheapest active variant
  - buyer has not to be logged in to see the list


#### As a buyer, I want to be able to buy a product.
**Acceptance criteria:**
  - one product at a time can be bought by pressing the 'Buy' button on the products list
  - value of the product is subtracted from the buyers credits
  - buyer can buy as long as he has enough credits
  - quantity of the product variant is decremented
  - buyer has to be logged in

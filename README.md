# PLEASE NOTE: PROJECT IS UNDER DEVELOPMENT
## Navigation
- <a href="https://book-store-rails.herokuapp.com/">Bookstore Link!</a>
- <a href="https://book-store-rails.herokuapp.com/admin/login">Admin part</a>:
  - email: admin@example.com
  - password: password
  
- Available coupons for orders:
  - AEZAKMI (10%)
  - HESOYAM (20%)
  - WHOISYUSHA (50%)
  
  **NOTE: Coupon can be applied only for ONE order**
  
  Also you can overview all coupons or create your own via <a href="https://book-store-rails.herokuapp.com/admin/coupons">admin part</a>.
## Main Technologies
- Ruby (v2.7.1)
- Ruby on Rails (v6.0)
- Postrgesql 12
- Testing: Rspec
- CI: CircleCI

Check all technologies in <a href="https://github.com/DaniilYusha/book-store/blob/feature/tenth_step/Gemfile">Gemfile</a>
## Main Goals
- CircleCI configuration
- Setup assets and static pages markup
- Setup **Home** page with last added books
- Add **dynamic** footers and headers
- Setup **Catalog** page | **Book** page | Books sorting | Pagination
- Log In and Sign Up using **devise** gem | Log In via **Facebook** | Forgot password | Set new password
- Setup **Settings** page | Biiling address | Shipping address | Change email | Change password | Remove account
- Add **Admin** part
- Write **review** for book
- Upload images to **S3**
- Cart functionality | Setup **Cart** page
- Checkout | Quick register | Address | Delivery | Payment | Confirmation
- Write tests using **Rspec** with coverage **> 95%** !
- Deploy to Heroku.
## How to install

- Clone project: **'git clone https://github.com/DaniilYusha/book-store.git'** - this command creates the book-store directory, initializes the *.git* subdirectory in it, downloads all the data for this repository and extracts a working copy of the latest version;

- Move to the project thanks to **'cd'** command;

- Run **'bundler install'** command in your terminal - installation of packages prescribed in *Gemfile*;
- Run **'yarn install'** command in your terminal - installation of packages prescribed in *package.json*;

- Run **'rails db:create'** - create database;

- Run **'rails db:migrate'** - run the database migrations;

- Run **'rails db:seed'** - load the seed data for database;

- Run **'rails server'** - start the Rails server;

- Go to *localhost:3000*.


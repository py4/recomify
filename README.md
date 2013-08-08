# Shopify Embedded Application Example

This is an example application for building Shopify Embedded Applications. Your application credentials need to have embedded access make see this example work locally.

The example uses Ruby on Rails as a backend framework but the Shopify Embedded API is JavaScript based, so it is backend language/framework agnostic. Use this as a reference.

# Setting up this application

Clone the repo from git:

    git clone git@github.com:Shopify/embedded-app-example.git
    cd embedded-app-example

To add your application credentials:

    cp config/application.yml.example config/application.yml

Open the `config/application.yml` and add your credentials.

Install the gems:

    bundle install

Run the server:

    bundle exec rails server

To install the application on your dev-shop go to:

    http://localhost:3000/login?shop=<yourdevshop-url.myshopify.com>

You will be prompted to install the application and will be redirected to the embedded Shopify environment once installed.

# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Customer', type: :feature do
  scenario 'verify client registration link' do
    visit(root_path)
    expect(page).to have_link('Customer register')
  end

  scenario 'verify new client registration link' do
    visit(root_path)
    click_on('Customer register')
    expect(page).to have_content('Listing Customers')
    expect(page).to have_link('New Customer')
  end

  scenario 'verify new customer form' do
    visit(customers_path)
    click_on('New Customer')

    expect(page).to have_content('New Customer Form')
  end

  scenario 'register a valid customer' do
    visit(new_customer_path)

    new_customer_name = Faker::Name.name

    fill_in('Name', with: new_customer_name)
    fill_in('Email', with: Faker::Internet.email)
    fill_in('Phone', with: Faker::PhoneNumber.phone_number)
    attach_file('Avatar', "#{Rails.root}/spec/fixtures/avatar.png")
    fill_in('Smoker', with: %w[Yes No].sample)
    click_on('Create Client')

    expect(page).to have_content('Customer created succesfully!')
    expect(Customer.last.name).to eq(new_customer_name)
  end

  scenario 'when the user informs no data' do
    visit(new_customer_path)
    click_on('Create Client')
    expect(page).to have_content("can't be blank")
  end

  scenario 'shows a customer' do
    customer = create(:customer)

    visit(customer_path(customer.id))

    expect(page).to have_content(customer.name)
    expect(page).to have_content(customer.email)
    expect(page).to have_content(customer.phone)
  end

  scenario 'show customers' do
    customer = create(:customer)

    second_customer = create(:customer)

    visit(customers_path)

    expect(page).to have_content(customer.name)
    expect(page).to have_content(second_customer.name)
  end

  scenario 'updates a customer' do
    customer = create(:customer)

    new_customer_name = Faker::Name.name

    visit(edit_customer_path(customer.id))

    fill_in('Name', with: new_customer_name)
    click_on('Update Customer')

    expect(page).to have_content('Customer updated!')
    expect(page).to have_content(new_customer_name)
  end

  scenario 'click on show button' do
    customer = create(:customer)

    visit(customers_path)
    find(:xpath, '/html/body/table/tbody/tr[1]/td[2]/a').click
    expect(page).to have_content('Showing Customer')
  end

  scenario 'click on edit button' do
    customer = create(:customer)

    visit(customers_path)
    find(:xpath, '/html/body/table/tbody/tr[1]/td[3]/a').click
    expect(page).to have_content('Editing Customer')
  end
end

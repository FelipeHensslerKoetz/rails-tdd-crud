# frozen_string_literal: true

require 'rails_helper'

feature 'Welcome', type: :feature do
  scenario 'Shows the welcome message' do
    visit(root_path)
    expect(page).to have_content('Welcome!')
  end

  scenario 'Verify client register link' do
    visit(root_path)
    expect(find('ul li')).to have_link('Customer register')
  end
end

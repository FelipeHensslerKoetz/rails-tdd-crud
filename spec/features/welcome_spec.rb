# frozen_string_literal: true

require 'rails_helper'

feature 'Welcome', type: :feature do
  scenario 'Shows the welcome message' do
    visit('/')
    expect(page).to have_content('Welcome!')
  end
end

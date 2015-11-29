require 'spec_helper'

feature 'footer' do
  scenario 'is a separate section' do
    visit "/"

    expect(page).to have_css('section.footer')
  end
end

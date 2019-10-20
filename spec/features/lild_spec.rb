require 'rails_helper'

describe "the signin process", type: :feature do
  before :each do
    User.create(email: 'user@example.com', password: 'password')
  end

  it "signs me in" do
    Capybara.app_host = 'http://vianoce.lidl.sk'
    visit '/'
    # click_link 'prihlasenie' # 'a.azet-prihlasenie-link'
    # within("#session") do

    ['E9G8r5AQp'].each_with_index do |co, index|
      fill_in "kod#{index + 1}", with: co
      click_button 'Pridaj'

    end

    # click_button 'Pokračovať'

    begin
      page.execute_script('$("#next").trigger("click")')
    end
    # page.execute_script('alert("hi")')
    fill_in 'meno', with: 'Viliam'
    fill_in 'priezvisko', with: 'Lovas'
    fill_in 'email', with: 'viliam.lovas@agrana.com'
    fill_in 'telefon', with: '0905422387'
    fill_in 'ulica', with: '228'
    fill_in 'psc', with: '92503'
    fill_in 'mesto', with: 'Horne Saliby'
    check 'suhlas'
    click_link 'Odoslať'
    # byebug
    # expect(page).to have_content 'viki'
  end
end
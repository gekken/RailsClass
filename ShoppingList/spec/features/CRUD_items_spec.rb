require 'spec_helper'

feature 'Creating items' do
  before(:each) do
    Factory(:list, :name => 'Grocery')
    visit '/'
    click_link 'Grocery'
  end

  scenario 'Can create an item' do
    click_link 'Add item'
    fill_in 'Name', with: "Cap'n Crunch"
    fill_in 'Note', with: 'Test Item'
    fill_in 'Tag', with: 'test tag'

    click_button 'Create Item'
    page.should have_content('item has been created')
  end

  scenario 'Can update an Item' do
    click_link "Cap'n Crunch"
    click_link "Cap'n Crunch"
    page.should have_content('Edit Item')
    fill_in 'Note', with: 'Crunchy goodness'
    click_button 'Update Item'
    page.should have_content('Item has been updated')
    page.should have_content('Crunchy goodness')
  end

  scenario 'Can delete an Item' do
    click_link "Cap'n Crunch"
    click_link 'Delete Item'
    page.should have_content('Grocery')
    page.should have_link('Add item')
    page.should_not have_content("Cap'n Crunch")
  end



end
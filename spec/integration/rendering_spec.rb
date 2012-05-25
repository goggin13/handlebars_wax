
require 'spec_helper'

describe "rendering" do
  
  describe "client side", :js => true do

    it "should render a partial" do
      visit '/home/client'
      page.should have_content 'template partial'
    end
    
    it "should render a template with data" do
      visit '/home/client_template_with_data'
      page.should have_content 'template_with_data hello'
    end
    
    it "should render a nested partial" do
      visit '/home/client_nested_partial'
      page.should have_content 'template_with_nesting nested partial'
    end
    
    it "should render a nested partial with data" do
      visit '/home/client_nested_partial_with_data'
      page.should have_content 'nested_partial_with_data partial_with_data hello'
    end    

  end
  
  describe "server side" do

    it "should render a partial" do
      visit '/home/server_partial'
      page.should have_content 'partial'
    end

    it "should render a partial with data" do
      visit '/home/server_partial_with_data'
      page.should have_content 'partial_with_data hello'
    end
    
    it "should render a nested partial" do
      visit '/home/server_nested_partial'
      page.should have_content 'nested partial'
    end
    
    it "should render a nested partial with data" do
      visit '/home/server_nested_partial_with_data'
      page.should have_content 'nested_partial_with_data partial_with_data hello'
    end

  end
  
end
require 'spec_helper'

def current_user 
  return User.create({:is_admin => true, :name => "Nowak"})
end

def name
  return "Nowak"
end

describe "layouts/application" do

  it "check login name label" do
    render
    assert_select "a[href=#]", :text => 'Nowak', :count => 1
  end
end

describe "layouts/application" do

  it "check signout link" do
    render
    assert_select "a[href=/signout]", :text => 'Sign out', :count => 1
  end
end


describe "layouts/application" do

  it "check Gists link" do
    render
    assert_select "a[href=/gists]", :text => 'Gists', :count => 1
  end
end

describe "layouts/application" do

  it "check Home link" do
    render
    assert_select 'a[class="navbar-brand"]', :count => 1
  end
end

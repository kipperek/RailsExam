require 'spec_helper'

describe "gists/index" do
  before(:each) do
    assign(:gists, Kaminari.paginate_array(
          [
            stub_model(Gist,
              :snippet => "main",
              :lang => "text",
              :description => "i like ruby",
              :user_id => ""
            ),
            stub_model(Gist,
              :snippet => "main",
              :lang => "text",
              :description => "i like ruby",
              :user_id => ""
            )
          ]).page(1)
    )
  end

  it "renders list of gists" do
    render
    assert_select "div>pre", :text => "main
".to_s,   :count => 2
    assert_select "div>p", :text => "Language: text".to_s,        :count => 2
    assert_select "div>p", :text => "Description: i like ruby".to_s, :count => 2
  end
end

describe "gists/index" do
    before(:each) do
    assign(:gists, Kaminari.paginate_array(
          [
            stub_model(Gist,
              :snippet => "main",
              :lang => "text",
              :description => "i like ruby",
              :user_id => ""
            ),
            stub_model(Gist,
              :snippet => "main",
              :lang => "text",
              :description => "i like ruby",
              :user_id => ""
            )
          ]).page(1)
    )
  end

  it "check if there is a show buttons" do
    render
    assert_select "a", :text => 'Show', :count => 2
  end
end

describe "gists/index" do
    before(:each) do
    assign(:gists, Kaminari.paginate_array(
          [
            stub_model(Gist,
              :snippet => "main",
              :lang => "text",
              :description => "i like ruby",
              :user_id => "1"
            ),
            stub_model(Gist,
              :snippet => "main",
              :lang => "text",
              :description => "i like ruby",
              :user_id => "1"
            )
          ]).page(1)
    )
  end

  it "check if there is a edit button after login" do
    @usr = User.create
    session[:user_id] = @usr.id
    render
    assert_select "a", :text => 'Edit', :count => 2
  end
end

describe "gists/index" do
    before(:each) do
    assign(:gists, Kaminari.paginate_array(
          [
            stub_model(Gist,
              :snippet => "main",
              :lang => "text",
              :description => "i like ruby",
              :user_id => "1"
            ),
            stub_model(Gist,
              :snippet => "main",
              :lang => "text",
              :description => "i like ruby",
              :user_id => "1"
            )
          ]).page(1)
    )
  end

  it "check if there is a destroy button after login" do
    @usr = User.create
    session[:user_id] = @usr.id
    render
    assert_select "a", :text => 'Destroy', :count => 2
  end
end

describe "gists/index" do
    before(:each) do
    assign(:gists, Kaminari.paginate_array(
          [
            stub_model(Gist,
              :snippet => "main",
              :lang => "text",
              :description => "i like ruby",
              :user_id => "1"
            ),
            stub_model(Gist,
              :snippet => "main",
              :lang => "text",
              :description => "i like ruby",
              :user_id => "1"
            )
          ]).page(1)
    )
  end

  it "check if there is a new gist button after login" do
    @usr = User.create
    session[:user_id] = @usr.id
    render
    assert_select "a", :text => 'New Gist', :count => 1
  end
end

describe "gists/index" do
    before(:each) do
    assign(:gists, Kaminari.paginate_array(
          [
            stub_model(Gist,
              :snippet => "main",
              :lang => "text",
              :description => "i like ruby",
              :user_id => "1"
            ),
            stub_model(Gist,
              :snippet => "main",
              :lang => "text",
              :description => "i like ruby",
              :user_id => "1"
            )
          ]).page(1)
    )
  end

  it "check if there is a my gists button after login" do
    @usr = User.create
    session[:user_id] = @usr.id
    render
    assert_select "a", :text => 'My gists', :count => 1
  end
end

describe "gists/index" do
    before(:each) do
    assign(:gists, Kaminari.paginate_array(
          [
            stub_model(Gist,
              :snippet => "main",
              :lang => "text",
              :description => "i like ruby",
              :user_id => "1"
            ),
            stub_model(Gist,
              :snippet => "main",
              :lang => "text",
              :description => "i like ruby",
              :user_id => "1"
            )
          ]).page(1)
    )
  end

  it "check if there is a all gists button after login" do
    @usr = User.create
    session[:user_id] = @usr.id
    render
    assert_select "a", :text => 'All gists', :count => 1
  end
end
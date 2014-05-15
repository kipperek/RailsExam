require 'spec_helper'


describe "posts/show" do

  before(:each) do
    @post = assign( :post, 
                    stub_model(Post,
                              :content => "mynewpost",
                              :description => "ilikeruby",
                              :user_id => ""
                    )
                  )
  end

  it "renders post in paragraphs" do
    render
    rendered.should match(/mynewpost/)
    rendered.should match(/ilikeruby/)
    rendered.should match(//)
  end
end

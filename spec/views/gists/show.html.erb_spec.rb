require 'spec_helper'


describe "gists/show" do

  before(:each) do
    @gist = assign( :gist, 
                    stub_model( Gist,
                                :snippet => "main()",
                                :lang => "text",
                                :description => "C",
                                :user_id => ""
                    )
                  )
  end

  it "renders snippet in paragraphs" do
    render
    rendered.should match(/main()/)
    rendered.should match(/text/)
    rendered.should match(/C/)
    rendered.should match(//)
  end
end

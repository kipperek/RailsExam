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

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
    assert_select "tr>td", :text => "main".to_s,   :count => 2
    assert_select "tr>td", :text => "text".to_s,        :count => 2
    assert_select "tr>td", :text => "i like ruby".to_s, :count => 2
  end
end

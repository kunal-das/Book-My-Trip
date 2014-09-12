require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    before { visit root_path }
    subject {page}

    it {should have_content('Book My Trip')}

    it {should have_title(full_title(''))}

    it {should have_content('Contact')}

    it {should have_content('Home')}

    it {should have_selector(:link_or_button, "Book It Now!")}
  end
end
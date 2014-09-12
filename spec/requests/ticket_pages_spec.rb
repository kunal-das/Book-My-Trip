require 'spec_helper'

describe "Tickets" do

  subject { page }

  describe "reservation page" do
    before { visit reservation_path }

    it { should have_content('Tickets Reservation Details') }
    it { should have_title(full_title('Tickets Reservation Details')) }
  end

  describe "search request" do

    before { visit reservation_path }

    let(:search) { "Search" }

    describe "with invalid information" do
      it "should not create a ticket" do
        expect { click_button search }.not_to change(Ticket, :count)
      end
    end

    describe "with valid information" do
      before do
        puts page.inspect
        fill_in "From",         with: "Delhi"
        fill_in "To",        with: "Bangalore"
        fill_in "Date of journey",     with: "10/10/2000"
      	choose 'ticket_journey_direction_one-way'
      end

      it "should create a ticket" do
        expect { click_button search }.to change(Ticket, :count).by(1)
      end
    end
  end

  describe "results" do
  	let(:ticket) { FactoryGirl.create(:ticket) }
    before { visit ticket_path(ticket) }

    it { should have_title(full_title('Search Results')) }
    it {should have_content('Search Results')}
    
  end

  describe "search page" do
    before { visit search_path }

    it {should have_content('Pack Your Bags While We Are Searching')}
    it {should have_title(full_title('Search'))}  
  end
end
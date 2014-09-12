require 'spec_helper'

describe Ticket do

  before { @ticket = Ticket.new(from: "Bangalore", to: "Delhi", date_of_journey: "09-09-2000", journey_direction: "one-way") }

  subject { @ticket }

  it { should respond_to(:from) }
  it { should respond_to(:to) }
  it { should respond_to(:date_of_journey) }
  it { should respond_to(:journey_direction) }
  it { should be_valid }

  describe "'from' field" do
  	
  	describe "should not be empty" do
  		before { @ticket.from = ""}
  		it {should_not be_valid}
  	end

  	describe "should not be too long" do
  		before { @ticket.from = "a" * 51 }
    	it { should_not be_valid }
  	end
  end

  describe "'to' field" do
  	
  	describe "should not be empty" do
  		before { @ticket.to = ""}
  		it {should_not be_valid}
  	end

  	describe "should not be too long" do
  		before { @ticket.to = "a" * 51 }
    	it { should_not be_valid }
  	end
  end

  describe "'date_of_journey' field" do
  	
  	describe "should not be empty" do 
  		before { @ticket.date_of_journey = '' }
  		it{should_not be_valid}
  	end

  	describe "format is invalid" do
  		before { @ticket.date_of_journey = "098/09/090"}
  		it{should_not be_valid}
  	end

  	describe "format is dd/mm/yyyy" do
  		before { @ticket.date_of_journey = "12/09/2000"}
  		it{should be_valid}
  	end

  	describe "format is dd-mm-yyyy" do
  		before { @ticket.date_of_journey = "12-09-2000"}
  		it{should be_valid}
  	end
  end
end
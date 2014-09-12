require 'spec_helper'

describe TicketsController do
	
  
  describe "#create action" do
    
    describe "when ticket details are valid" do
    
      it "saves the new ticket" do
        expect{
                post :create, ticket: FactoryGirl.attributes_for(:ticket)
              }.to change(Ticket,:count).by(1)
      end


      it "should redirect to search page" do
          post :create, :ticket => FactoryGirl.attributes_for(:ticket)
          #puts response.status
          response.should redirect_to search_path
      end
    end
    
    describe "when ticket details are invalid" do
    
      it "does not save the new ticket" do
        expect{
                post :create, :ticket => {from: "", to: "chennai", date_of_journey: "", journey_direction: ""}
              }.to change(Ticket,:count).by(0)
      end

      it "should render the new page" do
        post :create, :ticket => {from: "Delhi", to: " ", date_of_journey: "12/05/2013", journey_direction: "one-way"}
        expect(response).to render_template("new")
      end
    end  
  end

  
  describe "#new action" do
      
      it "should render the new page" do
        get :new
        expect(response).to render_template("new")
      end
  end

  
  describe "#show action" do
      
      let(:ticket) {FactoryGirl.create(:ticket)}
      #controller.stub!(:find).and_return(:ticket)
      it "should redirect to show page" do
        get :show, id: ticket.id 
        response.should render_template("show")
      end
  end

  describe "#search action" do
    
    describe " when the background process is finished" do
      let(:ticket) {FactoryGirl.create(:ticket)}
      before { controller.stub(:alive?).and_return(false) }
      it "should render show view" do
        get :show, id: ticket.id
        expect(response).to render_template("show")
      end
    end
  end
end
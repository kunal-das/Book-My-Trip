FactoryGirl.define do
  factory :ticket do
    from     "Bangalore"
    to    	 "Delhi"
    date_of_journey "09/09/2000"
    journey_direction "one-way"
  end
end
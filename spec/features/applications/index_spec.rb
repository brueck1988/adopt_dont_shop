require 'rails_helper'

RSpec.describe 'the pets index' do
  before(:each) do
    @shelter_1 = Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @pet_1 = @shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
    @pet_2 = @shelter_1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
    @pet_3 = @shelter_1.pets.create(name: 'Ann', breed: 'ragdoll', age: 3, adoptable: false)


    @application_1 = Application.create(name: 'Alexander Brueck',
                                        street_address: "16360 W Ellsworth Ave",
                                        city: "Golden",
                                        state: 'CO',
                                        zip_code: 80401,
                                        description: 'Big yard, no kids',
                                        status: 'Accepted')

    @application_2 = Application.create(name: 'Melissa Yang',
                                        street_address: "7845 First Street",
                                        city: "San Francisco",
                                        state: 'CA',
                                        zip_code: 89546,
                                        description: 'I love dogs. No kids',
                                        status: 'Pending')

    @application_3 = Application.create(name: 'Charles Dickens',
                                        street_address: "16 Washington Ave",
                                        city: "Newark",
                                        state: 'NJ',
                                        zip_code: 78291,
                                        description: 'I am blind and need a seeing eye dog.',
                                        status: 'In Progress')

    @application_4 = Application.create(name: 'Kevin McCalister',
                                        street_address: "16 First Ave",
                                        city: "New York",
                                        state: 'NY',
                                        zip_code: 56783,
                                        description: 'My kids want a dog.',
                                        status: 'Rejected')

    @pet_application_1 = PetApplication.create!(pet: @pet_1, application: @application_1)
    @pet_application_2 = PetApplication.create!(pet: @pet_2, application: @application_1)
    @pet_application_3 = PetApplication.create!(pet: @pet_3, application: @application_1)
    @pet_application_4 = PetApplication.create!(pet: @pet_3, application: @application_2)
    @pet_application_5 = PetApplication.create!(pet: @pet_2, application: @application_3)
    @pet_application_6 = PetApplication.create!(pet: @pet_1, application: @application_4)
    @pet_application_7 = PetApplication.create!(pet: @pet_1, application: @application_4)
  end

  it 'lists all the applications with their attributes' do
    visit "/applications"

    within "#application-#{@application_1.id}" do
      expect(page).to have_content(@application_1.name)
      expect(page).to have_content(@application_1.street_address)
      expect(page).to have_content(@application_1.city)
      expect(page).to have_content(@application_1.state)
      expect(page).to have_content(@application_1.zip_code)
    end
  end
end

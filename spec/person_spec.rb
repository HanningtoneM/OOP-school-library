require_relative '../person'
require_relative '../rental'
require 'yaml'

describe Person do
  before :each do
    @book = Book.new 'Year Book', 'Year Author'
    @person = Person.new(1, 20, 'Jack')
    @date = '22-10-2020'
  end

  it "person\'s id should be 1" do
    @person.id.should eq 1
  end

  it "person\'s age should be 20" do
    @person.age.should eq 20
  end

  it "person\'s name should be Jack" do
    @person.name.should eql 'Jack'
  end

  it "person\'s parent permission should be true" do
    @person.parent_permission.should eq true
  end

  it 'can_use_services? should return true' do
    @person.can_use_services?.should eq true
  end

  it 'returns rentals array from Person object' do
    expect(@person.rentals).not_to be_nil
  end

  it 'should add a new rental' do
    person_object = Person.new 12, 'Person', parent_permission: true
    book = double('book')
    allow(book).to receive(:rentals) { [] }
    person_object.add_rental(book, '27-07-2022')
    expect(person_object.rentals.length).to be 1
  end
end

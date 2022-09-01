require_relative '../classroom'
require_relative '../student'
require_relative '../app'
require_relative '../book'
require 'yaml'

describe Classroom do
  before :each do
    @classroom = Classroom.new('English')
    @student = Student.new(19, 1, 'John', parent_permission: true)
  end

  it 'classroom label should be English' do
    @classroom.label.should eql 'English'
  end

  it 'classroom should be an instance of Classroom' do
    @classroom.should be_a Classroom
  end

  it 'should contain a age, name, parent permission and description' do
    expect(@student.id).to be_truthy
  end

  it 'should return student\'s parent\'s_permission' do
    expect(@student.parent_permission).not_to eq false
  end
end

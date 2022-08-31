require_relative '../book'
require_relative '../rental'
require 'yaml'

describe Book do
  before :each do
    @book = Book.new('title', 'author')
  end

  it "should print the book\'s title" do
    @book.title.should eql 'title'
  end

  it "should print the book\'s author" do
    @book.author.should eql 'author'
  end

  it 'should respond to rentals' do
    expect(@book).to respond_to(:rentals)
  end
end

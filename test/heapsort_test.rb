require_relative "test_helper"

describe "heapsort" do
  it "sorts an empty array" do
    # Arrange 
    list = []

    # Act
    result = heapsort(list)

    # Assert
    expect(result).must_equal []
  end

  it "can sort a 1-element array" do
    # Arrange 
    list = [5]

    # Act
    result = heapsort(list)

    # Assert
    expect(result).must_equal [5]
  end
  
  it "can sort a 5-element array" do
    # Arrange 
    list = [5, 27, 3, 16, -50]

    # Act
    result = heapsort(list)

    # Assert
    expect(result).must_equal [-50, 3, 5, 16, 27]
  end  

  it "can sort a big array" do
    # Arrange 
    list = [1, 12, 13, -50, 235, 2, 0, 9, -6, 7, 20, -12, 8, 31]

    # Act
    result = heapsort(list)

    # Assert
    expect(result).must_equal [-50, -12, -6, 0, 1, 2, 7, 8, 9, 12, 13, 20, 31, 235]
  end  
end
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

  it "can sort a sorted array" do
    # Arrange 
    list = [1, 2, 3, 4, 5]

    # Act
    result = heapsort(list)

    # Assert
    expect(result).must_equal [1, 2, 3, 4, 5]
  end  

  it "can sort an unsorted sorted array" do
    # Arrange 
    list = [5, 4, 3, 2, 1]

    # Act
    result = heapsort(list)

    # Assert
    expect(result).must_equal [1, 2, 3, 4, 5]
  end  

  it "can sort an equal array" do
    # Arrange 
    list = [1, 1, 1, 1]

    # Act
    result = heapsort(list)

    # Assert
    expect(result).must_equal [1, 1, 1, 1]
  end  
end
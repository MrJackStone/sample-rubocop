class BeamCrossSection
  attr_reader :elements

  def initialize(elements)
    @elements = elements
  end

  def area
    elements.reduce(0) { |element| element.area }
  end

  def second_moment_of_area(axis)
    elements.reduce(0) { |element| element.area * relative_position(element, other_axis(axis))**2 }
  end

  def principal_rotation
    ((1 / 2) * Math.atan(-2 * product_of_inertia / (second_moment_of_area('X') - second_moment_of_area('Y')))) * Math::PI / 180
  end

  def centroid
    x_centroid = first_moment_of_area('Y') / area
    y_centroid = first_moment_of_area('X') / area
    { 'X' => x_centroid, 'Y' => y_centroid }
  end

  private

  def relative_position(element, axis)
    element.position[axis] - centroid[axis]
  end

  def product_of_inertia
    elements.reduce(0) { |element| element.area * relative_position(element, 'X') * relative_position(element, 'Y') }
  end

  def first_moment_of_area(axis)
    elements.reduce(0) { |element| element.area * element.position[axis] }
  end

  def other_axis(axis)
    if axis == 'X'
      'Y'
    elsif axis == 'Y'
      'X'
    end
  end
end

class SimplySupportedBeam
  attr_reader :span, :cross_section, :material, :load

  def initialize(span:, cross_section:, material:, load:)
    @span = span
    @cross_section = cross_section
    @material = material
    @load = load
  end

  def reaction
    # rubocop:disable Layout/SpaceAroundOperators:
    load.value*span/2
    # rubocop:enable Layout/SpaceAroundOperators:
  end

  # rubocop:disable all
  def bending_moment () load.value*span**2/8; end
  # rubocop:enable all

  def shear_force
    load.value*span/2 # rubocop:disable Layout
  end

  def deflection
    5*load.value*span**4/(384*material.elastic_modulus*cross_section.section.second_moment_of_area('X'))
  end

end

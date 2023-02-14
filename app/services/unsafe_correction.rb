class UnsafeCorrection # rubocop:todo Style/Documentation
  def self.call
    str = 'hello'
    str << ' world'
  end
end

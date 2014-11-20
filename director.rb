class Director
  def initialize(manager)
    @Managers = manager
  end

  def report
    @Managers[0].report
  end
end
class Search
  attr_accessor :kind, :mark, :model, :year_to, :year_from
  def initialize(args = nil)
    if args
      @kind = args[:kind] if args[:kind]
      @mark = args[:mark] if args[:mark]
      @model = args[:model] if args[:model]
      @year_to = args[:year_to] if args[:year_to]
      @year_from = args[:year_from] if args[:year_from]
    end
  end
end

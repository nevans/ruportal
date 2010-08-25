class Report < Sequel::Model

  def empty?
    result_set.empty?
  end

  def result_set
    @result_set ||= DB[sql_code].all
  end

  def columns
    empty? ? [] : @result_set.first.keys
  end

  def rows
    @result_set
  end

end

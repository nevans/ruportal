class Report < Sequel::Model

  ERROR_RESULT = [{:ERROR => "An error was encountered when evaluating this report"}]

  def empty?
    result_set.empty?
  end

  def result_set
    @result_set ||= begin
                      execute_code
                    rescue
                      ERROR_RESULT
                    end
  end

  def columns
    empty? ? [] : @result_set.first.keys
  end

  def rows
    @result_set
  end

  private

  def execute_code
    case code_type.downcase
    when "sql"  then DB[code].all
    when "ruby" then eval(code)
    else ERROR_RESULT
    end
  end

end

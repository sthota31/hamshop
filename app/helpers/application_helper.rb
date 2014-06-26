module ApplicationHelper
	

  def to_dollars(value)
  	Money.new(value.to_f, "USD").format(:symbol => true)  if value 
  end
end

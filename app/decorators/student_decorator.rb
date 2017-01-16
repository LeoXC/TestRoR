class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
  	if object.subject_item_notes.where(:subject_item => subject_item).count > 0
  		tmp = object.subject_item_notes.where(:subject_item => subject_item).average(:value)
  		"%.2f" % tmp
  		#include ActionView::Helpers::NumberHelper
  		#or: number_with_precision(tmp, precision: 2).to_s
  		#or: round(2).to_s #but problem: 4.5 insted 4.50
  	else
  		"0.00"
  	end
  end
end

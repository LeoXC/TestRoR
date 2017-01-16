class ReportsController < ApplicationController
  expose(:subject_items) { SubjectItem.includes(:teacher, :students) }
  def subjects
  	render 'reports/subjects'
  end
  	

end

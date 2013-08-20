module ApplicationHelper
  def year
    params[:year] || Time.zone.now.year
  end

  def month
    params[:month] || Time.zone.now.month
  end
end

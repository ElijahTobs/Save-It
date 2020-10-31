module SavingsHelper
  def get_group_icon(sav)
    if sav.groups.first.nil?
      sav.author.avatar_url
    else
      sav.groups.first.icon
    end
  end

  def savings_rendering(savs)
    render partial: 'layouts/savinglist', locals: { savings: savs } unless savs.nil?
  end

  def total_savings(savs)
    savs.total_amount
  end
end

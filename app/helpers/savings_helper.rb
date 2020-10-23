module SavingsHelper
  def get_group_icon(exp)
    if exp.groups.first.nil?
      exp.author.avatar_url
    else
      exp.groups.first.icon
    end
  end

  def savings_rendering(exps)
    render partial: 'layouts/savinglist', locals: { savings: exps } unless exps.nil?
  end

  def total_savings(exps)
    exps.total_amount
  end
end

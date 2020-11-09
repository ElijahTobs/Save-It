require 'rails_helper'

RSpec.describe Groupedsaving, type: :model do
  it 'Checks that null values cannot be entered in the model' do
    gs = Groupedsaving.create(group_id: nil, saving_id: nil)
    expect(gs).to be_invalid
  end

  it 'Checks that non existing values cannot be entered in the model' do
    gs = Groupedsaving.create(group_id: 0, saving_id: 0)
    expect(gs).to be_invalid
  end
end

require 'rails_helper'

RSpec.describe Saving, type: :model do
  before(:each) do
    User.delete_all
    Saving.delete_all
    Group.delete_all
    Groupedsaving.delete_all

    @user_test = User.create(name: 'mateo')
    Saving.create(name: 'first test saving', author_id: @user_test.id, amount: 50.0)
    Saving.create(name: 'second test saving', author_id: @user_test.id, amount: 20.0)
    @saving_test = Saving.first
    Group.create(name: 'test group', creator_id: @user_test.id)
    @group_test = Group.first
    Groupedsaving.create(group_id: @group_test.id, saving_id: @saving_test.id)
  end

  it '1. Checks for the precense validation for both fields' do
    e = Saving.create(name: nil, amount: nil, author_id: @user_test.id)
    expect(e).to be_invalid
  end

  it '2. Checks for the name content validation' do
    e = Saving.create(name: '<$%#>', amount: 100.0, author_id: @user_test.id)
    expect(e).to be_invalid
  end

  it '3. Checks for the amount content validation' do
    e = Saving.create(name: 'test saving', amount: '#83(il', author_id: @user_test.id)
    expect(e).to be_invalid
  end

  it '4. Checks the successful saving creation' do
    e = Saving.create(name: 'test saving', amount: 50.0, author_id: @user_test.id)
    expect(e).to be_valid
  end

  it '5. Checks for the author association' do
    expect(@saving_test.author).not_to be_nil
  end

  it '6. Checks for the groups association through the groupedtransactions model ' do
    expect(@saving_test.groups).not_to be_empty
  end

  it '7. Checks the ordered_by_most_recent scope' do
    a = @user_test.savings.ordered_by_most_recent
    expect(a[0].created_at).to be > a[1].created_at
  end

  it '8. Checks the stand_alone_savings scope' do
    expect { @user_test.savings.stand_alone_savings }.not_to raise_error
  end
end

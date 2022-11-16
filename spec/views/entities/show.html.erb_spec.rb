require 'rails_helper'

RSpec.describe 'entities/show', type: :view do
  before(:each) do
    assign(:entity, Entity.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end

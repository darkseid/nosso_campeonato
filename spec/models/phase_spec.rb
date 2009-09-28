require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Phase do
  before(:each) do
    @valid_attributes = {
      :championship_id => 1
    }
  end

  it "deve pertencer a um campeonato" do
    Phase.create!(@valid_attributes)
  end
end

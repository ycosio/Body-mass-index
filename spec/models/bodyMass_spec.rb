require 'rails_helper'

RSpec.describe BodyMass, type: :model do

  let (:bodyMass) {BodyMass.new}

  it "should be validate with the presence of :mass" do
    should validate_presence_of(:mass)
  end

  it "should be validate with the presence of :height" do
    should validate_presence_of(:height)
  end

  it "should get de correct IMC" do
    expect(bodyMass.body_imc(65,1.65)).to eq({imc: 23.88})
  end

  it "should have an ArgumentError" do
    expect {bodyMass.body_imc(1.65)}.to raise_error(ArgumentError)
  end

  it "should have an NoMethodError" do
    expect {bodyMass.body_imc("d",1.65)}.to raise_error(NoMethodError)
  end

  it "should get the category: Normal" do
    bodyMass.body_imc(65,1.65)
    expect(bodyMass.body_category).to eq({category: 'Normal (healthy weight)'})
  end

  it "should get the category: Overweight" do
    bodyMass.body_imc(80,1.65)
    expect(bodyMass.body_category).to eq({category: 'Overweight'})
  end

  it "should have an NoMethodError" do
    expect{bodyMass.body_category}.to raise_error(NoMethodError)
  end

end


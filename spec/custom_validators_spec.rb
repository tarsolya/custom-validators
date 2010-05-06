# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'active_model'
require 'custom_validators'

class EmailValidatorTest
  include ActiveModel::Validations
  
  attr_accessor :email, :real_id
  
  validates :email, :email => true
end

class RealIdValidatorTest
  include ActiveModel::Validations
  
  attr_accessor :real_id

  validates :real_id, :real_id => true
end

describe "Custom Email Validator" do
  
  before :each do
    @foo = EmailValidatorTest.new
  end
  
  it "should validate a proper email address" do
    @foo.email = 'foo@bar.com'
    @foo.valid?.should be_true
  end
  
  it "should invalidate bad email address" do
    @foo.email = 'imnot@agood.email@address'
    @foo.valid?.should be_false
  end
  
end

describe "Custom Real ID Validator" do
  
  before :each do
    @foo = RealIdValidatorTest.new
  end
  
  it "should validate a proper Real ID" do
    @foo.real_id = 'tarsolya.tarsolya'
    @foo.valid?.should be_true
  end

  it "should validate a capitalized Real ID" do
    @foo.real_id = 'Capitalized.butnothere'
    @foo.valid?.should be_true
  end
  
  it "should validate a minimum length Real ID" do
    @foo.real_id = 'foo.bar'
    @foo.valid?.should be_true
  end
  
  it "should invalidate a generic bad Real ID" do
    @foo.real_id = 'this.cantbe.good'
    @foo.valid?.should be_false
  end
  
  it "should invalidate a Real ID without a dot" do
    @foo.real_id = 'wemusthaveadot'
    @foo.valid?.should be_false
  end

  it "should invalidate a Real ID with numbers in it" do
    @foo.real_id = 'andwe88.dontwant888numbers'
    @foo.valid?.should be_false
  end
  
  it "should invalidate a Real ID with accented chars in it" do
    @foo.real_id = 'andáccented.chars'
    @foo.valid?.should be_false
  end
  
  it "should invalidate a Real ID with too short segments" do
    @foo.real_id = 'a.bc'
    @foo.valid?.should be_false
  end
  
end

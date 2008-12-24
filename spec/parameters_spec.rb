require 'parameters'

require 'spec_helper'

describe Parameters do
  before(:all) do
    class TestParameters
      include Parameters

      parameter :var, :description => 'Test parameter'

      parameter :var_with_default,
                :default => 'thing',
                :description => 'This parameter has a default value'

      parameter :var_without_default,
                :description => 'This parameter does not have a default value'
    end

    class InheritedParameters < TestParameters

      parameter :child_var, :description => 'Child parameter'

    end
  end

  describe "in a Class" do
    it "should provide parameters" do
      TestParameters.params.should_not be_empty
    end

    it "can have default values for parameters" do
      TestParameters.param_value(:var_with_default).should == 'thing'
    end

    it "should provide class methods for paremters" do
      TestParameters.var = 1
      TestParameters.var.should == 1
    end

    it "should inherite the super-classes parameters" do
      InheritedParameters.has_param?(:var).should == true
      InheritedParameters.has_param?(:child_var).should == true
    end

    it "should provide direct access to the parameter objects" do
      param = TestParameters.get_param(:var)

      param.should_not be_nil
      param.name.should == :var
    end

    it "raise a ParamNotFound exception when directly accessing non-existent parameter objects" do
      lambda { TestParameters.get_param(:unknown) }.should raise_error(Parameters::ParamNotFound)
    end

    it "should provide descriptions for parameters" do
      TestParameters.describe_param(:var).should_not be_empty
    end

    it "should be able to create an object with initial parameter values" do
      obj = TestParameters.new(:var => 2, :var_with_default => 'stuff')

      obj.var.should == 2
      obj.var_with_default.should == 'stuff'
    end
  end

  describe "in an Object" do
    before(:all) do
      @test = TestParameters.new
      @test_inherited = InheritedParameters.new
    end

    it "should provide direct access to all parameters" do
      @test.params[:var].should_not be_nil
      @test.params[:var_with_default].should_not be_nil
    end

    it "should allow for mass assignment of parameters" do
      test2 = TestParameters.new
      test2.params = {:var => 5, :var_with_default => 'hello'}

      test2.var.should == 5
      test2.var_with_default.should == 'hello'
    end

    it "can have default values for parameters" do
      @test.param_value(:var_with_default).should == 'thing'
    end

    it "should provide instance methods for parameters" do
      @test.var = 2
      @test.var.should == 2
    end

    it "should set instance variables for paramters" do
      @test.instance_variable_get('@var_with_default').should == 'thing'

      @test.var = 3
      @test.instance_variable_get('@var').should == 3
    end

    it "should contain the parameters from all ancestors" do
      @test_inherited.has_param?(:var).should == true
      @test_inherited.has_param?(:child_var).should == true
    end

    it "should provide direct access to the parameter objects" do
      @param = @test.get_param(:var)

      @param.should_not be_nil
      @param.name.should == :var
    end

    it "should raise a ParamNotFound exception when directly accessing non-existent parameter objects" do
      lambda { @test.get_param(:unknown) }.should raise_error(Parameters::ParamNotFound)
    end

    it "should allow for setting parameters en-mass" do
      @test.params = {:var => 3, :var_with_default => 7}

      @test.param_value(:var).should == 3
      @test.param_value(:var_with_default).should == 7
    end

    it "should provide descriptions for parameters" do
      @test.describe_param(:var).should_not be_empty
    end

    it "should require that certain parameters have non nil values" do
      lambda {
        @test.instance_eval { require_params(:var_without_default) }
      }.should raise_error(Parameters::MissingParam)
    end
  end
end

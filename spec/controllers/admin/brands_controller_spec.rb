require 'spec_helper'

describe Admin::BrandsController do
  include Devise::TestHelpers

  before do
    admin = double('admin')
    request.env['warden'].stub :authenticate! => admin
    controller.stub :current_admin => admin
  end

  describe "GET new" do
    it "assigns a new Brand" do
      get :new
      assigns(:brand).should be_new_record
    end

    context "from failed POST" do
      it "should assign brand from flash" do
        brand = mock_model(Brand)

        Brand.should_not_receive(:new)
        get :new, {}, {}, {:brand => brand} #action, parameters, session, flash

        assigns(:brand).should eq brand
      end
    end
  end

  describe "POST create" do

    def do_create
      post :create, :brand => { :name => "value" }
    end

    context "with valid brand" do
      before do
        @brand = mock_model(Brand, :save => true)
        Brand.stub!(:new).and_return(@brand)
      end

      it "should empty flash" do
        do_create
        flash[:brand].should be_nil
      end

      it "should redirect" do
        do_create
        response.should redirect_to(new_admin_brand_path)
      end
    end

    context "with invalid brand" do
      before do
        @brand = mock_model(Brand, :save => false)
        Brand.stub!(:new).and_return(@brand)
      end

      it "should create brand" do
        Brand.should_receive(:new).with("name" => "value").and_return(@brand)
        do_create
      end

      it "should not save brand" do
        @brand.should_receive(:save).and_return(false)
        do_create
      end

      it "should set flash" do
        do_create
        flash[:brand].should eq @brand
        flash[:brand].should be_a Brand
      end

      it "should redirect to new" do
        do_create
        response.should redirect_to new_admin_brand_path
      end
    end
  end

  describe "GET edit" do
    context "with valid id" do
      before do
        @id = "123"
        @brand = mock_model(Brand, :new_record => false)
        Brand.stub!(:find_by_id!).and_return(@brand)
      end

      def do_edit
        get :edit, { :id => @id }
      end

      it "should find brand by id" do
        Brand.should_receive(:find_by_id!).with(@id).and_return(@brand)
        do_edit
      end

      it "should assign brand" do
        do_edit

        assigns(:brand).should eq @brand
      end
    end

    context "with invalid id" do
      it "should raise ActiveRecord::RecordNotFound" do
        lambda { get :edit, {:id => "non-existant-id"} }.should raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "PUT update" do
    def do_update
       put :update, :brand => { :name => "value" }, :id => 1
    end

    context "with valid brand" do
      before do
        @brand = mock_model(Brand, :save => true)
        Brand.stub!(:find_by_id!).and_return(@brand)
      end

      it "should find brand" do
        Brand.should_receive(:find_by_id!).with("1").and_return(@brand)
        do_update
      end

      it "should save brand" do
        @brand.should_receive(:save).and_return(true)
        do_update
      end

      it "should empty flash" do
        do_update
        flash[:brand].should be_nil
      end

      it "should redirect" do
        do_update
        response.should redirect_to(new_admin_brand_path)
      end
    end

    context "with invalid brand" do
      before do
        @brand = mock_model(Brand, :save => false)
        Brand.stub!(:find_by_id!).and_return(@brand)
      end

      it "should find brand" do
        Brand.should_receive(:find_by_id!).with("1").and_return(@brand)
        do_update
      end

      it "should not save brand" do
        @brand.should_receive(:save).and_return(false)
        do_update
      end

      it "should set flash" do
        do_update
        flash[:brand].should eq @brand
        flash[:brand].should be_a Brand
      end

      it "should redirect to new" do
        do_update
        response.should redirect_to new_admin_brand_path
      end
    end

    context "with invalid id" do
      it "should raise ActiveRecord::RecordNotFound" do
        lambda { put :update, {:id => "non-existant-id"} }.should raise_exception(ActiveRecord::RecordNotFound)
      end
    end
  end
end

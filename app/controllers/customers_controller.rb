# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :set_customer, only: %i[edit update show destroy]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to customers_path, notice: 'Customer created succesfully!'
    else
      render :new
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id), notice: 'Customer updated!'
    else
      rendr :edit
    end
  end

  def edit; end

  def show; end

  def destroy 
    if @customer.destroy 
      redirect_to customers_path, notice: 'Customer destroyed!'
    else 
      render :index
    end
  end 

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:id, :name, :email, :phone, :smoker, :avatar)
  end
end

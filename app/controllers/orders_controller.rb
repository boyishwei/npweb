class OrdersController < ApplicationController
require 'securerandom'

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    if !signed_in?
	puts "signed in"
    else
	puts "not signed in"
	flash[:error] = '请先登录!'
	redirect_to root_path
	return
    end

    @order = Order.new
    @user = current_user
    puts @user.address
    puts @user.address2
    
    #initialize order before insert
    #@order.product_id = params[:product][:id]
    @order.user_id = current_user.id
    @order.product_id = params[:product][:id] 
    @order.os_id = 0
    @order.order_no = SecureRandom.hex(10)
    #end of initialize
    @product = Product.new(params[:product])
    @product.id = params[:product][:id]

    respond_to do |format|
      format.html  #new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    
    @product = Product.find(@order.product_id)
    puts @product.name
    respond_to do |format|
      if @order.save
        format.html { render action: "show" }
	#format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def callback
    puts "run call back"
    puts "==========================================================>=>=>=>=>=>=>=>="
    puts params[:v_oid]
    @order = Order.find_by_order_no(params[:v_oid])
    @configs = Configs.find_by_name("cb_key")
    key = @configs.value
    @configs = Configs.find_by_name("cb_currency")
    moneytype = @configs.value

    @product = Product.find(@order.product_id)
    puts "to_do, md5 validation"
    md5Str = params[:v_oid] + params[:v_pstatus] + params[:v_amount] + params[:v_moneytype] + key
    puts "md5str"
    puts md5Str
    md5 = Digest::MD5.hexdigest(md5Str).upcase
    puts "md5"
    puts md5

    puts (md5 == params[:v_md5str])
    if(md5 == params[:v_md5str])
	params[:v_pstatus]=='20'?status=10:status=11

	remarks = params[:v_pmode] + ": return code " + params[:v_pstatus] + " , return message " + params[:v_pstring]

	#validate the price and real paid amount
	if @product.price != params[:v_amount]
	    remarks += " Error: the price and the realy payment is not equal!"
	    @order.update_attributes(os_id:status,remarks:remarks)
	end
    else
	puts "message was be tampered"
    end
	
    puts "update ordr status"
    puts "==========================================================>=>=>=>=>=>=>=>="
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end

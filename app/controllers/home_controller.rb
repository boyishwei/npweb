class HomeController < ApplicationController
  def index
    @products = Product.all
    respond_to do |format|
        format.html { render action: "index" }
	format.js
    end
  end
  
  def login
    user = User.find(:all, :conditions=>["username=? and passwd=password(?)",params[:user][:username],params[:user][:passwd]])

    if user.length >0
	puts "#################################################################corect###############"    
	puts '#{user.id}'
    else
	puts "=================================================================incorect================="
        flash.now[:error] = '用户名密码错误!'
        @title = 'Sign in'
        #render action: 'index'
        #puts "#{user.username}"
    end

    respond_to do |format|
      #format.html { redirect_to users_url }
      format.js
    end
  end
	
  def demo
    respond_to do |format|
        format.html { render action: "demo" }
        format.js
    end
  end
end

class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  #Новая
  #Отклонена
  #Принята

  # GET /orders
  # GET /orders.json
  def index
    #@orders = Order.all
    if current_user.reader || current_user.admin
      #если читатель
      @orders = created
    else
      #если писатель
      @orders = list
      @orders = @orders.paginate(page: params[:page])
    end
  end

  def list
    if current_user.reader || current_user.admin
      #если читатель
      @orders = reader_list
    else
      #если писатель
      @orders = writer_list
    end
  end

  def writer_list             #свои
    @orders = Order.all
    @orders = @orders.where(user_id: current_user)
    #@orders = @orders.paginate(page: params[:page])
    #render :index
  end

  def reader_list             #Все
    #@orders = Order. paginate(page: params[:page])
    @orders = Order.all
    #@orders = @orders.paginate(page: params[:page])
    #render :index
  end

  #Все
  def all
    #@orders = Order. paginate(page: params[:page])
    @orders = Order.all
    @orders = @orders.paginate(page: params[:page])
    render :index
  end

  #Новые
  def created
    @orders = list
    #@orders = Order.all
    #@orders = @orders.where("order_status = 'Новая'")
    @orders = @orders.where(order_status: "Новая")
    @orders = @orders.paginate(page: params[:page])
    render :index
  end

  #Принятые
  def accepted
    @orders = list
    #@orders = Order.all
    @orders = @orders.where(order_status: "Принята")
    @orders = @orders.paginate(page: params[:page])
    render :index
  end

  #Отклоненные
  def rejected
    @orders = list
    #@orders = Order.all
    @orders = @orders.where(order_status: "Отклонена")
    @orders = @orders.paginate(page: params[:page])
    render :index
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    #@order = Order.new
    #Добавил
    @order = current_user.orders.build
  end

  # GET /orders/1/edit
  def edit
    if @order.order_status == "Новая" || current_user.admin
      render :edit
    else
      #flash[:notice] = "Редактирование закрыто для заявок в статусе 'Принята' и 'Отклонена'"
      flash[:info] = "Редактирование закрыто для заявок в статусе 'Принята' и 'Отклонена'"
      #flash[:error] = "Редактирование закрыто для заявок в статусе 'Принята' и 'Отклонена'"
      #flash[:warning] = "Редактирование закрыто для заявок в статусе 'Принята' и 'Отклонена'"
      #flash[:success] = "Редактирование закрыто для заявок в статусе 'Принята' и 'Отклонена'"
      redirect_to order_path
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    #@order = Order.new(order_params)
    #Добавил
    @order = current_user.orders.build(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :reader_id, :order_status, :contract_date, :abonent, :address, :phone, :phone_mobile, :connection_date, :inet_tariff_plan, :inet_device_contract, :inet_installment_plan, :iptv_tariff_plan, :iptv_device_contract, :iptv_installment_plan, :passport_series, :passport_number, :passport_registration_date, :passport_issued_by, :date_of_birth, :place_of_birth)
    end
end

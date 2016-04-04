class ItemsController < ApplicationController
  before_action :set_item, :updateP, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    for item in @items
      item.update(price: updatePrice(item))
    end

  end

  # GET /items/1
  # GET /items/1.json
  def show

  end

  # GET /items/new
  def new
    @menus = MenuItem.all
    @item = Item.new

  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
    @item.update(price: updatePrice(@item))
    @item.order.calPrice()
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
      updatePrice()
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      # params.require(:item).permit(:name, :price,:menu_item_id)
      params.require(:item).permit(:menu_item_id,:order_id)
    end
    def updateP
      updatePrice(@item)
    end
    def updatePrice(item)
      if item.price == 0.0 or item.price.nil?
        item.update(price: item.menu_item.price)
      end
      deltaP = 0.0
      for custo in item.customizations
        deltaP += custo.modifier.deltaPrice
      end
      if (item.price - deltaP != item.menu_item.price)
        return deltaP + item.menu_item.price
      end
      return item.price
    end
end

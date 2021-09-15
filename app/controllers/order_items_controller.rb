class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:destroy, :edit, :update, :suma, :resta]
  before_action :authorized_user?, only: [:create, :update, :destroy]
  skip_after_action :verify_authorized

  def new
    @order_item = current_order.order_items.new
    #authorize @order_item
  end

  def create
    @order_item = current_order.order_items.new(order_items_params)
    #authorize @order_item

    if @order_item.save
      wear = @order_item.wear

      redirect_to wear_path(id: @order_item.wear_id), notice: "#{wear.descripcion} ha sido agregado en tu carrito de compra"
    else
      render :new
    end
  end

  def edit
  end

  def update
    #authorize @order_item
    if @order_item.update(order_items_params)
      redirect_to order_path(current_order), notice: "Has actualizado un item de tu carrito de compra"
    else
      render :edit
    end
  end

  def destroy
    #authorize @order_item
    if @order_item.destroy
      redirect_to order_path, alert: "Has eliminado un item desde tu carrito de compra"
    end
  end
  
  # Juan Pablo, ya tienes el order_item
  # lo buscaste en set_order_item desde before_action
  def suma
    # ord = OrderItem.find_by(@order) # que tratas de encontar? https://api.rubyonrails.org/classes/ActiveRecord/FinderMethods.html#method-i-find_by
    # la orden con cual trabajas es current_order, la seteamos en ApplicationController#current_order
    # columna 'cantidad' en base datos dentro de la tabla 'order_items' YA tiene que ser Integer
    # cant = @order_item.cantidad + 1 # eso es mala manera 
    @order_items.cantidad += 1 # eso es lo que buscas (Clase 02-Flows & Arrays)

    # no se puede redireccionar sin verificar si se guardo o no
    # redirect_to order_path # tampoco así! El path 'order_path' te va a dar un error, porque nunca le pasaste el ID de la orden a la cual lo rediccionas
    # por lo tanto:
    if @order_item.save
      # también hay que notificar al cliente que se realizo correctamente la acción
      redirect_to order_path(current_order), notice: "Bingo! Agregaste un item mas!"
    else
      # que pasa si se pudó agregar?
      # logicamente, es redireccionar a la pagina de donde se inicio el proceso de sumar
      # es decir, pagina donde clickeaste ese link
      redirecto_to order_path(current_order), alert: "Sorry, my friend, algo paso mal"
    end
  end

  # Aca pasa lo mismo
  # Este metodo necesita el mismo refactoring
  # Si llegas a tener tiempo y ganas, pensá como podes utilizar 1 metodo en vez de dos diferentes
  def resta
    order = @order.find_by(set_order)
    cant = order.cantidad.to_i - 1
    order.update_attribute :cantidad, cant
  end


  private

  def set_order_item
    @order_item = current_order.order_items.find(params[:order_id])
  end

  def order_items_params
    params.require(:order_item).permit(:wear_id, :order_id, :price, :cantidad, :total_price)
  end

  def authorized_user?
    if current_user != current_order.user
      redirect_to root_path, alert: "No estas autorizado para esta acción"
    end
  end

end

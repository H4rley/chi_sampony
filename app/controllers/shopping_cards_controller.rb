class ShoppingCardsController < ApplicationController

  

  def show
  end

  def create  	
    # @shopping_card.add_item(params[:id])
    @card_item = CardItem.new(product_id: params[:id], shopping_card_id: @shopping_card.id, quantity: 1)
     @card_item.save
      # flash[:notice] = 'Successfully added product to your card.'
	# else
	  # flash[:error] = 'Error'
	# end
   # redirect_to root_path
   head :ok
  end

end
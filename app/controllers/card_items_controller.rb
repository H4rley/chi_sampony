class CardItemsController < ApplicationController

  def add_product
    @card_item = CardItem.new(product_id: card_item_params[:product_id], shopping_card_id: @shopping_card.id, quantity: 1)
    if @card_item.save
      flash[:notice] = 'Successfully added product to your card.'
	else
	  flash[:error] = 'Error'
	end
   redirect_to root_path
  end

  private

  def card_item_params
    
  end

end
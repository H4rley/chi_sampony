class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_card

  def set_card
	@shopping_card = ShoppingCard.find_by_id session[:shopping_card_id]
	@shopping_card = ShoppingCard.create unless @shopping_card
	session[:shopping_card_id] = @shopping_card.id
  end
end

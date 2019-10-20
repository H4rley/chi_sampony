# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_card

  def set_card
    @shopping_card = ShoppingCard.find_by_id session[:shopping_card_id]
    @shopping_card ||= ShoppingCard.create
    @shopping_card.user_id = current_user&.id
    session[:shopping_card_id] = @shopping_card.id
  end

  def find_order
    query = Order.where(session_id: session.id, state: :new)
    if current_user
      query = query.or(Order.where(user_id: current_user.id, state: :new))
    end
    query.first || Order.new
  end
end

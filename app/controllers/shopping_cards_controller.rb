# frozen_string_literal: true

class ShoppingCardsController < ApplicationController
  def show
    @card_items = @shopping_card.card_items # .group_by(:id)
    @order = find_order
    @payments = Payment.all
    @transports = Transport.all
  end

  def create
    @card_item = CardItem.where(shopping_card_id: @shopping_card.id, product_id: params[:id]).first_or_initialize
    @card_item.quantity = @card_item.quantity.to_i + 1
    @card_item.save
    head :ok
  end

  def destroy
    @card_item = CardItem.where(shopping_card_id: @shopping_card.id, product_id: params[:id]).first
    @card_item.quantity -= 1
    @card_item.quantity == 0 ? @card_item.destroy : @card_item.save
    head :ok
  end
end

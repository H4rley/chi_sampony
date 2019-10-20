# frozen_string_literal: true

class OrdersController < ApplicationController
  def create
    begin
      Order.transaction do
        order = Order.new order_params
        order.state = :new

        address = Address.create address_params
        order.address = address
        order.user = current_user
        order.session_id = session.id
        order.payment_price = order.payment.price
        order.transport_price = order.transport.price

        order.save!

        @shopping_card.card_items.each do |item|
          order.order_items << OrderItem.create(product_id: item.product_id,
                                                count: item.quantity,
                                                price: item.quantity * item.product.price)
        end
      end
    end

    byebug
    respond_to do |format|
      format.js { render 'shopping_cards/create' }
      format.json { render json: 'ok' }
    end
  end

  def update
    begin
      Order.transaction do
        order = find_order
        order.attributes = order_params

        address = order.address
        address.attributes = address_params
        order.address = address
        order.user = current_user
        order.session_id = session.id
        order.payment_price = order.payment.price
        order.transport_price = order.transport.price

        order.save!

        order.order_items.delete_all

        @shopping_card.card_items.each do |item|
          order.order_items << OrderItem.create(product_id: item.product_id,
                                                count: item.quantity,
                                                price: item.quantity * item.product.price)
        end
      end
    end

    flash[:notice] = 'Successfully ordered products'
    respond_to do |format|
      format.js { render 'shopping_cards/create' }
    end
  end

  private

  def order_params
    params.require(:order).permit(:transport_id, :payment_id)
  end

  def address_params
    params.require(:order).require(:address)
          .permit(:first_name, :last_name, :email, :telephone_number, :country, :city, :postal_code)
  end
end

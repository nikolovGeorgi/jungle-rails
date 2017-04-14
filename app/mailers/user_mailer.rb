class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email(user)
    @user = user
    @url = '/login'
    mail(to: @user.email, subject: "Welcome to the Jungle!")
  end

  def order_email(user, order)
    @order = order
    mail(to: @order.email, subject: "Order # #{@order.id}")
    UserMailer.order_email(User, Order.includes(line_items: :product).first)
  end
end

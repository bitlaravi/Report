require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ticket = tickets(:one)
  end

  test "should get index" do
    get tickets_url
    assert_response :success
  end

  test "should get new" do
    get new_ticket_url
    assert_response :success
  end

  test "should create ticket" do
    assert_difference('Ticket.count') do
      post tickets_url, params: { ticket: { base_fare: @ticket.base_fare, booking_id: @ticket.booking_id, canceled_amount: @ticket.canceled_amount, discount: @ticket.discount, gst: @ticket.gst, is_canceled: @ticket.is_canceled, net_amount: @ticket.net_amount, refound_amount: @ticket.refound_amount, seat_no: @ticket.seat_no } }
    end

    assert_redirected_to ticket_url(Ticket.last)
  end

  test "should show ticket" do
    get ticket_url(@ticket)
    assert_response :success
  end

  test "should get edit" do
    get edit_ticket_url(@ticket)
    assert_response :success
  end

  test "should update ticket" do
    patch ticket_url(@ticket), params: { ticket: { base_fare: @ticket.base_fare, booking_id: @ticket.booking_id, canceled_amount: @ticket.canceled_amount, discount: @ticket.discount, gst: @ticket.gst, is_canceled: @ticket.is_canceled, net_amount: @ticket.net_amount, refound_amount: @ticket.refound_amount, seat_no: @ticket.seat_no } }
    assert_redirected_to ticket_url(@ticket)
  end

  test "should destroy ticket" do
    assert_difference('Ticket.count', -1) do
      delete ticket_url(@ticket)
    end

    assert_redirected_to tickets_url
  end
end

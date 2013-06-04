require 'test_helper'

class SchedulesControllerTest < ActionController::TestCase
  user_context :admin_context do
    context 'GET :admin' do
      setup do
        get :admin
      end

      should respond_with :success
    end
  end
end

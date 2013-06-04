require 'test_helper'

class SchedulesControllerTest < ActionController::TestCase
  user_context :admin_context do
    setup do
      @schedule = FactoryGirl.create :schedule
    end

    context 'GET :index' do
      setup do
        get :index
      end

      should respond_with :success
    end

    context 'GET :new' do
      setup do
        get :new
      end

      should respond_with :success
    end

    context 'POST :create' do
      setup do
        post :create, schedule: { name: 'Fred', from: DateTime.now, til: (DateTime.now + 4.days) }
      end

      should respond_with :redirect
      should redirect_to('index') { schedules_path }
    end

    context 'GET :edit' do
      setup do
        get :edit, id: @schedule.id
      end

      should respond_with :success
    end

    context 'PUT :update' do
      setup do
        put :update, id: @schedule.id, schedule: { til: (DateTime.now + 7.days) }
      end

      should respond_with :redirect
      should redirect_to('index') { schedules_path }
    end

    context 'GET :show' do
      setup do
        get :show, id: @schedule.id
      end

      should respond_with :success
    end

    context 'GET :new_position' do
      setup do
        get :new_position, id: @schedule.id
      end

      should respond_with :success
    end
  end
end

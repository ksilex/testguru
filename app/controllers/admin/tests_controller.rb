class Admin::TestsController < ApplicationController
  before_action :authenticate_user!, only: :start
  before_action :set_test, only: %i[show result start edit update]
  def index
    @tests = Test.all
  end

  def show
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def new
    @test = current_user.created_tests.new
  end

  def create
    @test = current_user.created_tests.new(test_params)
    if @test.save
      redirect_to admin_tests_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:category_id, :title, :level)
  end
end

class TestsController < ApplicationController

  before_action :find_test, only: %i[show destroy]
  before_action :set_category_user, only: %i[create]
  before_action :all_tests, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    result = "Params: #{params.inspect}\n\n"
    @tests.each do |test|
      result += "id: #{test.id}, title: #{test.title}\n"
    end
    render plain: result
  end

  def new

  end

  def create
    result = "#{params.inspect}\n"
    @test = @category.tests.new(test_params)
    @test.author = @user
    result += "#{@test.inspect}"
    if @test.save
      render plain: result
    else
      render :new
    end
  end

  def show
    render inline: '<%= @test.title%>'
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def all_tests
    @tests = Test.all
  end

  def set_category_user
    @category = Category.find(params[:category_id].to_i)
    @user = User.first
  end

  def rescue_with_test_not_found
    render plain: "Test was not found"
  end
end

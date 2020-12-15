class TestsController < ApplicationController

  before_action :find_test, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    result = "Params: #{params.inspect}\n\n"
    tests = Test.all
    tests.each do |test|
      result += "id: #{test.id}, title: #{test.title}\n"
    end
    render plain: result
  end

  def new

  end

  def create
    render plain: params.inspect
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

  def rescue_with_test_not_found
    render plain: "Test was not found"
  end
end

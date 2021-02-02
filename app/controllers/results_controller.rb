class ResultsController < ApplicationController

  before_action :set_result, only: %i[show update finish gist]

  def show; end

  def finish
    #если это поместить в update, получится вложенный if
    if @result.test_passed?
      @result.passed = true
      @result.save

      hand_out_badges
    end
  end

  def update
    if @result.empty_answer?(params[:answer_ids])
      flash.now[:notice] = t('.empty_answer')
    else
      @result.accept!(params[:answer_ids])
    end


    if @result.completed? || @result.time_off?
      #TestsMailer.completed_test(@result).deliver_now
      redirect_to finish_result_path(@result)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@result.current_question)
    last_call = result.call

    if result.success?
      flash_options = { notice: "#{view_context.link_to( t('.success'), last_call.html_url)}" }
      current_user.gists.create(question_id: @result.current_question.id, url: @result.current_question)
    else
      flash_options = { alert: t('.failure')}
    end

    redirect_to @result, flash_options
  end

  def hand_out_badges
      Badge.all.each do |badge|
        public_send(badge.rule.to_sym, param: badge.parameter, badge: badge)
    end
  end

  def all_in_category(param:, badge:)
    test_ary = Test.not_empty_tests.with_category(param).pluck(:id).sort
    check_rule(param, badge, test_ary)
  end

  def all_at_level(param:, badge:)
    test_ary = Test.not_empty_tests.with_level(param).pluck(:id).sort
    check_rule(param, badge, test_ary)
  end

  def for_first_time(param:, badge:)
    results = current_user.results.test_with_title(param)
    if results.count == 1
      current_user.badges.push(badge)
      results.last.badges.push(badge)
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end

  def unbaged_results
    badged_results_ids = current_user.results.passed.with_badges.pluck(:id)
    current_user.results.passed.except_ids(badged_results_ids)
  end

  def check_rule(param, badge, test_ary)
    results = unbaged_results
    result_ary = results.pluck(:test_id).uniq.sort

    if result_ary == test_ary
      current_user.badges.push(badge)
      results.tests_results(test_ary).each do |result|
        result.badges.push(badge)
      end
    end
  end

end

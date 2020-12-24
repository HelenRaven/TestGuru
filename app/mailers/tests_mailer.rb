class TestsMailer < ApplicationMailer

  def completed_test(result)
    @user = result.user
    @test = result.test

    mail to: @user.email, subject: 'You just completed TestGuru Test!'
  end
end

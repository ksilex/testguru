class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @client = client || GithubClient.new
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: I18n.t(".desciption", @question.test.title),
      files: {
        "TestGuruQuestion.txt": {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = ["#{I18n.t("activerecord.models.question")}:", @question.body, "#{I18n.t(".answers")}:"]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
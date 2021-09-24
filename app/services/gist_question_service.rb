class GistQuestionService

  def initialize (question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['GIST_GITHUB_TOKEN'])
  end

  def call
    @client.create_gist(gists_params)
  end

  private

  def gists_params
    {
     description: "Question from test #{@test.title} by TestGuru project",
     public: true,
     files: {
             "quest-text-guru-question.txt" => {
            content: gist_content
          }
        }
      }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
    end
end

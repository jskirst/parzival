class PagesController < ApplicationController
	
	def home
		@title = "Home"
	end
  
  def generate
		@text = params[:text]
    logger.debug "PROCESSING BEGUN"
    @raw_questions = ""
    cmd = 'java -Xmx1200m -cp question-generation.jar edu/cmu/ark/QuestionAsker --model models/linear-regression-ranker-reg500.ser.gz --just-wh --max-length 20 --text "'+@text+'"'
    begin
      logger.debug `ls`
      Dir.chdir "qg" do
        io = IO.popen(cmd)
        line = io.gets
        while line
          @raw_questions += line.chomp
          line = io.gets
        end
        io.close
      end
      logger.debug @raw_questions.chomp
    rescue
      logger.debug "FUCK:"+$!.to_s
    end
    logger.debug "PROCESSING COMPLETE."
    respond_to do |format|
      format.json
    end
  end
end
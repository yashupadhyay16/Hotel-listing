module Api
	module V1
		class ResumesController < ApplicationController
			def index
				@resumes = Resume.all.with_attached_resume
				#render json: resumes.last(5).collect{ |x| {"id" => x.id, "file_path" => x.avatar_path, "" } }
			end    
			
			def create
				resume = Resume.new(resume_params)
				if resume.save
					render json: resume
				else
					render json: {error: "error in submiting form"}
				end   
			end

			def show
				@resume = Resume.with_attached_resume.find(params[:id])
				
			end    

			private

			def resume_params
				
				params.require(:resume).permit(:fname,:lname,:email,:contact,:experience,:role,:resume)
			end  
		end    
	end    
end
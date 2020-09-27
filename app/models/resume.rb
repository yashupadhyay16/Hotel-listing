class Resume < ApplicationRecord
    has_one_attached :resume

    def avatar_path
        return "" unless resume.attached?
        ActiveStorage::Blob.service.path_for(resume.key)
      end


    # def public_file_url
    #     if self.file&.attachment
    #         if Rails.env.development?
    #             self.file_url = Rails.application.routes.url_helpers.rails_blob_url(self.file, only_path: true)
    #         else
    #             self.file_url = self.file&.service_url&.split("?")&.first
    #         end
    #     end
    #     #set a default lazily
    #     self.file_url ||= ActionController::Base.helpers.asset_path("default_company_file.png")
    # end
end

module Api
  module V1
    class ContactsController < ApplicationController

      def index
        contact = Contact.all
        render json: contact
      end

      def create
      	contact = Contact.new(contact_params)
				if contact.save
					render json: contact
        else
          render json: {error: 'fail'}
        end
      end

      def show
        contact = Contact.find(params[:id])
        render json: contact
			end

      private

      def contact_params
        params.require(:contact).permit(:name,:message,:subject,:email)
      end
		end
  end
end

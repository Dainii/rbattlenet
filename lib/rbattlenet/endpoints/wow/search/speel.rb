module RBattlenet
  module Wow
    class Search::Spell < RBattlenet::Endpoints::Base
      def self.path(params)
        # Params should be an ash that look like this
        # { '_page': 1, '_pageSize': 100, 'orderby': 'field', filters: { 'filed1': 'value', 'field2': 'value'}}
        RBattlenet.uri("data/wow/search/spell?#{build_query(params)}namespace=static-")
      end

      def self.build_query(params)
        query = ''

        query += "_page=#{params[:_page]}&" if params[:_page]
        query += "_pageSize=#{params[:_pageSize]}&" if params[:_pageSize]
        query += "orderby=#{params[:orderby]}&" if params[:orderby]

        params[:filters]&.each do |filter|
          query += "#{filter[0]}=#{filter[1]}&"
        end

        query
      end
    end
  end
end

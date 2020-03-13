require 'forwardable'

module RBattlenet
  class ResultCollection
    extend Forwardable

    attr_reader :results

    def initialize
      @results = []
    end

    def add(subject, field, response)
      data = if response.code == 200
        result = JSON.parse(response.body, object_class: Result) rescue nil
        result && (result.is_a?(Array) ? Result.new(data: result.size == 1 ? result.first : result) : result)
      end || EmptyResult.new(status_code: response.code)

      data.status_code ||= 200
      data.source, data.field = subject, field
      @results << data
    end

    def complete(subject, results_needed)
      subject_results = @results.group_by(&:source)[subject]
      if subject_results.size == results_needed
        @results.reject!{ |result| result.source == subject }

        unless base_result = subject_results.select(&:empty?).first
          base_result = subject_results.select{ |result| result.field == :itself }.first
          (subject_results - [base_result]).each{ |result| base_result << result }
        end

        @results << base_result
        base_result
      end
    end

    def has_errors?
      @results.map(&:class).include? EmptyResult
    end

    def_delegators :results, :first, :last, :size
  end

  class Result < OpenStruct
    def <<(result)
      send("#{result.field}=", result.send(result.field) || result)
    end

    def empty?
      false
    end
  end

  class EmptyResult < Result
    def empty?
      # It is possible for some fields to not exist even though the resource itself exists
      ![:pvp_bracket_2v2, :pvp_bracket_3v3, :pvp_bracket_rbg].include?(field)
    end
  end
end

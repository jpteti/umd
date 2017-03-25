require "umd/version"
require "umd/constants"
require "httparty"

module Umd
  class UMD
    include HTTParty
    base_uri(Umd::API_V0_ROOT)

    def self.corrected_options_hash(opts)
      options_hash = opts

      if options_hash[:departments].is_a?(Array)
        options_hash[:departments] = options_hash[:departments].join(',')
      end

      # This must remain beneath the flattening of the array into a string
      if options_hash[:departments].is_a?(String)
        options_hash[:departments].upcase!
      end

      if options_hash[:sort]
        options_hash[:sort] = self.formatted_sort_hash(options_hash[:sort])
      end

      options_hash
    end

    def self.formatted_sort_hash(sort_hash)
      final_string = ""

      if sort_hash[:asc]
        final_string = sort_hash[:asc].map { |attribute| attribute.to_s }.join(',') + ","
      end

      if sort_hash[:desc]
        final_string = final_string + sort_hash[:desc].map { |attribute| "-#{attribute}" }.join(',')
      end

      final_string
    end

    # def self.courses
    #   self.courses(nil)
    # end
    #
    # # def self.courses(options = {})
    # #   final_options = corrected_options_hash(options)
    # #
    # #   self.get('/courses', {query: final_options})
    # # end

    def self.courses(course_ids=nil, options={})
      if course_ids.is_a?(Hash)
        options = course_ids
        course_ids = nil
      end

      final_options = corrected_options_hash(options)

      path = '/courses'

      if !course_ids.nil?
        path = '/courses/'

        if course_ids.is_a?(Array)
          path = path + course_ids.map { |s| s.to_s.downcase }.join(',')
        else
          path = path + course_ids.downcase
        end
      end

      self.get(path, {query: final_options})
    end

    def self.course_list(options={})
      final_options = corrected_options_hash(options)

      self.get('/courses/list', {query: final_options})
    end

    def self.sections(section_ids, options={})
      final_options = corrected_options_hash(options)

      path = '/sections/'

      if section_ids.is_a?(Array)
        path = path + section_ids.map { |s| s.to_s.downcase }.join(',')
      else
        path = path + section_ids.downcase
      end

      self.get(path, {query: final_options})
    end

    def self.departments(options={})
      self.get('/courses/departments', {query: corrected_options_hash(options)})
    end

    def self.professors(options={})
      final_options = corrected_options_hash(options)

      self.get('/professors', {query: final_options})
    end
  end
end

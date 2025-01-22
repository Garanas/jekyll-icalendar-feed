require 'jekyll'
require 'icalendar'

module Jekyll
  class ICalendarFeed < Jekyll::Generator
    safe true
    priority :lowest

    # @param content [String]
    # @return [String]
    def extract_excerpt(content)
      # Regular expression to match the tag with optional spaces around it
      delimiter_regex = /<!--\s*excerpt-end\s*-->/
    
      if content =~ delimiter_regex
        content.split(delimiter_regex).first.strip
      else
        content.strip
      end
    end

    # @param site [Jekyll::Site]
    # @param posts [Array<Jekyll::Document>] An array of Jekyll::Document objects
    # @param config [Hash] Configuration options for the calendar
    # @return [ICalendar::Calendar]
    def make_calendar(site, config, posts)
      # Initialize a new iCalendar
      cal = Icalendar::Calendar.new

      posts.each do |post|
        # feature: skip posts that are not published
        next unless post.published?

        # feature: skip posts without the calendar construct
        next unless post.data['event']

        # feature: if no categories configured, generate a feed for all categories
        # feature: if categories are configured, generate a feed for only those categories
        categories_to_process = config.dig(:categories) || []
        next unless categories_to_process.empty? || (post.categories & categories_to_process).any?

        # Create a new event
        cal.event do |e|
          # Mandatory fields
          e.uid = post.id

          e.dtstamp = site.time
          e.created = post.data['event']['date']

          e.dtstart = post.data['event']['dtstart']

          # Optional fields
          e.summary = post.data['title'] || "Untitled Post"
          e.description = extract_excerpt post.content || "No content available"
          e.url = post.data['redirectURL']

          if post.data['event'].key?('dtend')
            e.dtend = (post.data['event']['dtend']) + (60 * 60) # Assume 1-hour events
          end

          if post.data['event'].key?('image')
            e.image = post.data['event']['image']
          end
        end
      end

      cal
    end

    # @param site [Jekyll::Site]
    def generate(site)
      config = site.config["icalendar_feed"] || {}

      # all events
      calendar = make_calendar site, config, site.posts.docs
      PageWithoutAFile.new(site, __dir__, "", 'news/icalendar/posts.ics').tap do |file|
        file.content = calendar.to_ical
        site.pages << file
      end

      # events per category
      site.categories.each do |category, posts|

        # feature: if no categories configured, generate a feed for all categories
        # feature: if categories are configured, generate a feed for only those categories
        categories_to_process = config.dig('categories') || []
        next unless categories_to_process.empty? || categories_to_process.include?(category)

        calendar = make_calendar site, config, site.posts.docs

        PageWithoutAFile.new(site, __dir__, "", "news/icalendar/posts-#{category}.ics").tap do |file|
          file.content = calendar.to_ical
          site.pages << file
        end
      end
    end
  end
end
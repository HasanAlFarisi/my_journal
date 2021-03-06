class Calendar < Struct.new(:view, :date, :callback)
    HEADER = %w[Su Mo Tu We Th Fr Sa]
    START_DAY = :sunday
 
    delegate :content_tag, to: :view
 
    def table
      content_tag :tr, class: "calendar" do
        header + week_rows
      end
    end
 
    def header
      content_tag :tr, class: "week" do
        HEADER.map { |day| content_tag :th, day }.join.html_safe
      end
    end
 
    def week_rows
      weeks.map do |week|
        content_tag :tr do
          week.map { |day| day_cell(day) }.join.html_safe
        end
      end.join.html_safe
    end
 
    def day_cell(day)
      content_tag :td, view.capture(day, &callback), class: day_classes(day), data_id: day_id(day), data_date: day_complete(day)
    end
 
    def day_classes(day)
      classes = []
      classes << "date"
      classes << "current" if day == Date.today
      classes << "not-month" if day.month != date.month
      classes.empty? ? nil : classes.join(" ")
    end

    def day_id(day)
      data = []
      data << day
      data.empty? ? nil : data.join(" ")
    end

    def day_complete(day)
      data = []
      data << day.strftime("%d %B %Y")
      data.empty? ? nil : data.join(" ")
    end
 
    def weeks
      first = date.beginning_of_month.beginning_of_week(START_DAY)
      last = date.end_of_month.end_of_week(START_DAY)
      (first..last).to_a.in_groups_of(7)
    end
end
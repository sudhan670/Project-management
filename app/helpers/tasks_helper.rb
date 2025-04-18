module TasksHelper
    def status_badge_class(status)
      {
        "pending" => "badge badge-warning",
        "in_progress" => "badge badge-primary",
        "completed" => "badge badge-success"
      }.fetch(status, "badge badge-secondary")
    end
  end
  
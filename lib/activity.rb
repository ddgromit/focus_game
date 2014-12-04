class Activity
  attr_accessor :app

  def initialize(app)
    @app = app
  end

  def on_topic?
    !['VLC'].include?(title)
  end

  def title
    app.title
  end

  def to_s
    title
  end
end
require_relative './warehouse'

class EventHandler
  INIT_EVENT_REGEX = /^(init)\s(\d+)\s(\d+)/
  VIEW_EVENT_REGEX = /^(view)/
  STORE_EVENT_REGEX = /^(store)\s(\d+)\s(\d+)\s(\d+)\s(\d+)\s(\S)/
  LOCATE_EVENT_REGEX = /^(locate)\s(\S)/
  REMOVE_EVENT_REGEX = /^(remove)\s(\d+)\s(\d+)/

  def handle_event(event)
    event.match(allowed_event_regex) do |m|
      warehouse.public_send(*m.captures.compact)
    end
  end

  def allowed_event_regex
    Regexp.union(INIT_EVENT_REGEX, VIEW_EVENT_REGEX,
                 STORE_EVENT_REGEX, LOCATE_EVENT_REGEX, REMOVE_EVENT_REGEX)
  end

  private

  def warehouse
    @warehouse ||= Warehouse.new
  end
end

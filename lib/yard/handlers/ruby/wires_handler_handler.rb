
module YARD::Handlers::Ruby
  class WiresHandlerHandler < YARD::Handlers::Ruby::Base
    include DecoratorHelper
    handles method_call(:handler)
    
    process do
      kwargs = (statement.parameters[1] || [])
        .select { |n| n.type==:assoc }
        .map    { |n| [n[0][0].to_sym, n[1][0].source] }
        .to_h
      
      channel = kwargs[:channel]
      event   = kwargs[:event]
      
      process_decorator nodes: 0 do |method, proxy, name|
        event_name   = event || :":#{name}"
        channel_text = channel ? " on channel: #{channel}" : ""
        method.add_tag YARD::Tags::Tag.new 'note',
          "Handles #{event_name} events#{channel_text}"
      end
    end
  end
end

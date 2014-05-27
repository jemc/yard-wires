
require 'spec_helper'


describe YARD::Handlers::Ruby::WiresHandlerHandler do
  include StringParsing
  
  it "tags the given method with a decorator tag and a ntoe tag" do
    parse_string <<-'END'
      class Obj
        handler def foo
        end
        
        handler def bar
        end, channel: :chan
        
        handler def baz
        end, channel: :chan2, event: :bar
      end
    END
    
    [
      'Obj#foo', 'Handles :foo events',
      'Obj#bar', 'Handles :bar events on channel: :chan',
      'Obj#baz', 'Handles :bar events on channel: :chan2',
    ].each_slice 2 do |path, note_text|
      meth = YARD::Registry.at path
      meth.should be_a YARD::CodeObjects::MethodObject
      
      decorators = meth.tags.select { |x| x.tag_name=='decorator' }
      decorators.count.should eq 1
      decorators.first.text.should eq 'handler'
      
      notes = meth.tags.select { |x| x.tag_name=='note' }
      notes.count.should eq 1
      notes.first.text.should eq note_text
    end
  end
  
end

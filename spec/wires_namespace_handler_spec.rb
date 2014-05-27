
require 'spec_helper'


describe YARD::Handlers::Ruby::WiresNamespaceHandler do
  include StringParsing
  
  it "replaces the dynamic Wires namespace module with a simplified one" do
    parse_string <<-CODE
      module Wires.current_network::Namespace
        class Foo
          def bar
          end
        end
      end
    CODE
    
    YARD::Registry.at('Wires').         should be_a YARD::CodeObjects::ModuleObject
    YARD::Registry.at('Wires::Foo').    should be_a YARD::CodeObjects::ClassObject
    YARD::Registry.at('Wires::Foo#bar').should be_a YARD::CodeObjects::MethodObject
  end
  
end

# ---- requirements
$LOAD_PATH.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'sort_alphabetical'

# ---- Helpers
def pending_it(text,&block)
  it text do
    pending(&block)
  end
end
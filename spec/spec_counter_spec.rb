require 'rspec'
require_relative './../lib/git_stat'
include RspecScanner

describe RspecScanner do
  it 'detects the correct hash values' do
    Dir[File.dirname(__FILE__) + '/fixtures/*.rb'].each do |fixture_test|
    test_spec_examples_array = rspec_scanner(fixture_test)
    rspec_output_finder(test_spec_examples_array).should == ({ :runtime => !nil, :examples => !nil, :failures => !nil, :pending => !nil })
  end
  end
   #Hash.has_key? has_value?
  it 'can still work if the pending is non-existent' do
    test_spec_examples_array = rspec_scanner('./spec/fixtures/some_passing_some_failing_no_pending.rb')
    rspec_output_finder(test_spec_examples_array)[:examples].should == 3
    rspec_output_finder(test_spec_examples_array)[:failures].should == 1
    rspec_output_finder(test_spec_examples_array)[:pending].should == 0
     #== ({ :runtime => !nil, :examples => !nil, :failures => !nil, :pending => !nil })

  end
end

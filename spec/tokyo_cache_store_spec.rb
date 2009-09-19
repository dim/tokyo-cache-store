require 'rubygems'
require 'active_support'
require 'spec'

$LOAD_PATH << File.dirname(__FILE__) + '/../lib'
require File.dirname(__FILE__) + '/../init'

describe ActiveSupport::Cache::TokyoStore do
  DB_FILE = File.expand_path(File.dirname(__FILE__) + '/../tmp/cache.tch')
  PID_FILE = File.expand_path(File.dirname(__FILE__) + '/../tmp/cache.pid')
  
  before :all do
    `tchmgr create #{DB_FILE.to_str}`
    `ttserver -dmn -le -pid #{PID_FILE.to_str} #{DB_FILE.to_str}`
  end
  
  after :all do
    Process.kill('TERM', File.read(PID_FILE).to_i)
    FileUtils.rm [DB_FILE, PID_FILE], :force => true
  end
   
  def write(*keys)
    keys.each do |key|
      @store.write key, "Plan #{key}"
    end
  end
  
  before do
    @store = ActiveSupport::Cache::TokyoStore.new
    @store.clear
    write 'A', 'B'
  end
    
  it 'should perform basic operations' do
    @store.read('A').should == 'Plan A'
    @store.exist?('A').should be(true)
    
    @store.read('C').should be_nil
    @store.exist?('C').should be(false)
    
    @store.write 'C', 'Plan C'
    @store.read('C').should == 'Plan C'
    
    @store.delete('A').should be(true)
    @store.delete('D').should be(false)    
    @store.read('A').should be_nil
  end

  it "should 'fetch' as evey other store" do
    @store.exist?('C').should be(false)
    @store.fetch('C').should be_nil
    @store.fetch('C') do
      'Plan C'
    end.should == 'Plan C'
    @store.fetch('C').should == 'Plan C'
  end

  it "should be able to delete matching records" do
    write 'c'
    @store.keys.should == ['A', 'B', 'c']
    @store.delete_matched /[A-Z]/
    @store.keys.should == ['c']    
  end

end

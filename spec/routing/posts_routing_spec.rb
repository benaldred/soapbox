require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PostsController do
  
  describe "route generation" do
    it "should maps root" do
      route_for(:controller => "posts", :action => "index").should == "/"
    end
  
    it "should map show" do
      route_for(:controller => "posts", :action => "show", :permalink => "a-title", :month => "01", :year => "2009").should == "/2009/01/a-title"
    end
    
    it "should map by_year" do
      route_for(:controller => "posts", :action => "by_year", :year => "2009").should == "/2009"
    end
    
    it "should map by_month" do
      route_for(:controller => "posts", :action => "by_month", :year => "2009", :month => "06").should == "/2009/06"
    end
    
    it "should map archives" do
      route_for(:controller => "posts", :action => "archives").should == "/archives"
    end
  end
  
  describe "route recognition" do
    it "generates params for #show" do
      params_from(:get, "/2009/01/a-title").should == {:controller => "posts", :action => "show", :permalink => "a-title", :month => "01", :year => "2009"}
    end
    
    it "generates params for #by_year" do
      params_from(:get, "/2009").should == {:controller => "posts", :action => "by_year", :year => "2009"}
    end
    
    it "generates params for #by_month" do
      params_from(:get, "/2009/06").should == {:controller => "posts", :action => "by_month", :year => "2009", :month => "06"}
    end
    
    it "generates params for #archives" do
      params_from(:get, "/archives").should == {:controller => "posts", :action => "archives"}
    end
  end


end
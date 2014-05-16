require 'spec_helper'

module WpRoster
  
  class BrowserTester
    include Browser
  end

  describe Browser do

    let(:browser) { BrowserTester.new }

    context "with a successful request" do
      before do
        stub_request(:get, "http://mock.url").to_return({body: 'ok', status: 200})
      end
      let(:document) { browser.retrieve("http://mock.url") }


      it "should return a Nokogiri::HTML::Document object" do
        document.should be_a Nokogiri::HTML::Document
      end

      it "contains a body tag" do
        document.css('body').length.should eq 1
      end
    end

    context "with an unsuccessful request" do
      before do
        stub_request(:get, "http://mock.url").to_return({body: '', status: 404})
      end
      
      it "raises a NotFoundError" do
        expect { browser.retrieve("http://mock.url") }.to raise_error(NotFoundError)
      end
    end

    

    describe "#document" do
      context "with a successful request" do

        before do
          stub_request(:get, "http://mock.url").to_return({body: 'ok', status: 200})
          browser.url = "http://mock.url"
        end

        it "returns a Nokogiri::HTML::Document object" do
          browser.document.should be_a Nokogiri::HTML::Document
        end

        it "contains a body tag" do
          browser.document.css('body').length.should eq 1
        end
      end

      context "with an unsuccessful request" do
        before do
          stub_request(:get, "http://mock.url").to_return({body: '', status: 404})
          browser.url = "http://mock.url"
        end
        
        it "raises a NotFoundError" do
          expect { browser.document }.to raise_error(NotFoundError)
        end
      end

    end
        
  end

end
# encoding: utf-8
require 'spec_helper'

describe 'url input' do

  include FormtasticSpecHelper

  before do
    @output_buffer = ''
    mock_everything
    Formtastic::Helpers::FormHelper.builder = FormtasticBootstrap::FormBuilder
  end

  describe "when object is provided" do
    before do
      concat(semantic_form_for(@new_post) do |builder|
        concat(builder.input(:url))
      end)
    end

    it_should_have_input_wrapper_with_class(:url)
    it_should_have_input_wrapper_with_class(:clearfix)
    it_should_have_input_wrapper_with_class("control-group")
    it_should_have_input_wrapper_with_class(:stringish)
    it_should_have_input_class_in_the_right_place
    it_should_have_input_wrapper_with_id("post_url_input")
    it_should_have_label_with_text(/Url/)
    it_should_have_label_for("post_url")
    it_should_have_input_with_id("post_url")
    it_should_have_input_with_type(:url)
    it_should_have_input_with_name("post[url]")

  end

  describe "when namespace is provided" do

    before do
      concat(semantic_form_for(@new_post, :namespace => "context2") do |builder|
        concat(builder.input(:url))
      end)
    end

    it_should_have_input_wrapper_with_id("context2_post_url_input")
    it_should_have_label_and_input_with_id("context2_post_url")

  end
  
  describe "when required" do
    it "should add the required attribute to the input's html options" do
      with_config :use_required_attribute, true do 
        concat(semantic_form_for(@new_post) do |builder|
          concat(builder.input(:title, :as => :url, :required => true))
        end)
        output_buffer.should have_tag("input[@required]")
      end
    end
  end
  
end


# encoding: utf-8
require 'action_view'
require 'active_support'
require 'spec_helper'

include ActionView::Helpers
include ActionView::Context

require_relative '../../../app/helpers/railsstrap/datepicker_helper'
include Railsstrap::DatePickerHelper

describe Railsstrap::DatePickerHelper, :type => :helper do

  it 'should render a date_picker html block' do
    expect(date_picker.gsub(/\s/, ''))
    .to eql(DEFAULT_DATEPICKER.gsub(/\s/, ''))
  end

  it 'should override default options' do
    expect(date_picker({id: "testing"}).gsub(/\s/, '')).to eql(DATEPICKER_ID_CHANGED.gsub(/\s/, ''))
  end

  it 'should render a script tag' do
    expect(date_picker_javascript.gsub(/\s/, ''))
    .to eql(DEFAULT_JS_DATEPICKER.gsub(/\s/, ''))
  end

  it 'date_picker_javascript should accept a hash of options' do
    expect(date_picker_javascript({language: 'ru'}).gsub(/\s/, ''))
    .to eql(DEFAULT_JS_DATEPICKER_OPTIONS.gsub(/\s/, ''))
  end

end

DEFAULT_DATEPICKER = <<-HTML
<div class="input-group date" data-date-language="en" data-datepicker="true">
  <input class="form-control" id="date_picker" type="text"/>
  <span class="input-group-addon">
    <i class="fa fa-calendar"></i>
  </span>
</div>
HTML

DATEPICKER_ID_CHANGED = <<-HTML
<div class="input-group date" data-date-language="en" data-datepicker="true">
  <input class="form-control" id="testing" type="text"/>
  <span class="input-group-addon">
    <i class="fa fa-calendar"></i>
  </span>
</div>
HTML

DEFAULT_JS_DATEPICKER = <<-HTML
<script>//<![CDATA[jQuery(function(){jQuery([data-datepicker=\"true\"]).datetimepicker({\"selector\":\"[data-datepicker=\\\"true\\\"]\",\"language\":\"en\",\"icons\":{\"time\":\"fafa-clock-o\",\"date\":\"fafa-calendar\",\"up\":\"fafa-chevron-up\",\"down\":\"fafa-chevron-down\"}});});//]]></script>
HTML

DEFAULT_JS_DATEPICKER_OPTIONS = <<-HTML
<script>//<![CDATA[jQuery(function(){jQuery([data-datepicker=\"true\"]).datetimepicker({\"selector\":\"[data-datepicker=\\\"true\\\"]\",\"language\":\"ru\",\"icons\":{\"time\":\"fafa-clock-o\",\"date\":\"fafa-calendar\",\"up\":\"fafa-chevron-up\",\"down\":\"fafa-chevron-down\"}});});//]]></script>
HTML
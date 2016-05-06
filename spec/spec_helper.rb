require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'shoulda/matchers'
require 'webmock/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |file| require file }

module Features
  # Extend this module in spec/support/features/*.rb
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include Features, type: :feature
  config.include Formulaic::Dsl, type: :feature

  config.infer_base_class_for_anonymous_controllers = false
  config.order = 'random'
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.use_transactional_fixtures = false

  config.before(:each) do
    stub_request(:post, "https://codeclimate.com/test_reports").
      with(:body => "\u001F\x8B\b\u0000\xE0\xC1\u0012W\u0000\u0003\xCDW\xDBn\xDB8\u0010\xFD\u0017=g\u0013\xDE/\xF9\x95\xA2\u0010\x86á#D\u0017C\x92\x93\xEE\u0006\xF9\xF7\u001D5m\xE3X\xB5s\x81\x83\u0016\u0006\f\x89\"%\x9E\xE1\x993g\u001E\xAA\x91\xB6C=\u000F\xB7\xD4W\xD7U0\u0014\x8D\v\x91\xB2#S\u0002\u001Agc\xF1:F\r\xD2)\u0011\x80\xAC/\bDAe/\xA2\n\xCAA\xF2BG\xEB|\u0012\u0018\xAA\x8Bj\u001Av#R]\x9A\x96\xA6\xEA\xFA\xCBC\xD5CG\xFCj\xD8n\xAFp\xE8\xE7qh[\u001A\xA7+\xBEo\e\x84\xB9\u0019\xFA\xFAy\xFCrL\xFC\x8E\xD4\u000E\xA9n2\xAF\xCAA\xBB(H\xA6\b.\xE5\u001C@\u0004oM\xD2Ai\xE9c\u0004\xA4\x82I\xC1\xB2\b\x87;\u001Aa\xB3|닼\xE8wm\xFB\xF4\xF7t\xFD\xF5\xE7\f\xCA\xF5\x96x\x87\xFD\\]K!.\xC5\xF3\xF84\x8F\xD4o\xE6\e~\xB0\f\xB7MO\xBC\xB5]?3\x90\x87j\u001Efh\xABk\xFBk~u\xAD.\xAA\xAE\x99\xA6\xE5R<>^\u001Cź\u0005\xBC\xE5\x9DM'\x80\xAA\x98\xC8$\u0014%\xF8\u0018\x92\x96\xD9y%]\"\x8D\xC1\e\u0010 =\xA5\xA0uY\u0001݇\xFAǁ\xDES\x8BCw\u0012\xA8e\u0016\xA9\x9C\x88\x84\x96X\x8AE\x81*\xC4$\xB5\xD3XLv9\xA9\u0014\\Z\x9F\xE8\u001F\azC\xED\xF6\x90\xB9Oc+\xD6\u0012\x9F\x9C\x8FƢ\u0003\e\xF9@)\t\xA6\xAA\xF4>\u0017\u001D\x92\xB0\u0014\u0003\xAA\"~\xCBڳ\xE1R{\xB8\xE4\u0011\\|N\xA5\xD9\xECC:\xC4\xE2\xA4\xCB`\x84/\xB9D\u0017\xBCW\u0011\xAC\xF0\u001E\x8A&\xA5\x92\x88,\u000E9k\x84\x93\u0019\xF8\xFC{y\x86\xFB\u0019\xBA?A\xAE\u0017\u001E[\xFC\xB1\xBF\xB3\u0005٘}\xF6\x88\xD3aN\xC30\xAF\xF2\x81l\u0011(\v\xA0H\x98Ɇ\xA8\x9D\xD5\u00028\xE8%s\xAE$\x84b\xC1\x99\x83\xF8\xBE\b\xD3\xF9м!\u0015~`\xA1\xFE\xAE\u0019\x87\xBE\xE3o\u001DB\xE2\xF2\x90\xA3\xC8謌\x86KD,\x92S:F\xABK\u0011\xC6{C^{-\xFC\tHg\xC6\xF5\x96\u0014_㚮f\x9AV\xE8r\xC6\u0000Q+kE\xF1\\%\x85\xB16rJ\x84\xE8Eq^\u001A+\v%ux`\xAF\xB1\xF7dj\xFCʆ\xE3w\xEF{\xD3\xF1\u0019\xE7\xE3\x92\xDCןW\xA2\xDE\xF4\xCD\xDC@\xDB\xFC\xB7\bl\xE2r9\x8F,\x98\xF5\xC4.\xA2G\u001E[eM\xD4\xC1\"\xAB\xA9\x8F)\v\a!+\xAD\\\xC6lX{3?\xB1Y\u0017\x9B\u000E\u0015\xF6\xDC\xC2 \x8E\xC3\xF7{\xE8_\x91\x85\u0017\xE0q\u0018n\e\xAE\xA0\u0013\x8D?\xC6\u000E\xB1{X\u0000\xC7\"J\xCC\xC5\a\x93ؘ\xF9,\u0003s.\x94\x90\u0003z/(yu\u0014\xFB\xF9\xF2J\xBF\xBDļ\u0000\x99\x9B\tRK\xF5\xB7\xAE\xAD\xB70B\xB7:`T&GǮ\xCFA\xB6J\x81P^\xA0'i#\xF8(\x9D\u0010\xD9g$c\xFFb\x904\x8EÚ\xB9>\xA9@\xEC\t\xD84;\xA72k{\b m \x96\u000E\v\xD6%\f6\u0015C\xAF\xFA\x9F\xF7J\xC9\xDB'}\x8E\u0006\xAB\xB0\u0017G\xF7\x8E8r+1\xD3\xF8\xC4\u0013Z\xAE\xDAa\xB3i\xFA\xCDad\r\xC4hH\x92O\xC9#\xA9\xC0\xFC@\xF6ҐM\xE0\xF6!Dɔ!\xB4\xF2\xB4&|N1}\u000Fo\x9A\xBE\xB4\x84\x8B\u0017[\x91\x87M\x82։\xF3\u001E\x83qRH\xAD\u0004F\xF6\x98H\x81\xE52\u0005\xBE!\u00141\xBC[\xF6>\xD1<\x9D\xD0H\xE9>(\x92]\xD3Q=\xFF\xBB\xA5U\x842\xCA\u0010٨\xB25\x95\xA8\xC1\xB1\x88x]\xA0x\xE3Hi[\x923\u0005M>.\x8E\xE7Gi>\b\x92+\xE0m=3\xD2a\xB72!`\x8C[\u001C\xA3\xA6\x98\x83P\x91\r\xB8\b\x8A͈\xF2\x81P{\x95%I\xA5\xF4\xA1\x8A\x9C\x8D\xDC\xF2\x83\xE4\x9Eh\x9A\x96\xC6i\x9A\x87\x91\u000EQ\x85l$\x97\xF2\u0002\xD6\xC4\u0014\u0013+<w\xBF¨\x94\bSN\u0011%\xFAR\xE4a\xAF\xF17\x89\xFE\xFD\b\xDBg\xA9Z\xD1S\xF3\xD1p\xF7gK\xE6\xE6)\nv\xC4\xDER\xE1B\xE0\u0000$\xB34HJ\u0014\xCDo\xAD\xF1\t\xBD~E\xF1\xCFw\xEA\xEFh\u0010F\xA6\xED:?\x83v\x8E\xF5\xD8f\xF0\xD9\e\xAF\x84I\xB9\u0014_\x80U-\xA0a۶\xD8\u00198\u0014\xE9\xE7\xFE\xEFS\xE4Y\xBF\x80\xF2\xF5\xA2\u001Aw}\rˋ\x8D\u0013\xC1x\xE1չ\"\u0018\xF7ˠ\x8D\xFB\u001F\xBE\xA8\x988\v\x95\xAA\xEB\u0002\xEDD\u0017զ\x99\x97\xB57\u0004ߵ\x8D\u0013\\\xB2\xC3uJ\xEA\x94c\x94\xBC\u0001\x88܋p\xBApeS\u0014\x88J\xF2\xEE{\x84\xBA\xAE\x99g\xDE\xD53\n\u0017\u001539\x8D\xD0\xE3\xCD\xD31̀s]\x86\xB1\xAB\xF8\xDB{\x8D\xCF\xF7\xFDr\xEBS\x97\x85\xC7\xF7\xC3x\xCB\xF3\xC7iKȯ\xDE\xDE/{\xB9\xBA\u0019:\xBA\xDA%\x86\xB7\xBB\xEA\xA6\xFC\u000F\xE3\xD9}\xE3\xC7#4\xEDT\x8F\xDC鞚55ݖ\x8B\xDCp\xF7\xEA\xCC\ru5Gk\u0011\r\x9E&.\xED\xA5Xv\x8B\xCD\xE2\x90\xEF\u001A\xA4e\xB3?\x99\u05CC\xD8b\xB3\u0010n״\x99\u0019\xC7`\x9A\xD2\xD0\xC8\u000F\xE5\xE2\u0015\u007F\x8F\xFEg\xBC\xEA\xE9\u0006\xDE\u0013\xE7\xC7\xC7\xFF\u0001\xC6e%I@\u0015\u0000\u0000",
        :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Encoding'=>'gzip', 'Content-Type'=>'application/json', 'User-Agent'=>'Code Climate (Ruby Test Reporter v0.5.0)'}).
      to_return(:status => 200, :body => "", :headers => {}) 
  end
end

ActiveRecord::Migration.maintain_test_schema!
Capybara.javascript_driver = :webkit
WebMock.allow_net_connect!

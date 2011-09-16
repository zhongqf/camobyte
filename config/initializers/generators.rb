Rails.application.config.generators do |g|
    g.test_framework = :rspec
    g.fixture_replacement :factory_girl, :dir => 'spec/factories'
  	g.form_builder :simple_form
  	g.template_engine :slim
end

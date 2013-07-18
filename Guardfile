guard 'rspec', :version => 2 do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { "spec" }
  watch('spec/spec_helper.rb')  { "spec" }
end

guard 'ctags-bundler', :src_path => ["lib", "spec"] do
  watch(/^(lib|spec)\/.*\.rb$/)
  watch('Gemfile.lock')
end

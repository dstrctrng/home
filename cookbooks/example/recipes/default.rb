execute "example" do
  command "uname -a"
end

template "#{$microwave_root}/config/example.yml" do
  mode 0644
  source "example.erb"
end

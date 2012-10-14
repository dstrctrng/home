directory "#{node[:release_dir]}/log"
directory "#{node[:release_dir]}/service"

runit_service "bitlbee" do
  project_dir node[:project_dir]
  release_dir node[:release_dir]
end


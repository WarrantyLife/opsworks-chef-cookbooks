require 'aws-sdk'

s3 = AWS::S3.new

# Set bucket and object name
obj = s3.buckets['wl-opsworks-config'].objects['parameters_ops.yml']

# Read content to variable
file_content = obj.read

# Log output (optional)
Chef::Log.info(file_content)

# Write content to file
file "#{deploy[:deploy_to]}/app/config/parameters_ops.yml" do
  owner 'root'
  group 'root'
  mode '0755'
  content file_content
  action :create
end

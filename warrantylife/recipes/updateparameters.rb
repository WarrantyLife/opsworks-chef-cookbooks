require 'aws-sdk'

s3 = AWS::S3.new

node[:deploy].each do |application, deploy|

  # Set bucket and object name
  obj = s3.buckets['wl-opsworks-config'].objects['parameters_ops.yml']

  # Read content to variable
  file_content = obj.read

  # Log output (optional)
  # Chef::Log.info(file_content)

  # Write content to file
  file File.join(deploy[:deploy_to], 'current', 'app', 'config', 'parameters_ops.yml') do
    owner 'deploy'
    group 'www-data'
    mode '0755'
    content file_content
    action :create
  end
end

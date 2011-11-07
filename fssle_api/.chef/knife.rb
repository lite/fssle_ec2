current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "lite"
client_key               "#{current_dir}/lite.pem"
validation_client_name   "fssle-validator"
validation_key           "#{current_dir}/fssle-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/fssle"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
#chef_home   = "#{ENV['HOME']}/.chef"

# ec2
# 
knife[:aws_access_key_id]     = "#{ENV['AWS_ACCESS_KEY_ID']}"
knife[:aws_secret_access_key] = "#{ENV['AWS_SECRET_ACCESS_KEY']}"
knife[:identity_file]         = 'fssle-ec2.pem'
knife[:aws_ssh_key_id]        = "fssle-ec2"
knife[:availability_zone]     = 'us-west-1a'
knife[:region]                = 'us-west-1'
knife[:aws_image_id]          = 'ami-43580406'

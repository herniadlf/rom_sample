require_relative 'boot'

require_relative 'lib/relations/companies'
require_relative 'lib/relations/posts'
require_relative 'lib/commands/create_company'
require_relative 'lib/commands/create_post'
require_relative 'lib/commands/delete_company'
require_relative 'lib/commands/delete_post'
require_relative 'lib/commands/update_post'

configuration = ROM::Configuration.new(:sql, "postgres://localhost:5432/#{CONFIG['db']['name']}", CONFIG['db'])
configuration.register_command(CreateCompany, DeleteCompany)
configuration.register_command(CreatePost, UpdatePost, DeletePost)
configuration.register_relation(Companies, Posts)

MAIN_CONTAINER = ROM.container(configuration)
require_relative './config/env'

use Rack::MethodOverride
use SessionsController
use PostsController
run ApplicationController
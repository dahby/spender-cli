# This file is part of Spender.

# Spender is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Spender is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with Spender.  If not, see <https://www.gnu.org/licenses/>.

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "spender/version"

Gem::Specification.new do |spec|
  spec.name          = "spender"
  spec.version       = Spender::VERSION
  spec.authors       = ["dahby"]
  spec.email         = ["dstoll243@gmail.com"]

  spec.summary       = "A simple budgeting tool."
  spec.description   = "Spender is a budgeting tool designed to track specific purchases and see where your money is going. "
  spec.homepage      = "https://github.com/dahby/spender-cli"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/dahby/spender-cli"
    spec.metadata["changelog_uri"] = "https://github.com/dahby/spender-cli/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "require_all", "~> 2.0"
  spec.add_dependency "sinatra-activerecord", "~> 2.0"
  spec.add_dependency "sqlite3", "~> 1.4"
  spec.add_dependency "pry", "~> 0.10.3"
end

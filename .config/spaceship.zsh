SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true

# display async status
SPACESHIP_ASYNC_SHOW=true
SPACESHIP_ASYNC_SHOW_COUNT=false
SPACESHIP_ASYNC_PREFIX="["
SPACESHIP_ASYNC_SUFFIX="]"
SPACESHIP_ASYNC_SYMBOL="󰪣 "
SPACESHIP_ASYNC_COLOR="56949f"

# display prompt configuration
SPACESHIP_CHAR_PREFIX=""
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_SYMBOL=" "
SPACESHIP_CHAR_COLOR_SUCCESS="286983"
SPACESHIP_CHAR_COLOR_FAILURE="b4637a"

# display time configuration
SPACESHIP_TIME_SHOW=false
SPACESHIP_TIME_PREFIX="at "
SPACESHIP_TIME_COLOR="f6c177"
SPACESHIP_TIME_12HR=false

# display execution time configuration
SPACESHIP_EXEC_TIME_SHOW=true
SPACESHIP_EXEC_TIME_PREFIX="[󰥔 "
SPACESHIP_EXEC_TIME_SUFFIX="]"
SPACESHIP_EXEC_TIME_COLOR="c4a7e7"
SPACESHIP_EXEC_TIME_ELAPSED=2
SPACESHIP_EXEC_TIME_PRECISION=1

# display username config
SPACESHIP_USER_SHOW=false
SPACESHIP_USER_PREFIX="with "
SPACESHIP_USER_COLOR="286983"
SPACESHIP_USER_COLOR_ROOT="b4637a"

# display hostname config
SPACESHIP_HOST_SHOW=false
SPACESHIP_HOST_SHOW_FULL=false
SPACESHIP_HOST_PREFIX="at "
SPACESHIP_HOST_COLOR="56949f"
SPACESHIP_HOST_COLOR_SSH="286983"

# display directory config
SPACESHIP_DIR_SHOW=true
SPACESHIP_DIR_PREFIX="[󰟒 "
SPACESHIP_DIR_SUFFIX="]"
SPACESHIP_DIR_TRUNC=3
SPACESHIP_DIR_TRUNC_REPO=true       # while in git repo, show only root directory and folders inside it
SPACESHIP_DIR_COLOR="56949f bold"
SPACESHIP_DIR_LOCK_SYMBOL="  "
SPACESHIP_DIR_LOCK_COLOR="ea9d34"

# git
SPACESHIP_GIT_SHOW=true
SPACESHIP_GIT_ASYNC=true
SPACESHIP_GIT_PREFIX="["
SPACESHIP_GIT_SUFFIX="]"
SPACESHIP_GIT_ORDER=(git_branch git_status)

# git branch
SPACESHIP_GIT_BRANCH_SHOW=true
SPACESHIP_GIT_BRANCH_ASYNC=true
SPACESHIP_GIT_BRANCH_PREFIX="  "
SPACESHIP_GIT_BRANCH_SUFFIX=""
SPACESHIP_GIT_BRANCH_COLOR="c4a7e7"

# git status
SPACESHIP_GIT_STATUS_SHOW=true        # Show section
SPACESHIP_GIT_STATUS_ASYNC=true       # Render section asynchronously
SPACESHIP_GIT_STATUS_PREFIX=""        # Prefix before Git status subsection
SPACESHIP_GIT_STATUS_SUFFIX=""        # Suffix after Git status subsection
SPACESHIP_GIT_STATUS_COLOR="ea9d34"   # Color of Git status subsection
SPACESHIP_GIT_STATUS_UNTRACKED="  "  # Indicator for untracked changes
SPACESHIP_GIT_STATUS_ADDED="  "      # Indicator for added changes
SPACESHIP_GIT_STATUS_MODIFIED="  "   # Indicator for unstaged files
SPACESHIP_GIT_STATUS_RENAMED="  "    # Indicator for renamed files
SPACESHIP_GIT_STATUS_DELETED="  "    # Indicator for deleted files
SPACESHIP_GIT_STATUS_STASHED="  "    # Indicator for stashed changes
SPACESHIP_GIT_STATUS_UNMERGED="  "   # Indicator for unmerged changes
SPACESHIP_GIT_STATUS_AHEAD="  "      # Indicator for unpushed changes (ahead of remote branch)
SPACESHIP_GIT_STATUS_BEHIND="  "     # Indicator for unpulled changes (behind of remote branch)
SPACESHIP_GIT_STATUS_DIVERGED="  "   # Indicator for diverged changes (diverged with remote branch)

# packages
SPACESHIP_PACKAGE_SHOW=true	 	# Show section
SPACESHIP_PACKAGE_ASYNC=true		# Render section asynchronously
SPACESHIP_PACKAGE_SHOW_PRIVATE=false	# Show when a package is private
SPACESHIP_PACKAGE_PREFIX="["		# Section's prefix
SPACESHIP_PACKAGE_SUFFIX="]"		# Section's suffix
SPACESHIP_PACKAGE_SYMBOL="󱑤 "		# Symbol displayed before the section
SPACESHIP_PACKAGE_COLOR="907aa9"	# Section's color

# python
SPACESHIP_PYTHON_SHOW=true          # Show section
SPACESHIP_PYTHON_ASYNC=true         # Render section asynchronously
SPACESHIP_PYTHON_PREFIX="["	        # Section's prefix
SPACESHIP_PYTHON_SUFFIX="]"	        # Section's suffix
SPACESHIP_PYTHON_SYMBOL=" "	      # Symbol displayed before the section
SPACESHIP_PYTHON_COLOR="ea9d34"     # Section's color

# lua
SPACESHIP_LUA_SHOW=true	            # Show section
SPACESHIP_LUA_ASYNC=true	          # Render section asynchronously
SPACESHIP_LUA_PREFIX="["    	      # Section's prefix
SPACESHIP_LUA_SUFFIX="]"	          # Section's suffix
SPACESHIP_LUA_SYMBOL=" "	          # Symbol displayed before the section
SPACESHIP_LUA_COLOR="ea9d34"     	  # Section's color

# venv
SPACESHIP_VENV_SHOW=true	    			# Show section
SPACESHIP_VENV_ASYNC=true	    			# Render section asynchronously
SPACESHIP_VENV_PREFIX="["	    			# Section's prefix
SPACESHIP_VENV_SUFFIX="]"	    			# Section's suffix
SPACESHIP_VENV_SYMBOL="󱤅 "	    			# Symbol displayed before the section
SPACESHIP_VENV_GENERIC_NAMES=(virtualenv venv .venv) 	# Generic folder names. Parent folder will be used as name instead
SPACESHIP_VENV_COLOR="ea9d34"				# Section's color

# docker
SPACESHIP_DOCKER_SHOW=true	        # Show section
SPACESHIP_DOCKER_ASYNC=true	        # Render section asynchronously
SPACESHIP_DOCKER_PREFIX="["	        # Section's prefix
SPACESHIP_DOCKER_SUFFIX="]"	        # Section's suffix
SPACESHIP_DOCKER_SYMBOL=" "         # Symbol displayed before the section
SPACESHIP_DOCKER_COLOR="ea9d34"		  # Section's color
SPACESHIP_DOCKER_VERBOSE=false	    # Show complete Docker version

# terraform
SPACESHIP_TERRAFORM_SHOW=true       # Show section
SPACESHIP_TERRAFORM_ASYNC=true      # Render section asynchronously
SPACESHIP_PYTHON_PREFIX="["         # Section's prefix
SPACESHIP_PYTHON_SUFFIX="]"         # Section's prefix
SPACESHIP_TERRAFORM_SYMBOL="󱁢 "     # Symbol displayed before the section
SPACESHIP_TERRAFORM_COLOR=105       # Section's color

# aws
SPACESHIP_AWS_SHOW=true             # Show section
SPACESHIP_AWS_PREFIX="["            # Section's prefix
SPACESHIP_AWS_SUFFIX="]"            # Section's suffix
SPACESHIP_AWS_SYMBOL=" "           # Symbol displayed before the section
SPACESHIP_AWS_COLOR="907aa9"        # Section's color

# ansible
SPACESHIP_ANSIBLE_SHOW=true         # Show section
SPACESHIP_ANSIBLE_ASYNC=true        # Render section asynchronously
SPACESHIP_ANSIBLE_PREFIX="["        # Section's prefix
SPACESHIP_ANSIBLE_SUFFIX="]"        # Section's suffix
SPACESHIP_ANSIBLE_SYMBOL="󱂚 "       # Symbol displayed before the section
SPACESHIP_ANSIBLE_COLOR="c4a7e7"    # Section's color

# azure
SPACESHIP_AZURE_SHOW=true	          # Show section
SPACESHIP_ANSIBLE_ASYNC=true        # Render section asynchronously
SPACESHIP_AZURE_PREFIX="["	        # Section's prefix
SPACESHIP_AZURE_SUFFIX="]"	        # Section's suffix
SPACESHIP_AZURE_SYMBOL=" "         # Symbol displayed before the section
SPACESHIP_AZURE_COLOR="907aa9"	    # Section's color

# kubernetes
SPACESHIP_KUBECTL_SHOW=true         # Show section
SPACESHIP_KUBECTL_ASYNC=true        # Render section asynchronously
SPACESHIP_KUBECTL_PREFIX="["        # Section's prefix
SPACESHIP_KUBECTL_SUFFIX="]"        # Section's suffix
SPACESHIP_KUBECTL_COLOR="907aa9"    # Section's color
SPACESHIP_KUBECTL_SYMBOL="󱃾 "       # Symbol displayed before the section

SPACESHIP_KUBECTL_VERSION_SHOW=true       # Show kubectl version
SPACESHIP_KUBECTL_VERSION_ASYNC=true      # Render section asynchronously
SPACESHIP_KUBECTL_VERSION_PREFIX=""       # Section's prefix
SPACESHIP_KUBECTL_VERSION_SUFFIX=" "      # Section's suffix
SPACESHIP_KUBECTL_VERSION_COLOR="907aa9"  # Section's color

SPACESHIP_KUBECTL_CONTEXT_SHOW=true             # Show kubectl context
SPACESHIP_KUBECTL_CONTEXT_PREFIX=""             # Section's prefix
SPACESHIP_KUBECTL_CONTEXT_SUFFIX=""             # Section's suffix
SPACESHIP_KUBECTL_CONTEXT_COLOR="907aa9"        # Section's color
SPACESHIP_KUBECTL_CONTEXT_SHOW_NAMESPACE=true   # Display namespace

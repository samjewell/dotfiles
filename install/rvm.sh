# Get RVM somehow:
\curl -sSL https://get.rvm.io | bash -s stable

# Install Bundler (and awesome_print) into the Global gemset:
rvm @global do gem install bundler awesome_print

# Add those two gems to ~/.rvm/gemsets/global.gems
# SAM ADD SOMETHING GREAT HERE

# Also do that even when RVM is updated!!!
# https://rvm.io/gemsets/initial & https://rvm.io/workflow/hooks
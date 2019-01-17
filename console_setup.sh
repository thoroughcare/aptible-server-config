if test -e "/app/config/initializers/pry.rb"; then
    echo 'has pry'
else
    curl -o config/initializers/pry.rb https://raw.githubusercontent.com/thoroughcare/aptible-server-config/master/pry.rb
fi
has_awesome=$(tail Gemfile -n 1 | grep awesome | wc -l)

if (( $has_awesome > 0 )); then
  echo "awesome_print installed already"
else
  pryrails=$(cat Gemfile  | grep pry-rails | uniq);	
  pryawesome=$(cat Gemfile | grep pry-awesome_print | uniq | tail -n1);

  echo $pryrails >> /app/Gemfile
  echo $pryawesome >> /app/Gemfile
  clear
fi

echo "to install extras(vim, tmux, dropbox utility) run the following:"
echo "bash <(curl -s https://raw.githubusercontent.com/thoroughcare/aptible-server-config/master/console_setup.sh)"

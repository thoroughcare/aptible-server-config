
has_awesome=$(tail Gemfile -n 1 | grep awesome | wc -l)

if (( $has_awesome > 0 )); then
  echo "awesome_print installed already"
else
  echo "gem 'pry-rails'" >> /app/Gemfile
  echo "gem 'pry-awesome_print'" >> /app/Gemfile
  echo "gem 'awesome_print'" >> /app/gemfile
  bundle install
  clear
fi

while true; do
    read -p "Do you wish to install dev extras? (vim, tmux, less, dropbox_uploader)" yn
    case $yn in
        [Yy]* ) bash <(curl -s https://raw.githubusercontent.com/thoroughcare/aptible-server-config/master/install_extras.sh); break;;
        [Nn]* ) echo "skipping extras \n"; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "to install extras run this script again with:"
echo "bash <(curl -s https://raw.githubusercontent.com/thoroughcare/aptible-server-config/master/console_setup.sh)"

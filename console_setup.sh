
has_awesome=$(tail Gemfile -n 1 | grep awesome | wc -l)

if (( $has_awesome > 0 )); then
  echo "awesome_print installed already"
else
  pryrails=$(cat Gemfile  | grep pry-rails | uniq);	
  pryawesome=$(cat Gemfile | grep pry-awesome_print | uniq);

  echo $pryrails >> /app/Gemfile
  echo $pryawesome >> /app/Gemfile
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

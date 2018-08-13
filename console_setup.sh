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

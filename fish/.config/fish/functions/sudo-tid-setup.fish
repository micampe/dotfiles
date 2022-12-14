function sudo-tid-setup
    sudo perl -pi -e 's/(pam_smartcard.so)/$1\nauth sufficient pam_tid.so/' /etc/pam.d/sudo
end

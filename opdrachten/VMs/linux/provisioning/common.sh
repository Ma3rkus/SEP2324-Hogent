#! /bin/bash
#
# Provisioning script common for all servers

#------------------------------------------------------------------------------
# Bash settings
#------------------------------------------------------------------------------

# Enable "Bash strict mode"
set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't mask errors in piped commands

#------------------------------------------------------------------------------
# Variables
#------------------------------------------------------------------------------
# TODO: put all variable definitions here. Tip: make them readonly if possible.

# Set to 'yes' if debug messages should be printed.
readonly debug_output='yes'


readonly pub_vr_client='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCvWBSCPwYE7N80DvYNBHp4WzjRikNUscMHeLs5vPEXoJTW2+nh7Ug+33shr7e4RGyY3kmg34Zb2bMwivGst4WIKu5i9fzQgsq4tbeuYO6rGcLGneJTM/djGn0udmhKLkLrqFdKWyuSrIFI8OwT4HjySEkWVT/vKGgPfG+4kMhGeA7PfGsVW/Oy6ioZx3/sEuP5W8TJiVpwAQ4/dkS+GWsZdfNTkmw/dJtcBQFcSP7HC7oH/6Io1ntw5aVnPiId/bzZJOzusOYjXAfEATN9m3uE0xjb7Exc3/d+gMVYwOcsP+HqKsREltw6p7BX/EsXMSLddPNPmT8sTKWlF3IA8GpYfHO11NzdtR4MMmDtNkVgFY1iTVzYil/wZm7n9aK+zZBX/aa998LMjm12jrhufzCbP1w1wzNC060RWCUPxApuTIjimN44lCtm9z0B+uOQPGDtiCXvWuv/4Eqro5Gi8DgevY4aDvdVw3hQHROchbO1rZnCKIKSaeGNzH2vyfn6kfk= xde@router'
readonly pub_vr_2='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCvT0Lr3Y7HCzQ1O2dTTip+vSOEo9VahJHeaPjpyCbfzmpDViOWe8qfI6EtgsMXnRd1vdbp4bavM1MnHNnYBGA5iKZQxxUTkEpdQ1in1tkcQlECW4yOKcNGBOxPGsA266Cl63X+wHNTGPw4lMVazZlbxZCNWEQHXrfm25kEKIAwc5PhRppLr6teOhj4qmpEvaLxNImmvFe0IlVoSdoBXhvUOsHLZav4tTaRgB6+eyLcSVrEJUqrOgwL6ifkqYw+FiXknaMPumi8DlACWsP5sre6JfTNp1jJLIuBwzyoILaDK77Hs1o5N9Nu3O2XzedvZ68sUoeX/aGLCdNS4T/k2LlCOOCjnrVY0UYeGRwQozimgdNtzTqINC7y1k4DSnKrBnbQrNbRhl8eISbFjA7LH2ppPZaildTDDS5qyOaQD3ngy72GW0RsXjQjEIEEnpLOFtyeIZ0igwqP8+3YrP6mDRRTQ4pLAFngkPCqr3IUKHTzbKwkK6RudTSVG0c3Uw4bHgs= vagrant@virtrouter1'

readonly pub_xander='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCw2GEq0d8xyOz6T97jXPmWZ7qdY0lrnWPfUzPo80b5OzV9Ys8eV1znm2tK5MNhtLrKxPQ84BERe1Lu4Hz11le0CFhcD8AEASnYKC9zK1+u7+qQxXEh1VUEPhZtFsR5ejmFkXLC4Nnv5rk7sI26SgPuDy3KLqYQsxh7RG6Ku3xJe8I/P9n91bOZB5QzU769ijc7lsZ4BBw2dbDEW59iZQezWFltTwTVFfMF42xgIwnDdNJU7DHzTeKaKQ3iikThP+PtWJ9i90HXrt01s4DXUQyLzEJL9mb1nTGoTlkad+mflgyQRGyj4SK6VGsn4g0gsDp++xwDXFk/slORE7vDFXHWatj9DCwCoAxa5WKXsiBZswPjChZRIIi9i1Uh7EuhfTjA/FZiWBbAGa88uVcRahoY/2lyIoAR8Owkv9mKReNAEm6dQgkX03gSp3X8KHq72JJnuX42Un3FyTY7JnfU+xFQqPvtr738glq3B/FN8x8v0rcj28vJh/LjnwmsVxeXRbdHAb45DL9aPhM5mDmf3oGAQxD2S1SJVRcYdVbOuwgkl1mBt79+DjMXbZ+ty/pnPOgJ+PiHoeICLHyU5p1wS6teyVnDEe6QpX0/P3G8t/d6KglcGMyxPn7vszauY3MKqy7MwSN761PPKjqVQQaWKEJsY1sWJMousLbmn4o6zz8Spw== xanle@DESKTOP-PT16KS0'
readonly pub_maarten='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZSqbJ84bIVcSJt0BoWbS9GoPHHYDG1A7pIyHpTmcc6nVm9Y6uTT47X0KxadrAd5/RDcSn3wST8w+7PFV/yJUYG0I0H6AFTQTa5/3brYylmvQD5QdEfgvlrC9aqKVrKCMNTyU0g0R7T2QmSiF+E4kL1ATZB4pzXwUyRzQWVSnAaenuoNoBOA657lSYV9Qu6M10yD3/YKJwmnbzxQ64SBa5Ws5bah6l1+dWTIRK17347RLIOo4qQkG53XV0ZtvXiPyvsGf9aFpCHd3llRk+FB0MeexV7kyys0M6XTH7WCviBN0FjVxwwRKj8WfsyF0xKnhox5cW9N7lk/uUbRAUE54aD8GfkptV4vYOamtxL4Iwr3MagpMmU0vcNV6QSvznSVbDHrq8J3TdMnJYvkA9X1+7BclszN3HUXUOMbh+Goxmff5nD7i7DuYSirplXAaYN7i6DUS3D2EGiTYh2455zx3/XmC9e55Ge1VYO6J/sJQUxXi1zsAEWjD8ZIfkzXs6OC8= maart@Maarten_A3'
readonly pub_wout='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDG/raQlCgOg2kY9cpv+1UvLLKTNScG0ZCIM6pg4LXFGRfL8UN2tfAVwCaLWuxq0p5LKOo7FBcAHpISqMV0W2+EdERgDyW84XCndCT7oKJS0LpXj0KunshfwUxBji/9XdG/qqVnvcYV6iAOm0hbhROk4Cj7STqlX1iL5k945s4rF6m7Adrcu5RviM8Fqnhd7wFGl6omEZK7nzjZdThP9QCSw4VmcIzZZ+L/8NYtC62diA09Sn+PeE4SgfVUNV39KAEn3AII+vQ8WhUDorG64x67DUhzm3R3KjgZtQtZo7yz6DOALUjzNjXeRSpvdGAyLwqHDe3G4tN13Hq+6AnI3y1MUiAHMX8i1YDao9GvnYvV7E4Hi3Vka0ES45AfxYm5hb9hGK4nxvTl3V0gace1nWDXrOuxUQkT9bDTus0QJHSYp7zLCAWnXqUItsw1kVCUJviVdGfPd1VEgHKAApM/gj1u+NitGQLmAct88SBoyx7JzucZ26sh+YA21UABshlfGg0= woutd@Laptop-WoutDT'
readonly pub_neal='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC0qNZqPwJPjwx2jFFPGxRAlX93SyUbTvtgzpslCa6Po4qHe6k383uZfLHRLX66IQCrZwT56u/YWCWWF+dJS0KG5bAJT74ve2b3bFTo4vL+JpZ3FTVI3qb+g9GRUplPxvtLtSbSVi73y7QbGgAVzy+Og1wHXgRB373HwW5weQpQjoC643txoTeCnspqVYRyqMoue+TS8642nQNHEihXVygPtU0TfS+9xbBd8uLZxN6bIwI6CQhuTQl6x1oI7F2rU4t2SH6qsdtlT3dmuKMMOhM6ux1u+QaROXWew0bnWyN0pwv4Td5MjH1ME8+wsexfb1Tem1ZJ5d1dJHaXZeI0MpREQwB8/q55cYFuNDv2uNFWnLeyrgaPoCjfvGuElZFGuHyhAA5iJhTXorR1kyALa31ZM11VaTXOD69Rys5SzMdCG5CkfZ9OST+jAaGEkNjShq+d73ZfWF0kpD1Hp2gfCKEbxAE3uY5VGt93YvdIQ2lprPer4k+jVPZwgrfUl3OORT8= nealj@DESKTOP-5EQJ57T'
readonly pub_tariq='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCn11WCqVymserrzF2+4csLfmTjCvw6C+RTa5iFkfA/jUyZJ6e/uPV89TYlSNP0ng/BTFgeAXdr8sV0YziH1yeKqR9la0M8qbiM/XgRK8zkqYr/BilSK0oCd3IbR+3XDc7+89Vir6Dxttkvuw+N22VMUgF+mzqofn7sL0QqQmWnoCBXcvC1vjxPLIpYWp44wDJw9WKA/SYo8gmsMDMvwanmkxflr5Ggg1LGV9XpP5JiRyw7QJI/eANaTSr0vwq7EENShozZjHkT5ymvicJv2Swtr7M1bKle4zJIZycPWSRt9++nyffuA42Ta9boDEJSzSDRWqMsHWsmPZmz0IfjmZe3EfuIwVPX5pbj2/KVWn+r3DQN2mSf5Kf8ix6AUU9fb1ERUfUnV31xZQZPkJdTgSVC2ksnsxG+WlAHL8m8ZY+pK1vu7Q/CznNXbCeY2Zm7QwtLuDuzqgbD1e2yFeflE8U4vW1leTP92Ya/WExEioZyMEey4z7H9QqjMt40jK3Hcn8= tariq@DESKTOP-AVBEVLG'
readonly pub_windserv='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDDckGFgU/0Fyu9IfqORyGT6ZbD4yoLioRGZMd52MPIw7Dw+OA6PKELnhCxdUIr5wmAyt9HA/IK6sJQN6Jp8a34BIvdDZg+GpSq9GNRwBcvxQjFiAu4kbxVyMi9fD6VlcnZA89SGHlrb2Zb8rdkpqE+uXfTu4B5urz/MnsbqLEoPoKMyfeAa2ZPULT2AApu757+QB1QKwHVzUu+XvMyuWwEDlXkGcIjXl6zrP1w8kWgBh6tEtp4wWieKyrikT6/bGyolSAbHqjMs70XWIe1EZPxDke6Nl4m/hsoyax9qwbUYIlkjb1iHIX3Bc0MWt7ye0cDu57HxEjLDEUnYSYOYhXyXk5TesS0D17mZPslYgSulK/0XtNZARpHYJ9FSRwKmZGYwUmD38ZbNBfCfLx22HElv4Z/GM0U/JlAJ9En02PzuP3DmvhcJNZH2lz62ouOtgo9HclLL9u1zK1/+xJV2C0anbADm2Ecl4FQamGn17luPcblcZZmgZZqD7n317v5210= g02-rbmk\administrator@winserv1'

#------------------------------------------------------------------------------
# Helper functions
#------------------------------------------------------------------------------
# Three levels of logging are provided: log (for messages you always want to
# see), debug (for debug output that you only want to see if specified), and
# error (obviously, for error messages).

# Usage: log [ARG]...
#
# Prints all arguments on the standard error stream
log() {
  printf '\e[0;33m[LOG]  %s\e[0m\n' "${*}"
}

# Usage: debug [ARG]...
#
# Prints all arguments on the standard error stream
debug() {
  if [ "${debug_output}" = 'yes' ]; then
    printf '\e[0;36m[DBG] %s\e[0m\n' "${*}"
  fi
}

# Usage: error [ARG]...
#
# Prints all arguments on the standard error stream
error() {
  printf '\e[0;31m[ERR] %s\e[0m\n' "${*}" 1>&2
}

#------------------------------------------------------------------------------
# Provisioning tasks
#------------------------------------------------------------------------------

log '=== Starting common provisioning tasks ==='

# TODO: insert common provisioning code here, e.g. install EPEL repository, add
# users, enable SELinux, etc.

log "Ensuring SELinux is active"

if [ "$(getenforce)" != 'Enforcing' ]; then
    # Enable SELinux now
    setenforce 1

    # Change the config file
    sed -i 's/SELINUX=.*/SELINUX=enforcing/' /etc/selinux/config
fi

log "Installing useful packages"

#dnf update -y &>/dev/null

dnf install -y \
    bind-utils \
    cockpit \
    nano \
    tree &>/dev/null

log "Enabling essential services"

systemctl enable --now firewalld.service
systemctl enable --now cockpit.socket


echo "ChallengeResponseAuthentication no

PasswordAuthentication no

UsePAM no

PermitRootLogin no" > /etc/ssh/sshd_config.d/disable_root_login.conf

# Public keys
{
  echo "${pub_vr_client}"
  echo "${pub_xander}"
  echo "${pub_maarten}"
  echo "${pub_wout}"
  echo "${pub_neal}"
  echo "${pub_tariq}"
  echo "${pub_windserv}"
  echo "${pub_vr_2}"
} >> /home/vagrant/.ssh/authorized_keys

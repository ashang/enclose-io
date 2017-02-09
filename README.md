# Enclose.IO

Enclose.IO 
is a cloud-based service that creates a single executable out of your node.js application
for Windows, Linux and Mac OS X. It freezes your project code with the Node.js interpreter and all module dependencies,
making your project ready to be used out-of-the-box.

http://enclose.io/

[![Build Status](https://travis-ci.org/pmq20/enclose-io.svg?branch=master)](https://travis-ci.org/pmq20/enclose-io)
[![Code Climate](https://codeclimate.com/github/pmq20/enclose-io/badges/gpa.svg)](https://codeclimate.com/github/pmq20/enclose-io)
[![Test Coverage](https://codeclimate.com/github/pmq20/enclose-io/badges/coverage.svg)](https://codeclimate.com/github/pmq20/enclose-io/coverage)
[![Issue Count](https://codeclimate.com/github/pmq20/enclose-io/badges/issue_count.svg)](https://codeclimate.com/github/pmq20/enclose-io)

## Current cutting-edges and the future work

https://speakerdeck.com/pmq20/enclose-dot-io-current-cutting-edges-and-the-future-work

## Installation

### Linux (x86_64)

Suppose that a x86_64 machine with CentOS release 5.8 was being used,
then we could execute commands similar to the following to get started.

    # Install Ruby
    sudo yum install libyaml-devel readline-devel zlib-devel libffi-devel openssl-devel sqlite-devel
    # -> Follow the instructions of https://rvm.io/

    # Install Python
    # -> Make sure that `python --version` gives 2.6.x or 2.7.x

    # Install node and npm
    # -> https://nodejs.org/

    # Install gcc and g++ 4.8
    curl -sL http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm -o /tmp/epel-release-5-4.noarch.rpm
    sudo rpm -Uvh /tmp/epel-release-5-4.noarch.rpm
    sudo curl -sL http://linuxsoft.cern.ch/cern/devtoolset/slc5-devtoolset.repo -o /etc/yum.repos.d/slc5-devtoolset.repo
    sudo rpm --import http://ftp.scientificlinux.org/linux/scientific/5x/x86_64/RPM-GPG-KEYs/RPM-GPG-KEY-cern
    sudo yum install devtoolset-2
    scl enable devtoolset-2 bash
    echo source /opt/rh/devtoolset-2/enable >> ~/.bash_profile

    # Install Heroku Command Line
    # -> https://toolbelt.heroku.com/
    heroku login

    # Run the worker
    git clone git@github.com:pmq20/enclose-io.git
    cd enclose-io
    git remote add heroku https://git.heroku.com/pure-brushlands-17482.git
    bundle install
    export ENCLOSE_IO_MAKE_ARGS=-j4
    eval $(heroku config --shell) nohup bundle exec sidekiq --concurrency 1 --queue=linux64 2>&1 &

### Mac OS X

    # Install Ruby
    # -> Follow the instructions of https://rvm.io/

    # Install Python
    # -> Make sure that `python --version` gives 2.6.x or 2.7.x

    # Install node and npm
    # -> https://nodejs.org/

    # Install clang and clang++
    # -> https://developer.apple.com/xcode/download/

    # Install Heroku Command Line
    # -> https://toolbelt.heroku.com/
    heroku login
    
    # Run the worker
    git clone git@github.com:pmq20/enclose-io.git
    cd enclose-io
    git remote add heroku https://git.heroku.com/pure-brushlands-17482.git
    bundle install
    export ENCLOSE_IO_MAKE_ARGS=-j4
    eval $(heroku config --shell) nohup bundle exec sidekiq --concurrency 1 --queue=mac64 2>&1 &

### Windows

    # Install Ruby
    # -> http://rubyinstaller.org/

    # Install Python
    # -> https://www.python.org/ftp/python/2.7.12/python-2.7.12.msi

    # Install node and npm
    # -> https://nodejs.org/

    # Install Visual Studio    
    # -> http://download.microsoft.com/download/b/e/d/bedddfc4-55f4-4748-90a8-ffe38a40e89f/vs2015.3.com_enu.iso

    # Install Heroku Command Line
    # -> https://toolbelt.heroku.com/
    heroku login
    
    # Install 7-zip
    # -> http://www.7-zip.org/a/7z1604-x64.msi
    # Add C:\Program Files\7-Zip to PATH

    # Install Perl
    # -> http://www.activestate.com/ActivePerl

    # Install bison, sed from GnuWin32
    # -> http://gnuwin32.sourceforge.net/

    # Run the worker
    git clone https://github.com/pmq20/enclose-io.git
    cd enclose-io
    git remote add heroku https://git.heroku.com/pure-brushlands-17482.git
    bundle install
    FOR /F "delims=" %i IN ('heroku config --shell') DO set %i
    FOR /F "delims==" %i IN ('heroku config --shell') DO call set %i=%%i:'=%
    set ENCLOSE_VCBUILD_ARGS=nosign
    bundle exec sidekiq --concurrency 1 --queue=win32

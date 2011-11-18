# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias la='ls -A'
#alias l='ls -CF'

alias bashrc='gedit ~cipiere/.bashrc &'
alias clearfullapi='rm -r api/;rm *.pl; rm *~'
alias clearapi='rm -r api/; rm *~'

alias gobackup='cd /tmp/quattor/backup/network_component;t2'

alias gocrri='ssh secipier@hpc1.clermont-universite.fr'


alias goerror='cd /tmp/quattor/error/network_component;t2'
alias gofc='ssh cipiere@fc.isima.fr'
alias Xgofc='ssh -X cipiere@fc.isima.fr'

alias gonote='cd /home/cipiere/Documents/ginseng/note'
alias goginseng='cd /home/cipiere/Documents/ginseng'
alias gogithub='cd /home/cipiere/Documents/github'
alias gog2imfc='ssh g2im@fc.isima.fr'
alias gog2imwebcrri='ssh g2im@193.55.252.158'
alias gog2imcrri='ssh g2imweb@193.55.252.153'
alias gowebcrri='ssh secipier@193.55.252.158'
alias gomysqlcrri='ssh secipier@193.55.252.158'

alias gohtml='google-chrome api/html/index.html &'
alias gohispod="cd /home/cipiere/Documents/synchro_git/hispod"

alias goperl='cd /home/cipiere/Documents/ginseng/perl/;t2'
alias goplanning='cd /home/checkeol/Bureau/_Stage/planning;t2'

alias gorapport='cd /home/checkeol/Bureau/_Stage/rapport;t2'
alias goremote='rdesktop lbts01 -g 1500x1000 -u scipiere'

alias gospe='cd /home/checkeol/Bureau/_Stage/rapport/specifications;t2'
alias gostage='cd /home/checkeol/Bureau/_Stage;t2'
alias gosvn='cd /home/checkeol/Bureau/_Stage/Perl/SVN_code/;t2'

alias gotest='cd /home/checkeol/Bureau/_Stage/Perl/test;t2'
alias gotmp='cd /tmp/quattor;tree'

alias goui='ssh 193.55.252.161 -l secipier' 	#ui.lifegrid.fr
alias gofaouzi='ssh 193.55.252.161 -l fajaziri' 	#ui.lifegrid.fr
alias gotron='ssh 172.16.66.63 -l root'		#CentOS 5.5 DHCP bureau C103 machine cipiere

alias lg='ls | grep'
alias lga='lla | grep'
alias lla='ls -alh'
alias ll='ls -lh'
alias ln='ls -rlth'
alias lna='ls -rltha'

alias startsamba='/etc/rc.d/init.d/smb start'
alias stopsamba='/etc/rc.d/init.d/smb stop'

alias startcups='/etc/init.d/cups start'
alias stopcups='/etc/init.d/cups stop'

alias t0='tree -L 1 -d'
alias t1='tree -L 1'
alias t2='tree2'
alias t2a='tree2 -a'
alias t3='tree -L 3'
alias t4='tree -L 4'
alias tf='tree -fi'
alias tg='treeflat | grep'
alias tga='treeflat -a | grep'
alias tree2='tree -L 2'
alias treeflat='tree -fi'

alias vi='vim'

function himylord() {
google-chrome "http://xkcd.com/";
google-chrome "http://cereales.lapin.org/";
google-chrome "http://oglaf.lapin.org/index.php";
google-chrome "http://oglaf.com/";
google-chrome "http://grooveshark.com/#/cipiere/music/favorites";
google-chrome "https://mail.google.com/mail/?hl=fr#inbox";
google-chrome "https://www.google.com/calendar/render?tab=mc";
google-chrome "https://clrwww.in2p3.fr/mail/";
}
function amazon() { 
google-chrome "http://www.amazon.com/s/ref=nb_sb_noss?__mk_fr_FR=%C5M%C5Z%D5%D1&url=search-alias%3Daps&field-keywords=+"$1 ;
google-chrome "http://www.amazon.fr/s/ref=nb_sb_noss?__mk_fr_FR=%C5M%C5Z%D5%D1&url=search-alias%3Daps&field-keywords=+"$1 ;
google-chrome "http://www.amazon.co.uk/s/ref=nb_sb_noss?__mk_fr_FR=%C5M%C5Z%D5%D1&url=search-alias%3Daps&field-keywords=+"$1 ;
google-chrome "http://www.amazon.de/s/ref=nb_sb_noss?__mk_fr_FR=%C5M%C5Z%D5%D1&url=search-alias%3Daps&field-keywords=+"$1 ;
}
function search() { google-chrome "http://www.google.fr/search?hl=fr&source=hp&q="$1 &}
function go() { google-chrome "http://www.google.fr/search?hl=fr&source=hp&q="$1 &}
function enfr() { google-chrome http://www.wordreference.com/enfr/$1;}
function fren() { google-chrome http://www.wordreference.com/fren/$1;}
function conjugaison() { google-chrome "http://www.la-conjugaison.fr/du/verbe/"$1.php;}
function cpgw() { scp $1 scipiere@lbgw: ;}
function cp2ui() { scp $1 secipier@193.55.252.161:from_c103/ ;}
function cp2faouzi() { scp $1 fajaziri@193.55.252.161:/home/fajaziri/phylgrid/$1 ;}
function cp2fc() { scp $1 cipiere@fc.isima.fr:/home/etud/cipiere/from_outside/$1 ;}
function cp2hispodfc() { scp $1 g2im@fc.isima.fr:/home/ext/g2im/HISPOD/$1 ;}
function cp2webcrri() { scp $1 secipier@193.55.252.158:/home/secipier/public_html/$1 ;}
function cp2crri() { scp $1 secipier@193.55.252.158:/home/secipier/ginseng/csv/$1 ;}
function cp2mysqlcrri() { scp $1 secipier@193.55.252.158:/home/secipier/ginseng/csv/$1 ;}
function cpfromfc() { scp cipiere@fc.isima.fr:/home/etud/cipiere/to_export/$1 ./$1 ;}
function cpfromfaouzi() { scp fajaziri@193.55.252.161:/home/fajaziri/phylgrid/$1 ./$1;}
function cpfromphylclustercrri() { scp secipier@193.55.252.153:/home/secipier/phylcluster/$1 . ;}
function cpfromwebg2im() { scp secipier@193.55.252.158:/home/secipier/public_html/$1 . ;}

function cpfromg2imresult() { scp g2im@fc.isima.fr:/home/ext/g2im/public_html/hispod/results/$1 /home/cipiere/Documents/synchro_git/hispod/hispod_pc/fromg2im/$1;}
function cpfromg2im() { scp g2im@fc.isima.fr:/home/ext/g2im/HISPOD/$1 /home/cipiere/Documents/synchro_git/hispod/hispod_pc/fromg2im/$1;}

function hispod_export() { gcc $1.iUBDegen.c -o $1.IUBREV.cipiere; cp2g2im $1.IUBREV.cipiere; cp2g2im $1.hispod_pc.pl;}


alias doxy='echo "/home/checkeol/Bureau/_Stage/Perl/SVN_code/doxy_filter"'
doxy="/home/checkeol/Bureau/_Stage/Perl/SVN_code/doxy_filter"
#alias 2doxy="cp $1 $doxy/"     #A finir un jour ou pas ....  Pour prendre des paramètres utiliser function
#;cd $doxy;t2'
#;doxygen $1;'
alias cd..='cd ..'
alias cd2='cd ../..'
alias cd3='cd ../../..'
alias cd4='cd ../../../..'
alias cd5='cd ../../../../..'


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

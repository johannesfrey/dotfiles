# Add binaries under $HOME/opt to PATH

OPT_BINS_COUNT=($HOME/opt/*/bin(N))

if [ ! $#OPT_BINS_COUNT -eq 0 ]; then
    OPT_BINS=($HOME/opt/*/bin(:a))
    OPT_BINS_PATH="${OPT_BINS:gs/ /:/}"
    PATH="${OPT_BINS_PATH}:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/bin:/usr/local/sbin:$ZSH/bin:$PATH"
else
    PATH="/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/bin:/usr/local/sbin:$ZSH/bin:$PATH"
fi

export PATH

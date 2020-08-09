FROM elytra8/tesla:latest

RUN mkdir /TESLA && chmod 777 /TESLA
WORKDIR /TESLA

# It's big brain time
RUN echo bruh
RUN apt-get -qq update
RUN apt-get -qq -y bc build-essential ccache curl neofetch g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 libxml2-utils lzop m4 openjdk-8-jdk pngcrush repo rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
RUN curl --create-dirs -L -o /usr/local/bin/repo -O -L https://storage.googleapis.com/git-repo-downloads/repo
RUN chmod a+rx /usr/local/bin/repo
RUN cd /TESLA
RUN repo init -u git://github.com/Evolution-X/manifest -b ten --depth=1 --groups=all,-notdefault,-device,-darwin,-x86,-mips
RUN repo sync -j16
RUN git clone https://github.com/Pulkit077/device_xiaomi_rosy device/xiaomi/rosy
RUN git clone https://github.com/Pulkit077/vendor_xiaomi_rosy vendor/xiaomi/rosy
RUN git clone https://github.com/Pulkit077/kernel_xiaomi_rosy --depth=1 --single-branch kernel/xiaomi/rosy
RUN . build/envsetup.sh &&brunch rosy

#
#setup transfer
#
RUN curl -sL https://git.io/file-transfer | sh
#
# Copies session and config(if it exists)
#


#
# Finalization
#
CMD ["python3","-m","userbot"]

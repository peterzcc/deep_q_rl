#!/bin/bash
# -q gpu.q@client108
#$ -S /bin/bash

# specify where the output file should be put
# -o /csproject/dygroup2/czeng/dqrl/deep_q_rl/flow.out -j y

# specify the working path
# -wd /csproject/dygroup2/czeng/dqrl/deep_q_rl

# email me with this address...
#$ -M zccust@gmail.com
# email when the job starts (b) and after the job has been
# completed (e)
#$ -m be
. /project/dygroup2/czeng/venv/bin/activate

# my real program which should be run
CUDNN_PATH=/csproject/dygroup2/czeng/venv/cudnnv3
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDNN_PATH
export LIBRARY_PATH=$CUDNN_PATH
export CPATH=$CUDNN_PATH
export PYTHONPATH=$CUDNN_PATH
export PATH=$PATH:$CUDNN_PATH
#locate libnppc.so
export THEANO_FLAGS='device=gpu1'
NETWORK=atlantis_11-26-06-09_0p01_0p99/network_file_49
rm -f record/*.png
python ale_run_watch.py $NETWORK.pkl superbreakout && rm -f $NETWORK.mp4 && ffmpeg -r 60 -i record/%06d.png -c:v mpeg4 $NETWORK.mp4

NETWORK=boxing_11-26-06-06_0p01_0p99/network_file_200
rm -f record/*.png
python ale_run_watch.py $NETWORK.pkl boxing && rm -f $NETWORK.mp4 && ffmpeg -r 60 -i record/%06d.png -c:v mpeg4 $NETWORK.mp4

NETWORK=crazy_climber_11-26-06-12_0p01_0p99/network_file_200
rm -f record/*.png
python ale_run_watch.py $NETWORK.pkl crazy_climber && rm -f $NETWORK.mp4 && ffmpeg -r 60 -i record/%06d.png -c:v mpeg4 $NETWORK.mp4

NETWORK=space_invaders_11-26-06-18_0p01_0p99/network_file_200
rm -f record/*.png
python ale_run_watch.py $NETWORK.pkl space_invaders && rm -f $NETWORK.mp4 && ffmpeg -r 60 -i record/%06d.png -c:v mpeg4 $NETWORK.mp4

NETWORK=seaquest_11-26-06-06_0p01_0p99/network_file_200
rm -f record/*.png
python ale_run_watch.py $NETWORK.pkl seaquest && rm -f $NETWORK.mp4 && ffmpeg -r 60 -i record/%06d.png -c:v mpeg4 $NETWORK.mp4



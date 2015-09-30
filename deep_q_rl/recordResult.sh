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
NETWORK=network_file_115
python ale_run_watch.py breakout_09-27-04-44_0p00025_0p99/NETWORK.pkl breakout
rm -f $NETWORK.mp4
ffmpeg -r 60 -i record/%06d.png -c:v mpeg4 video/$NETWORK.mp4
rm record/*
#python -c 'from theano.sandbox.cuda.dnn import dnn_available; print dnn_available(); print dnn_available.msg'


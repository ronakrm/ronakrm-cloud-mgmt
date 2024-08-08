FROM runpod/pytorch:2.1.0-py3.10-cuda11.8.0-devel-ubuntu22.04

RUN apt-get update \
    && apt-get install -y vim rsync htop screen
RUN sh /workspace/ronakrm-cloud-mgmt/scripts/runpod-git.sh
RUN sh /workspace/ronakrm-cloud-mgmt/scripts/envs-vars.sh

RUN pip install --upgrade pip

RUN cd /workspace/HarmBench/ \
    && pip install -r requirements.txt \
    && python -m spacy download en_core_web_sm


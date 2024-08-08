apt-get update && apt-get install -y vim rsync htop screen

sh /workspace/ronakrm-cloud-mgmt/scripts/runpod-git.sh
sh /workspace/ronakrm-cloud-mgmt/scripts/envs-vars.sh

pip install --upgrade pip

cd /workspace/HarmBench/ \
    && pip install -r requirements.txt \
    && python -m spacy download en_core_web_sm


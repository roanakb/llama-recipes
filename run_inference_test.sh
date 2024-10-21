# confirm correct command line args are passed
echo "Your hfcli token is $1"
echo "The model you are testing is $2"

# clone repo
git clone https://github.com/roanakb/llama-recipes.git

# install pip
apt install python3-pip -y

# install requirements
pip install -r llama-recipes/tools/benchmarks/inference/requirements.txt

# login hf console for gated models
huggingface-cli login --token $1

# results will be printed to console and outputted to csv files
cd  llama-recipes/tools/benchmarks/inference/on_prem/vllm/

python3 chat_vllm_benchmark.py --inputlen 50 --model $2
python3 chat_vllm_benchmark.py --inputlen 1k --model $2
python3 chat_vllm_benchmark.py --inputlen 2k --model $2
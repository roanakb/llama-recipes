echo "Your hfcli token is $1"
echo "The model you are testing is $2"

git clone https://github.com/roanakb/llama-recipes.git

apt install python3-pip -y

pip install -r llama-recipes/tools/benchmarks/inference/requirements.txt

huggingface-cli login --token $1

# results will be printed to console and outputted to csv files

python chat_vllm_benchmark.py --inputlen 50 --model $2
python chat_vllm_benchmark.py --inputlen 1k --model $2
python chat_vllm_benchmark.py --inputlen 2k --model $2
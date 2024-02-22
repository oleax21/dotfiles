#!/usr/bin/env sh

# This script deploys a smart contract using Forge. It requires at least two arguments: the file path of the contract and the contract name.

# Arguments:
# 1. <file_path>: The file path of the smart contract to be deployed. This is a required argument.
# 2. <contract_name>: The name of the smart contract to be deployed. This is also a required argument.

# Options:
# -l: Flag to use the local RPC URL. When set, the script uses the local network's RPC endpoint (http://localhost:8545) for deploying the contract.
# -v: Flag for contract verification. When set, it triggers the verification process for the contract upon deployment.
# -f: Flag to enable Foreign Function Interface (FFI) feature in Forge.
# -c: Flag to clean the build artifacts before deploying.

# check command format
if [ "$#" -lt 2 ]; then
  echo "Usage: deploy_contract <file_path> <contract_name> [-l] [-v] [-f] [-c]"
  return 1
fi

# read environment variable from .env
env_file=".env"
if [ -f "$env_file" ]; then
  export $(grep -v '^#' $env_file | xargs)
else
  echo ".env file not found"
  return 1
fi

file_path=$1
contract_name=$2
rpc_url=${SEPOLIA_RPC_URL:-"http://localhost:8545"}
verify_flag=""
ffi_flag=""

# change rpc_url if local flag is set
if [[ "$3" == "-l" ]] || [[ "$4" == "-l" ]] || [[ "$5" == "-l" ]] || [[ "$6" == "-l" ]]; then
  rpc_url="http://localhost:8545"
fi

# change verify_flag if verify flag is set
if [[ "$3" == "-v" ]] || [[ "$4" == "-v" ]] || [[ "$5" == "-v" ]] || [[ "$6" == "-v" ]]; then
  verify_flag="--verify"
fi

# enable ffi if ffi flag is set
if [[ "$3" == "-f" ]] || [[ "$4" == "-f" ]] || [[ "$5" == "-f" ]] || [[ "$6" == "-f" ]]; then
  ffi_flag="--ffi"
fi

# clean build artifacts if clean flag is set
if [[ "$3" == "-c" ]] || [[ "$4" == "-c" ]] || [[ "$5" == "-c" ]] || [[ "$6" == "-c" ]]; then
  forge clean
fi

forge script "$file_path:$contract_name" --fork-url $rpc_url --broadcast $verify_flag $ffi_flag

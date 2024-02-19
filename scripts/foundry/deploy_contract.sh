#!/usr/bin/env sh

# This script deploys a smart contract using Forge. It requires at least two arguments: the file path of the contract and the contract name.

# Arguments:
# 1. <file_path>: The file path of the smart contract to be deployed. This is a required argument.
# 2. <contract_name>: The name of the smart contract to be deployed. This is also a required argument.

# Options:
# -l: Flag to use the local RPC URL. When set, the script uses the local network's RPC endpoint (http://localhost:8545) for deploying the contract.
# -v: Flag for contract verification. When set, it triggers the verification process for the contract upon deployment.

# check command format
if [ "$#" -lt 2 ]; then
      echo "Usage: deploy_contract <file_path> <contract_name> [-l] [-v]"
      return 1
fi

# read environment variable from .env
local env_file=".env"
if [ -f "$env_file" ]; then
      export $(grep -v '^#' $env_file | xargs)
else
      echo ".env file not found"
      return 1
fi

local file_path=$1
local contract_name=$2
local rpc_url=${SEPOLIA_RPC_URL:-"http://localhost:8545"}
local verify_flag=""

# change rpc_url if local flag is set
if [[ "$3" == "-l" ]]; then
      rpc_url="http://localhost:8545"
fi

# change verify_flag if verify flag is set
if [[ "$3" == "-v" ]] || [[ "$4" == "-v" ]]; then
  verify_flag="--verify"
fi

forge script "$file_path:$contract_name" --fork-url $rpc_url --broadcast $verify_flag

#!/bin/bash

#############
# About : Script to get the collaborators from git ORG
# Input: 
#       username: USERNAME of git repository
#       token: TOKEN for your git API
#
#############

helper()

# Github API URL
API_URL="https://api.github.com"

# Github username and personal access token
USERNAME=$username
TOKEN=$token

# User and Repository Information
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to GitHub API

function github_api_get {
    local endpoint="$1"
    local url="${API_URL}/${endpoint}"
    
    # Send a GET Request to the GitHub API with authentication
    curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access to the repository

function list_users_with_read_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    collaborators="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.pull == true) | .login')"

    # Display the list of Collaborators with read access on repository
    if [[ -z "$collaborators" ]]; then
         echo "No user with read access found for ${REPO_OWNER}/${REPO_NAME}."
    else
         echo "Users read access for ${REPO_OWNER}/${REPO_NAME} : "
         echo "$collaborators"
    fi
}

function list_users_with_admin_access {
    local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

    # Fetch the list of collaborators on the repository
    admins="$(github_api_get "$endpoint" | jq -r '.[] | select(.permissions.admin == true) | .login')"

    # Display the list of Collaborators with admin access on repository
    if [[ -z "$admins" ]]; then
         echo "No user with admin access found for ${REPO_OWNER}/${REPO_NAME}."
    else
         echo "Users admin access for ${REPO_OWNER}/${REPO_NAME} : "
         echo "$admins"
    fi
}

function helper {
    expected_cmd_args=2
    if [[ $# -ne expected_cmd_args$ ]]; then
        echo "Please execute the script with required CMD args"
    fi
    exit 1
}

# Main script

echo "Listing users with read access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_read_access
list_users_with_admin_access
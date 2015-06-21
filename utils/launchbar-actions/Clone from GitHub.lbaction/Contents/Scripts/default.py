#!/usr/bin/env python
import sys
import json
import custom_env
from github import Github
from os.path import basename

github_session = Github(custom_env.github_token)

def search_repos(repo, user=None):
    if user is None:
        return github_session.search_repositories(repo, fork=True)
    else:
        return github_session.search_repositories(repo, fork=True, user=user)

def format_repos(repos):
    items = []
    for repo in repos[0:10]:
        item = {}
        item['title'] = '%s > %s' % (repo.owner.login, repo.name)
        item['subtitle'] = repo.description
        item['alwaysShowsSubtitle'] = True
        item['icon'] = 'fork.png' if repo.fork else 'repo.png'
        item['action'] = 'run.py'
        item['actionArgument'] = '%s %s' % (repo.owner.login, repo.name)
        items.append(item)

    return items

def run(args):
    items = []

    if len(args) != 0:
        user = args[0] if len(args) > 1 else None
        repo = args[1] if len(args) > 1 else args[0]

        items = format_repos(search_repos(repo, user))
    else:
        item = {}
        item['title'] = 'Please enter a user of repository name'
        items.append(item)

    return items

print json.dumps(run(sys.argv[1].split(" ")))
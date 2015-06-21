#!/usr/bin/env python
import sys
import json
import custom_env

from os import listdir
from os.path import basename, isdir, join

def isHidden(filename):
    return filename.startswith('.')

all_authors = filter(lambda a: not isHidden(a), listdir(custom_env.projects))

def matching_authors(author):
    authors = filter(lambda a: a.startswith(author), all_authors)
    return [authors[0]] if len(authors) == 1 else authors

def projects_of(complete_author):
    return filter(lambda p: not isHidden(p), listdir(join(custom_env.projects, complete_author)))

def matching_projects(complete_author, start):
    projects = filter(lambda p: p.startswith(start), projects_of(complete_author))
    return [projects[0]] if len(projects) == 1 else projects

def format_authors(authors):
    items = []
    for author in authors:
        item = {}
        item['title'] = author
        item['action'] = basename(__file__)
        item['actionArgument'] = author
        item['actionReturnsItems'] = True
        item['icon'] = 'user.png'
        items.append(item)

    return items

def format_projects(author, projects):
    items = []
    for project in projects:
        item = {}
        item['title'] = project
        item['subtitle'] = "%s > %s" % (author, project)
        item['action'] = "run.py"
        item['actionArgument'] = '%s %s' % (author, project)
        item['alwaysShowsSubtitle'] = True
        item['icon'] = 'vim.png'
        items.append(item)

    return items

def my_projects_items(start):
    my_projects = matching_projects(custom_env.my_username, start)
    return format_projects(custom_env.my_username, my_projects)


def run(args):

    items = []

    if len(args) > 0:
        authors = matching_authors(args[0])

        if len(authors) == 1:
            author = authors[0]
            project_start = args[1] if len(args) > 1 else ""
            projects = matching_projects(author, project_start)
            items = my_projects_items(args[0]) + format_projects(author, projects)

        else:
            authors_items = format_authors(authors)
            items = my_projects_items(args[0]) + authors_items

    else:
        items = format_authors(all_authors)

    return items

print json.dumps(run(sys.argv[1].split(" ")))

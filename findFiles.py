# findFiles.py
# 29/04/2023

import fnmatch
import os


def findFiles(rootPath, pattern):
    filesList = []
    for root, dirs, files in os.walk(rootPath):
        for filename in fnmatch.filter(files, pattern):
            filesList.append(os.path.join(root, filename))
    return filesList


if __name__ == '__main__':
    rootPath = 'C:/Users/jossan/Desktop/TestBazel/bazel-hello-world'
    #pattern = '*.txt'
    pattern = 'pythonlog.txt'
    filesPath = findFiles(rootPath, pattern)

    print(filesPath)

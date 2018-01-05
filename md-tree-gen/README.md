### / [shell-scripts](../) / [md-nav-gen](.)

-----------------------------------------------------------------------------------

# Generate links to files inside this directory and below in the format of Markdown

 * [docs](./docs)
   * [how-to](./docs/how-to)
   * [serve.md](./docs/how-to/serve.md)
 * [Tree.md](./Tree.md)
 * [README.md](./README.md)
 * [md-tree-gen.sh](./md-tree-gen.sh)

## Why should I need it?

I created it for my own GitHub Pages because by default they don't handle links to 
directories too well when there is no README file (throws 404 Not found error). 
So this script generates the file structure inside a README.md or Tree.md file
(if README.md already exists).

This can be useful not only in Github Pages but in any other MarkDown viewer.

## Working example
[janis-rullis.github.io/nginx/docs/](https://janis-rullis.github.io/nginx/docs/).

![image](images/github-example.png)
![image](images/github-page-example.png)


### Do you want something more for your Github Pages?
You can fully control the whole page look just like Bootstrap or Jekyll did it by
customizing it in the `gh-pages` branch. See more info in [janis-rullis/github-pages](https://github.com/janis-rullis/github-pages).

## Usage
1. Save the script into `md-tree-gen.sh` file.
2. Make the script globally available
```
sudo cp md-tree-gen.sh /usr/local/bin/md-tree-gen
sudo chmod a+x /usr/local/bin/md-tree-gen
```
3. Go in the command line to the required directory.
4. Execute the script with `md-tree-gen`
5. The file structure will stored inside a README.md or Tree.md file
 (if README.md already exists).

![image](images/gen-example.png)

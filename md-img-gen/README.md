---
title: md alb gen
layout: default
---

### / [shell-scripts](../) / [md-img-gen](.)

-----------------------------------------------------------------------------------

# Include all images from all directories below in the format of Markdown

## Example

#### 1/2/3/apply canvas
![1/2/3/apply canvas](1/2/3/apply-canvas.png)

#### 1/2/3/rippling
![1/2/3/rippling](1/2/3/rippling.png)

#### 1/orig 250x
![1/orig 250x](1/orig-250x.jpg)

## Usage
1. Save the script into `md-img-gen.sh` file.
2. Make the script globally available
```
sudo cp md-img-gen.sh /usr/local/bin/md-img-gen
sudo chmod a+x /usr/local/bin/md-img-gen
```
3. Go in the command line to the required directory.
4. Execute the script with `md-img-gen`
5. The file structure will stored inside a index.md or List.md file.

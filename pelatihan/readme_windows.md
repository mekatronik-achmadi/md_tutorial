# Python Basic Training For Windows

## Requirements

This guide assumes:
- You are 13 years old or above who born in 90's or later.
- Using Window Operating System version 7 or up.
- Have decent and stable internet connection.

## Installations

### Git

Git For Windows: [Tutorial](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/pelatihan/install_git.md)

Github Registration: [Tutorial](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/pelatihan/github_signup.md)

Classic Token Setup: [Tutorial](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/electronic/tutorials/github_token.md)

### Python

Windows Installer: [Tutorial](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/pelatihan/install_python.md#python-installer)

Close the installer, then open command prompt using Win+R, type **cmd**, then Enter.
Then type this to check version:

```sh
python -V
```

![images](images/python_win_chkver.png?raw=true)

PIP Module Install: [Tutorial](https://github.com/mekatronik-achmadi/md_tutorial/blob/master/pelatihan/install_python.md#pip)

Minimal required modules:
- numpy
- scipy
- matplotlib

Interface options to install:
- ipython
- spyder
- notebook

Open command prompt using Win+R, type **cmd**, then Enter.
Then type this to install recommended modules:

```sh
pip install numpy scipy matplotlib spyder
```

then type on **cmd**:

```sh
spyder
```

![images](images/python_win_spycmd.png?raw=true)

Optionally, you can close **cmd** window now.

Spyder will run like this:

![images](images/python_win_spyder.png?raw=true)
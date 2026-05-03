# Installation
This documentation contains installation of opencode not only install a software but also follow security best practice to secure your operating system and avoid root access.

## Download whole application
```sh
curl -fsSL https://opencode.ai/install | bash
```
## Set up opencode
1. Create a dedicated directory for global npm packages
```sh
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
```
This ensures all global packages are installed in a user-controlled directory instead of system paths like /usr/lib.


2. Add the npm global directory to your PATH so installed binaries can be executed globally.
```sh
export PATH=~/.npm-global/bin:$PATH
```


3. And Reload it
```sh
source ~/.bashrc
```

4. Install opencode agent 
```sh
npm install -g opencode-ai
```

✅ Final Result
- Opencode is installed in a user-level directory
- No need for sudo
- Reduced risk of system-level compromise
- Fully aligned with modern development and DevOps practices
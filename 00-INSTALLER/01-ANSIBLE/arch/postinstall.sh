echo "MAKING ZSH AS MAIN SHELL"
chsh -s /bin/zsh

echo "INSTALLING VSCODE EXTENSIONS"
code --install-extension 2gua.rainbow-brackets
code --install-extension aaron-bond.better-comments
code --install-extension andrejunges.Handlebars
code --install-extension AndrsDC.base16-themes
code --install-extension Angular.ng-template
code --install-extension bajdzis.vscode-twig-pack
code --install-extension bungcip.better-toml
code --install-extension christian-kohler.npm-intellisense
code --install-extension christian-kohler.path-intellisense
code --install-extension chrmarti.regex
code --install-extension CoenraadS.bracket-pair-colorizer
code --install-extension Dart-Code.dart-code
code --install-extension Dart-Code.flutter
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension daylerees.rainglow
code --install-extension dbaeumer.vscode-eslint
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension eamodio.gitlens
code --install-extension EditorConfig.EditorConfig
code --install-extension eg2.tslint
code --install-extension emmanuelbeziat.vscode-great-icons
code --install-extension esbenp.prettier-vscode
code --install-extension felixfbecker.php-debug
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension formulahendry.code-runner
code --install-extension johnpapa.Angular2
code --install-extension johnpapa.winteriscoming
code --install-extension liviuschera.noctis
code --install-extension Mikael.Angular-BeastCode
code --install-extension mikestead.dotenv
code --install-extension monokai.theme-monokai-pro-vscode
code --install-extension mrmlnc.vscode-scss
code --install-extension ms-vscode.Go
code --install-extension ms-vscode.Theme-TomorrowKit
code --install-extension ms-vscode.vscode-typescript-tslint-plugin
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension naumovs.color-highlight
code --install-extension neilding.language-liquid
code --install-extension octref.vetur
code --install-extension Orta.vscode-jest
code --install-extension Perkovec.emoji
code --install-extension PeterJausovec.vscode-docker
code --install-extension PKief.material-icon-theme
code --install-extension quicktype.quicktype
code --install-extension robinbentley.sass-indented
code --install-extension RoscoP.ActiveFileInStatusBar
code --install-extension sdras.night-owl
code --install-extension seveseves.ngx-translate-zombies
code --install-extension shinnn.stylelint
code --install-extension sysoev.language-stylus
code --install-extension tungvn.wordpress-snippet
code --install-extension Tyriar.sort-lines
code --install-extension WallabyJs.quokka-vscode
code --install-extension wayou.vscode-todo-highlight
code --install-extension wix.vscode-import-cost
code --install-extension xabikos.JavaScriptSnippets
code --install-extension yzhang.markdown-all-in-one
code --install-extension zhuangtongfa.Material-theme
code --install-extension Zignd.html-css-class-completion

# tldr
# https://github.com/raylee/tldr
mkdir -p ~/bin
curl -o ~/bin/tldr https://raw.githubusercontent.com/raylee/tldr/master/tldr
chmod +x ~/bin/tldr

echo "INSTALLING npm global modules"
npm i -g @angular/cli
npm i -g gatsby-cli
npm i -g bower
npm i -g create-react-app
npm i -g create-react-native-app
npm i -g eslint
npm i -g eslint-config-airbnb
npm i -g eslint-config-prettier
npm i -g eslint-plugin-flowtype
npm i -g eslint-plugin-import
npm i -g eslint-plugin-jsx-a11y
npm i -g eslint-plugin-prettier
npm i -g eslint-plugin-react
npm i -g gulp
npm i -g http-server
npm i -g nodemon
npm i -g webpack

echo "INSTALLING PREZTO"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo "CONFIGURING GIT"
git config --global user.name "Roy Surjano"
git config --global user.email "roy@surjano.xyz"

git config --global core.editor "code -w"
git config --global color.ui true

echo "INSTALLING RVM - RUBY VERSION MANAGER"
echo "gem: --no-document" >> ~/.gemrc
curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
type rvm | head -1

echo "CONFIGURING TMUX"
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
~/.tmux/plugins/tpm/bin/update_plugins all

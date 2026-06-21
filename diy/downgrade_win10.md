this file describes my experiences gained in downgrading windows11 to windows10 for `omen gaming laptop 16-k0xxx`. status quo: sound card not available; rtx3060 and xe graphics available, 5 devices unrecognized;

# common problems 

- driver problem: hp.support restricts drivers of most of the laptops to windows11; drivers compatible with windows10 is often unavailable; need to risk using disreputable apps(360DrvMng); best to *update to latest win10 (22h2) first*.
- deprecated apps: docker (better use wsl/virtual machine)
- problematic apps: ...
- user confusion: change ownership of folder in the property panel to current user name, then edit access.
- unsolved IME problem in win10(replace with 3rd party input method, e.g. ifly)
- sensor malfunctioning, restricting cpu usage under 10%: update to win10 22h2.

# behavior of apps

apps may or may not be complete after in this process. to fix them:

<div align="center">

| app          | suggestion         |     |
| ------------ | ------------------ | --- |
| 7zip         | choco              |     |
| bandizip     | na                 |     |
| basic-miktex | delete and install |     |
| chocolatey   | install            |     |
| cmake        | choco              |     |
| cuda_xxx     | install            |     |
| easyconnect  | install            |     |
| everything   | re-run fix         |     |
| filezilla    | na                 |     |
| firefox      | delete and install |     |
| git          | msys2              |     |
| huorong      | delete and install |     |
| ifly         | install            |     |
| inkscape     | na                 |     |
| llvm         | delete and install |     |
| miniconda    | delete and install |     |
| msys         | add to path        |     |
| nvidia-app   | recommended        |     |
| potplayer    | update fix         |     |
| qqnt(qq)     | re-run fix         |     |
| rustup(rust) | choco              |     |
| steam        | re-run fix         |     |
| VS2022       | install            |     |
| vmware       | delete and install |     |
| vscode       | install            |     |
| wechat       | na                 |     |
| wps          | re-run fix         |     |
| youdaodict   | update             |     |

</div>

for app that can be complete after re-running or updating, they should be installed not on system disk.

for apps without unique data, recommend choco. e.g. 7zip, cmake, ilspy, nasm, neovim, rustup. 

# backup data in system disk

there are os support for this, but i don't it's that much of data. just temporary download and some configs like `~/.xxx`. 
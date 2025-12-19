this file describes my experiences gained in downgrading windows11 to windows10 for omen gaming laptop 16-k0xxx. status quo: sound card not available; rtx3060 and xe graphics available, 5 devices unrecognized;

# common problems 

- driver problem: hp.support restricts drivers of most of the laptops to windows11; drivers compatible with windows10 is often unavailable; need to risk using disreputable apps(360DrvMng) 
- deprecated apps: docker(better use vmware)
- problematic apps: ...
- git user confusion
- unsolved IME problem in win10(replace with 3rd party input method, e.g. ifly)
- sensor malfunctioning, restricting cpu usage under 10%

# behavior of apps

|app(installer)|behavior||
|-|-|-|
|bandizip|na||
|basic-miktex|delete and install||
|chocolatey|install||
|cmake|install by choco||
|codeblocks|na||
|cuda_xxx|install||
|easyconnect|install||
|everything|re-run fix||
|na|na||
|feishu|na||
|filezilla|na||
|firefox|delete and install||
|git|delete and install||
|githubdesktop|na||
|hisuit|na||
|huorong|delete and install||
|ifly|install||
|inkscape|na||
|jdk|na||
|llvm|add to path||
|mdk5xx|na||
|miniconda|delete and install||
|msys|add to path||
|ni-cds(multisim)|delete and install||
|nvidia-app|recommended to install||
|potplayer|update fix||
|python|recommend miniconda||
|qqnt(qq)|re-run fix||
|rustup(rust)|na||
|steamsetup(steam)|re-run fix||
|tencentmeeting|na||
|VS2022|install||
|vmware|delete and install||
|vscode|install||
|wechat|na||
|wps|re-run fix||
|youdaodict|na||
|zotero|na||
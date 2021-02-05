<h2 align = "center"> This repository shows my learning tour with Assembly language </h2>

<b> It includes: </b>

- Assembly code with comments explaining every instruction
  - Every file has also its compiled and ready to run version.
- Online learning materials I've studied with
- My personal notes

<br/>

<b> Below you can also find repository tree and my environment setup and workflow. <b>

---

<p align="center">
  Found it useful? Want more updates?
</p>

<p align = "center">
  <b> <i> Show your support by giving a :star: </b> </i>
</p>

---

<h3 align="center"> Repository tree </h3>

<br/>

```bash
├── basics
│   ├── hello-world
│   │   ├── hello_world.asm
│   ├── loop1_10
│   │   ├── loop.asm
│   └── naive_logging
│       ├── login.asm
├── materials
│   └── README.md
└── README.md
```

---

<h3 align="center"> My environment </h3>

<br/>

<i> I use Archlinux so all commands below may be specific for this OS. </i>

<i> My code editor is Neovim with config files mostly based on <a href="https://www.chrisatmachine.com/neovim"> ChrisAtMachine's </a> </i>

<i> For better window management I use <b> Terminator </b> and <b> zsh </b> shell with <i> prompt off </i> for better clarity and auto-suggestions. </i>

<i> To compile .asm files I use: </i>

- <b> nasm </b> - `nasm -f elf32 -o hello_world.o hello_world.asm`
- <b> ld </b> `ld -m elf_i386 -o hello_world hello_world.o`

<i> <a href = "https://wiki.archlinux.org/index.php/man_page"> man-pages </a> for quick access to a command description </i>

- Install: `sudo pacman -Sy man-pages`
- Use: `man page_name`, for example `man 2 write`

<i> unistd32.h file, located with mlocate </i>

- `sudo pacman -Sy mlocate` // -Sy is important here, if you omit that you probably will have to run `sudo ionice -c3 updatedb`
- `locate unistd_32.h`
- With file located just display it, ( for me ) `nvim /usr/include/asm/unistd_32.h`

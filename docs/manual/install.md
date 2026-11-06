# Install

Bimble is one program, `bimble`, with no installer. You can also use it in a browser without
installing anything: see [In a browser](browser.md).

## Download

Get the archive for your system from the
[latest release](https://github.com/guilbep/bimble/releases/latest):

| System | File |
|---|---|
| macOS, Apple Silicon (M1–M4) | `bimble-*-aarch64-apple-darwin.tar.gz` |
| macOS, Intel | `bimble-*-x86_64-apple-darwin.tar.gz` |
| Windows 10/11 | `bimble-*-x86_64-pc-windows-msvc.zip` |
| Linux x86_64 | `bimble-*-x86_64-unknown-linux-gnu.tar.gz` |
| Any browser (a static page to host yourself) | `bimble-*-web.zip` |

`SHA256SUMS` lists the checksums of all the files.

Unpack the archive, then run `bimble`. Without arguments it opens the viewer.

=== "macOS"

    The binary isn't signed yet. If macOS refuses to open it, run this once in the unpacked folder:

    ```sh
    xattr -d com.apple.quarantine bimble
    ./bimble
    ```

=== "Windows"

    Double-click `bimble.exe`. SmartScreen may warn about an unknown publisher: choose
    **More info → Run anyway**.

=== "Linux"

    ```sh
    tar xzf bimble-*-x86_64-unknown-linux-gnu.tar.gz
    ./bimble-*/bimble
    ```

    The viewer needs a graphics driver with Vulkan or OpenGL.

## Check it works

```sh
bimble --version
bimble demo frame.bimble     # a small concrete frame to try things on
bimble view frame.bimble
```

## Build from source

You need [Rust](https://rustup.rs) (stable).

```sh
git clone https://github.com/guilbep/bimble
cd bimble
cargo build --release        # the program is target/release/bimble
```

To build the browser version, see [In a browser](browser.md#host-it-yourself).

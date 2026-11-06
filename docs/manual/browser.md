# In a browser

Bimble also runs in a web page, with nothing to install:
**[guilbep.github.io/bimble](https://guilbep.github.io/bimble/)**.

It is the same program as the desktop version, compiled to WebAssembly. **The files you open stay
on your computer**: the page reads them in the browser and uploads nothing.

## Use it

- Open a file with **Open…**, or drop it on the page.
- Everything in this manual works the same way, except:
    - **Save**, **Export PDF…**, **Export SVG…** and **Save…** in the style editor download the file;
    - the [history](history.md) isn't available yet. **History…** is hidden.

## Browsers

Bimble uses **WebGPU** where the browser has it, and **WebGL2** otherwise. That covers current
Chrome, Edge, Firefox and Safari. The status bar shows which one is used.

!!! note "A blank page?"
    Check that the browser has hardware acceleration switched on. Some browsers report WebGPU while
    no graphics adapter backs it, on Linux in particular. Bimble detects that and uses WebGL2.

## Speed

The browser version loads on one processor core, where the desktop version uses all of them. Bigger
models therefore take longer to open:

| Real file | Desktop | Browser |
|---|---|---|
| 2.5 MB | 30–39 ms | 240 ms |
| 7 MB | 118–136 ms | 419 ms |
| 21 MB | 398–410 ms | 837 ms |

Measured on a 2-core test machine with software graphics; 1 run in the browser, 3 on the desktop.
A browser page can use at most 4 GB of memory, which may limit very large models.

The page downloads about 5 MB the first time (compressed).

## Host it yourself

Each release has `bimble-*-web.zip`: static files to put on any web server. WebGPU needs HTTPS
(or `localhost`).

To build it from source:

```sh
rustup target add wasm32-unknown-unknown
cargo install wasm-bindgen-cli --version <the wasm-bindgen version in Cargo.lock>
scripts/build-web.sh                       # → web/dist/
python3 -m http.server -d web/dist 8000    # then open http://localhost:8000
```

`scripts/build-web.sh` says which wasm-bindgen version it needs. It also needs `npm`, to fetch the
geometry kernel used for openings.

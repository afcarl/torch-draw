package = "draw"
version = "0.1-1"

source = {
   url = "git://github.com/kostrikov/torch-draw",
   tag = "master"
}

description = {
   summary = "An drawing library for Torch",
   detailed = [[
This package provides routines to draw basic geometrical primitives.
   ]],
   homepage = "https://github.com/kostrikov/torch-draw",
   license = "BSD"
}

dependencies = {
   "torch >= 7.0",
   "image"
}

build = {
   type = "command",
   build_command = [[
cmake -E make_directory build && cd build && cmake .. -DLUALIB=$(LUALIB) -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)" && $(MAKE)
   ]],
   install_command = "cd build && $(MAKE) install"
}

#ifndef TH_GENERIC_FILE
#define TH_GENERIC_FILE "generic/draw.c"
#else

/* Draw a rectangle inplace*/
int draw_(Main_fillRectangle)(lua_State *L) {
   THTensor *src = luaT_checkudata(L, 1, torch_Tensor);
   long startx = luaL_checklong(L, 2);
   long starty = luaL_checklong(L, 3);
   long endx = luaL_checklong(L, 4);
   long endy = luaL_checklong(L, 5);
   real r = luaL_checklong(L, 6);
   real g = luaL_checklong(L, 7);
   real b = luaL_checklong(L, 8);

   int channels = src->size[0];
   const int height = src->size[1];
   const int width = src->size[2];

   long k, x, y;

   /* in-place  */
   for (y = starty; y < endy; y++) {
      for (x = startx; x < endx; x++) {
         if (0 <= x && x < width && 0 <= y && y < height) {
            THTensor_(set3d)(src, 0, y, x, r);
            THTensor_(set3d)(src, 1, y, x, g);
            THTensor_(set3d)(src, 2, y, x, b);
         }
      }
   }

   return 0;
}

static const struct luaL_Reg draw_(Main__) [] = {
  {"fillRectangle", draw_(Main_fillRectangle)},
  {NULL, NULL}
};

void draw_(Main_init)(lua_State *L)
{
  luaT_pushmetatable(L, torch_Tensor);
  luaT_registeratname(L, draw_(Main__), "draw");
}

#endif

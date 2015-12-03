
#include <TH.h>
#include <luaT.h>

#define torch_(NAME) TH_CONCAT_3(torch_, Real, NAME)
#define torch_Tensor TH_CONCAT_STRING_3(torch., Real, Tensor)
#define draw_(NAME) TH_CONCAT_3(draw_, Real, NAME)

#include "generic/draw.c"
#include "THGenerateAllTypes.h"

DLL_EXPORT int luaopen_libdraw(lua_State *L)
{
  draw_FloatMain_init(L);
  draw_DoubleMain_init(L);
  draw_ByteMain_init(L);

  lua_newtable(L);
  lua_pushvalue(L, -1);
  lua_setglobal(L, "draw");

  lua_newtable(L);
  luaT_setfuncs(L, draw_DoubleMain__, 0);
  lua_setfield(L, -2, "double");

  lua_newtable(L);
  luaT_setfuncs(L, draw_FloatMain__, 0);
  lua_setfield(L, -2, "float");

  lua_newtable(L);
  luaT_setfuncs(L, draw_ByteMain__, 0);
  lua_setfield(L, -2, "byte");

  return 1;
}

## tools and packages

### BepInEx

Bepis Injector Extensible, a patcher designed primarily for unity games. now supports both mono and il2cpp backends. it injects to a program by providing `winhttp.dll` that overrides that of os. can be downloaded as a zip file from [github.com](https://github.com/BepInEx/BepInEx/releases/). documentation at [docs.depinex.dev](https://docs.bepinex.dev/).

# practice: writing a 3x3 grid crafting ui for `casualties: unknown`

## decomposition of app.

use ilspy to look into `.\CasualtiesUnknown_Data\Managed\Assembly-CSharp.dll`.

### RecipeItem class

the entry struct of recipe sources.

fields:
```cpp
struct {
    bool specific;
    string specificId;
    bool isLiquid;
    struct CraftingQuality quality;
    float minimumCondition=0.9;
    bool destroyItem=true;
    string ignoreId;
};
```

provide methods about matching and consuming Item according to requirements in RecipeItem itself.




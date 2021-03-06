program figa;

uses SDL2;

var
  sdlWindow1: PSDL_Window;
  sdlRenderer: PSDL_Renderer;
  sdlSurface1: PSDL_Surface;
  sdlTexture1: PSDL_Texture;
   sdlRectangle: TSDL_Rect;

begin

  //initilization of video subsystem
  if SDL_Init(SDL_INIT_VIDEO) < 0 then Halt;

  if SDL_CreateWindowAndRenderer(750, 750, SDL_WINDOW_SHOWN, @sdlWindow1, @sdlRenderer) <> 0
    then Halt;
  // set scaling quality
  SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, 'nearest');

    SDL_SetRenderDrawColor( sdlRenderer, 184, 164, 152, 255 );
  SDL_RenderClear( sdlRenderer );
  SDL_RenderPresent ( sdlRenderer );
  SDL_Delay( 100 );
//Triangle
  SDL_SetRenderDrawColor( sdlRenderer, 255, 0, 0, 255 );
  SDL_RenderDrawLine( sdlRenderer, 375, 10,375, 740 );
  SDL_SetRenderDrawColor( sdlRenderer, 255, 203, 0, 255 );
  SDL_RenderDrawLine( sdlRenderer, 375, 10,10, 375 );
   SDL_RenderDrawLine( sdlRenderer,375, 740,10,375 );
  SDL_RenderPresent( sdlRenderer );
  SDL_Delay( 2000 );


  // crée une texture à partir d'une surface
  sdlTexture1 := SDL_CreateTextureFromSurface(sdlRenderer, sdlSurface1);
  if sdlTexture1 = nil then
    Halt;

  // render texture
  SDL_RenderCopy(sdlRenderer, sdlTexture1, @sdlRectangle, nil);
  SDL_RenderCopy(sdlRenderer, sdlTexture1, nil, @sdlRectangle);

  // render to window for 2 seconds
  SDL_RenderPresent(sdlRenderer);
  SDL_Delay(6666);

  // clear memory
  SDL_DestroyTexture(sdlTexture1);
  SDL_FreeSurface(sdlSurface1);
  SDL_DestroyRenderer(sdlRenderer);
  SDL_DestroyWindow (sdlWindow1);

  //closing SDL2
  SDL_Quit;



END.


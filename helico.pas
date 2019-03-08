program helicop;

uses SDL2,SDL2_image;

var
   Running: Boolean = True;
   sdlWindow1: PSDL_Window;
   sdlRenderer: PSDL_Renderer;
   sdlSurface1: PSDL_Surface;
   sdlKeyboardState: PUInt8;
   sdlTexture1: PSDL_Texture;
   sdlTexture2: PSDL_Texture;
   sdlrectangle1: TSDL_Rect;
   sdlrectangle2: TSDL_Rect;

begin
  
    //On commence par crée la fenêtre
    if sdl_init( sdl_init_video  ) < 0 then halt;

    sdlWindow1 := sdl_CreateWindow('la GUAIR', SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 750, 750, SDL_WINDOW_SHOWN);
        if sdlWindow1 = nil then Halt;

    sdlRenderer := SDL_CreateRenderer(sdlWindow1, -1, 0);
        if sdlRenderer = nil then Halt;

    SDL_SetHint(SDL_HINT_RENDER_SCALE_QUALITY, 'nearest');


    //Ensuite on implante la premiere image
    sdlSurface1 := SDL_LoadBMP('viet.bmp');
        if sdlSurface1 = nil then Halt;
        //on la transforme en arriere plan
    sdlTexture1 := SDL_CreateTextureFromSurface(sdlRenderer, sdlSurface1);
      if sdlTexture1 = nil then Halt;

    SDL_RenderCopy(sdlRenderer, sdlTexture1, nil, nil);
    SDL_RenderPresent(sdlRenderer);

//puis la deuxieme la deuxieme
    sdlTexture2 := IMG_LoadTexture(sdlRenderer,'helicopter.png');
        if sdlTexture2 = nil then Halt;




    sdlrectangle1.x := 0;
    sdlrectangle1.y := 0;
    sdlrectangle1.w := 128;
    sdlrectangle1.h := 55;
    sdlrectangle2.x := 0;
    sdlrectangle2.y := 0;
    sdlrectangle2.w := 128;
    sdlrectangle2.h := 55;




    //Boucle
  while Running = True do
    begin
        SDL_PumpEvents;
        sdlKeyboardState := SDL_GetKeyboardState(nil);

        //Eteindre le jeu
        if sdlKeyboardState[SDL_SCANCODE_ESCAPE] = 1 then
        Running := false;

        //Déplacement
        if sdlKeyboardState[SDL_SCANCODE_W] = 1 then
            sdlrectangle1.y := sdlrectangle1.y -2;
        if sdlKeyboardState[SDL_SCANCODE_A] = 1 then
            sdlrectangle1.x := sdlrectangle1.x -2;
        if sdlKeyboardState[SDL_SCANCODE_S] = 1 then
            sdlrectangle1.y := sdlrectangle1.y +2;
        if sdlKeyboardState[SDL_SCANCODE_D] = 1 then
            sdlrectangle1.x := sdlrectangle1.x +2;


    //frame pour faire l'animation de l'helicopter
    sdlrectangle2.x := sdlrectangle2.x +128;
      if sdlrectangle2.x > 512 then
      begin
      sdlrectangle2.x := 0;
      end;
      SDL_RenderCopy(sdlRenderer, sdlTexture1, nil, nil);
      SDL_RenderCopy(sdlRenderer, sdlTexture2, @sdlrectangle2, @sdlrectangle1);
      SDL_RenderPresent(sdlRenderer);
      SDL_Delay(1);
      SDL_RenderClear(sdlRenderer);
    end;

  //Nettoyage de l'écran en detruisant les textures et la fenêtre
    SDL_DestroyTexture(sdlTexture2);
    SDL_DestroyTexture(sdlTexture1);
    SDL_FreeSurface(sdlSurface1);
    SDL_DestroyRenderer(sdlRenderer);
    SDL_DestroyWindow (sdlWindow1);

  //closing SDL2
  SDL_Quit;

end.
END.


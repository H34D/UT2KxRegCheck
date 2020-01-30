unit ut2kxregcheck;

interface

uses
  Windows, StdCtrls, Controls, Classes, Forms, Graphics,
  Dialogs, registry, FileCtrl, ExtCtrls, ComCtrls, ShellAPI;

type
  Tut2kxWin = class(TForm)
    linkbox2003: TCheckBox;
    modbox2003: TCheckBox;
    mapbox2003: TCheckBox;
    insert2003: TButton;
    insertkeytxt2003: TLabel;
    below2003: TLabel;
    maptxt2003: TLabel;
    moduletxt2003: TLabel;
    maininfotxt2003: TLabel;
    protocolbox2003: TCheckBox;
    maininfobox2003: TCheckBox;
    linktxt2003: TLabel;
    protocoltxt2003: TLabel;
    deinstallbox2003: TCheckBox;
    deinstalltxt2003: TLabel;
    cdkey2003: TEdit;
    path2003: TEdit;
    search2003: TButton;
    refresh2003: TButton;
    pathtxt2003: TLabel;
    pathshow2003: TLabel;
    changes2003: TButton;
    langbox2003: TComboBox;
    TabCTL: TPageControl;
    ut_2003: TTabSheet;
    ut_2004: TTabSheet;
    below2004: TLabel;
    pathtxt2004: TLabel;
    protocoltxt2004: TLabel;
    pathshow2004: TLabel;
    linktxt2004: TLabel;
    insertkeytxt2004: TLabel;
    modtxt2004: TLabel;
    mapstxt2004: TLabel;
    deinstalltxt2004: TLabel;
    maininfotxt2004: TLabel;
    changes2004: TButton;
    deinstallbox2004: TCheckBox;
    insert2004: TButton;
    modbox2004: TCheckBox;
    refresh2004: TButton;
    protocolbox2004: TCheckBox;
    mapbox2004: TCheckBox;
    maininfobox2004: TCheckBox;
    linkbox2004: TCheckBox;
    langbox2004: TComboBox;
    cdkey2004: TEdit;
    search2004: TButton;
    path2004: TEdit;
    about: TTabSheet;
    about_txt: TLabel;
    mailto_link: TLabel;
    bugtxt: TLabel;
    bugtxt2: TLabel;

    procedure insert2003Click(Sender: TObject);
    procedure search2003Click(Sender: TObject);
    procedure changes2003Click(Sender: TObject);

    procedure insert2004Click(Sender: TObject);
    procedure search2004Click(Sender: TObject);
    procedure changes2004Click(Sender: TObject);

    procedure checkregvalues2003(Sender: TObject);
    procedure checkregvalues2004(Sender: TObject);
    procedure checkBoth(Sender: TObject);

    procedure setenglish2003();
    procedure setgerman2003();
    procedure setspanish2003();
    procedure setfrench2003();
    procedure setitalian2003();

    procedure setenglish2004();
    procedure setgerman2004();
    procedure setspanish2004();
    procedure setfrench2004();
    procedure setitalian2004();

    procedure mailtoclicked(Sender: TObject);
    procedure mailtomOver(Sender: TObject);
    procedure mailtomOut(Sender: TObject);

  end;

var ut2kxWin: Tut2kxWin;

implementation

{$R *.dfm}

procedure Tut2kxWin.insert2003Click(Sender: TObject);
var
  Reg: TRegistry;
  Outputstrings: String;
  check: Integer;
begin
  check:=0;
  if mapbox2003.checked then
  begin
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2003.Map', true);
    Reg.WriteString('','UT2003 Map');
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\.ut2', true);
    Reg.WriteString('','UT2003.Map');
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2003.Map\DefaultIcon', true);
    Outputstrings:=Concat(path2003.Text, '\help\Unreal.ico');
    Reg.WriteString('',Outputstrings);
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2003.Map\Shell', true);
    Reg.WriteString('','open');
    Reg.OpenKey('open', true);
    Reg.WriteString('','&Play this UT2003 level');
    Reg.OpenKey('command', true);
    Outputstrings:=Concat(path2003.Text, '\System\UT2003.exe "%1"');
    Reg.WriteString('',Outputstrings);
    Reg.free;
    mapbox2003.Enabled:=false;
    mapbox2003.checked:=false;
    check:=1;
  end;
  if modbox2003.checked then
  begin
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2003.Module', true);
    Reg.WriteString('','UT2003 Module');
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\.ut2mod', true);
    Reg.WriteString('','UT2003.Module');
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2003.Module\DefaultIcon', true);
    Outputstrings:=Concat(path2003.Text, '\help\Unreal.ico');
    Reg.WriteString('',Outputstrings);
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2003.Module\Shell', true);
    Reg.WriteString('','open');
    Reg.OpenKey('open', true);
    Reg.WriteString('','&Install this UT2003 module');
    Reg.OpenKey('command', true);
    Outputstrings:=Concat(path2003.Text, '\System\Setup.exe install "%1"');
    Reg.WriteString('',Outputstrings);
    Reg.free;
    modbox2003.checked:=false;
    modbox2003.Enabled:=false;
    check:=1;
  end;
  if linkbox2003.checked then
  begin
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2003.Link', true);
    Reg.WriteString('','UT2003 Link');
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\.ut2link', true);
    Reg.WriteString('','UT2003.Link');
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2003.Link\DefaultIcon', true);
    Outputstrings:=Concat(path2003.Text, '\help\Unreal.ico');
    Reg.WriteString('',Outputstrings);
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2003.Link\Shell', true);
    Reg.WriteString('','open');
    Reg.OpenKey('open', true);
    Reg.WriteString('','&Play this UT2003 level');
    Reg.OpenKey('command', true);
    Outputstrings:=Concat(path2003.Text, '\System\UT2003.exe "%1"');
    Reg.WriteString('',Outputstrings);
    linkbox2003.Enabled:=false;
    linkbox2003.checked:=false;
    Reg.free;
    check:=1;
  end;
  if protocolbox2003.checked then
  begin
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\unreal', true);
    Reg.WriteString('','URL:Unreal Tournament 2003 Protocol');
    Reg.WriteString('URL protocol','');
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\unreal\DefaultIcon', true);
    Outputstrings:=Concat(path2003.Text, '\help\Unreal.ico');
    Reg.WriteString('',Outputstrings);
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\unreal\Shell', true);
    Reg.WriteString('','open');
    Reg.OpenKey('open', true);
    Reg.WriteString('','&Play this UT2003 level');
    Reg.OpenKey('command', true);
    Outputstrings:=Concat(path2003.Text, '\System\UT2003.exe "%1"');
    Reg.WriteString('',Outputstrings);
    Reg.free;
    protocolbox2003.Enabled:=false;
    protocolbox2003.checked:=false;
    check:=1;
  end;
  if deinstallbox2003.checked then
  begin
  { this is d0ne }
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\UT2003', true);
    Reg.WriteString('DisplayName','Unreal Tournament 2003');
    Outputstrings:=Concat(path2003.Text, '\system\setup.exe uninstall UT2003');
    Reg.Writestring('UninstallString',Outputstrings);
    Reg.free;
    deinstallbox2003.Enabled:=false;
    deinstallbox2003.checked:=false;
    check:=1;
  end;
  if maininfobox2003.checked then
  begin
  check:=1;
  { this is d0ne }
  if langbox2003.text = 'German' then
    setgerman2003()
  else if langbox2003.text = 'French' then
    setfrench2003()
  else if langbox2003.text = 'Spanish' then
    setspanish2003()
  else if langbox2003.text = 'Italian' then
    setitalian2003()
  else if langbox2003.Text = 'English' then
    setenglish2003()
  else
    begin
      check:=0;
      showmessage('please chose a language and try again');
    end;
  end;
  if check > 0 then { any changes happend ? }
  begin
    maininfobox2003.Enabled:=false;
    maininfobox2003.checked:=false;
    langbox2003.enabled:=false;
    path2003.enabled:=false;
    cdkey2003.enabled:=false;
    pathshow2003.Caption:=path2003.Text;
    search2003.enabled:=false;
    showmessage('all data inserted - dont forget to reboot your machine');
  end;
end;

procedure Tut2kxWin.search2003Click(Sender: TObject);
var
  St: string;
begin
  St:='c:\';
  if SelectDirectory(St,[],0) then path2003.text:=St;
end;

procedure Tut2kxWin.changes2003Click(Sender: TObject);
begin
  maininfobox2003.Enabled:=true;
  maininfobox2003.checked:=true;

  deinstallbox2003.Enabled:=true;
  deinstallbox2003.checked:=true;

  protocolbox2003.Enabled:=true;
  protocolbox2003.checked:=true;

  linkbox2003.Enabled:=true;
  linkbox2003.checked:=true;

  mapbox2003.Enabled:=true;
  mapbox2003.checked:=true;

  modbox2003.Enabled:=true;
  modbox2003.checked:=true;

  pathtxt2003.Enabled:=true;
  pathtxt2003.enabled:=true;

  path2003.enabled:=true;
  cdkey2003.enabled:=true;
  langbox2003.enabled:=true;
  search2003.enabled:=true;
end;

procedure Tut2kxWin.setenglish2003();
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\Unreal Technology\Installed Apps\UT2003', true);
  Reg.WriteString('Folder',path2003.Text);
  Reg.WriteString('Version','2107');
  Reg.WriteString('CDKey',cdkey2003.Text);
  Reg.Writestring('ADMIN_RIGHTS','You need to run this program as an administrator, not as a guest or limited user account.');
  Reg.WriteString('NO_DISC','No disc in drive.  Please insert the disc labelled Unreal Tournament 2003 Play Disc to continue.');
  Reg.WriteString('NO_DRIVE','No CD-ROM or DVD-ROM drive detected.');
  Reg.WriteString('TITLEBAR','Unreal Tournament 2003');
  Reg.WriteString('WRONG_DISC','Wrong disc in drive.  Please insert the disc labelled Unreal Tournament 2003 Play Disc to continue.');
  Reg.WriteString('YEAR','2003');
  Reg.free;
end;

procedure Tut2kxWin.setgerman2003();
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\Unreal Technology\Installed Apps\UT2003', true);
  Reg.WriteString('Folder',path2003.Text);
  Reg.WriteString('Version','2107');
  Reg.WriteString('CDKey',cdkey2003.Text);
  Reg.Writestring('ADMIN_RIGHTS','Dieses Programm muss als Administrator betrieben werden, und nicht als Gastbenutzer oder Benutzer mit begrenztem Zugang.');
  Reg.WriteString('NO_DISC','Keine Disc im Laufwerk. Legen Sie bitte die Unreal Tournament 2003 Play Disc ein, um fortzufahren.');
  Reg.WriteString('NO_DRIVE','Keine CD-ROM oder Dvd-ROM im Laufwerk.');
  Reg.WriteString('TITLEBAR','Unreal Tournament 2003');
  Reg.WriteString('WRONG_DISC','Falsche Disc im Laufwerk. Legen Sie bitte die Unreal Tournament 2003 Play Disc ein, um fortzufahren.');
  Reg.WriteString('YEAR','2003');
  Reg.free;
end;

procedure Tut2kxWin.setfrench2003();
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\Unreal Technology\Installed Apps\UT2003', true);
  Reg.WriteString('Folder',path2003.Text);
  Reg.WriteString('Version','2107');
  Reg.WriteString('CDKey',cdkey2003.Text);
  Reg.Writestring('ADMIN_RIGHTS','Vous devez lancer ce programme en tant qu administrateur, pas en tant qu utilisateur limité.');
  Reg.WriteString('NO_DISC','Pas de disque dans le lecteur. Veuillez insérez le disque Unreal Tournament 2003 Play Disc pour continuer.');
  Reg.WriteString('NO_DRIVE','Aucun CD-ROM ou DVD-ROM détecté.');
  Reg.WriteString('TITLEBAR','Unreal Tournament 2003');
  Reg.WriteString('WRONG_DISC','Mauvais disque dans le lecteur. Veuillez insérer le disque Unreal Tournament 2003 Play Disc pour continuer.');
  Reg.WriteString('YEAR','2003');
  Reg.free;
end;

procedure Tut2kxWin.setitalian2003();
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\Unreal Technology\Installed Apps\UT2003', true);
  Reg.WriteString('Folder',path2003.Text);
  Reg.WriteString('Version','2107');
  Reg.WriteString('CDKey',cdkey2003.Text);
  Reg.Writestring('ADMIN_RIGHTS','Devi lanciare questo programma come amministratore, non come utente limitato.');
  Reg.WriteString('NO_DISC','Nessun disco inserito. Inserire il disco Unreal Tournament 2003 Play Disc per continuare.');
  Reg.WriteString('NO_DRIVE','Nessun CD-ROM o Dvd-ROM trovato.');
  Reg.WriteString('TITLEBAR','Unreal Tournament 2003');
  Reg.WriteString('WRONG_DISC','È stato inserito un disco errato. Inserire il disco Unreal Tournament 2003 Play Disc per continuare.');
  Reg.WriteString('YEAR','2003');
  Reg.free;
end;

procedure Tut2kxWin.setspanish2003();
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\Unreal Technology\Installed Apps\UT2003', true);
  Reg.WriteString('Folder',path2003.Text);
  Reg.WriteString('Version','2107');
  Reg.WriteString('CDKey',cdkey2003.Text);
  Reg.Writestring('ADMIN_RIGHTS','Necesitas lanzar este programa como administrador, no como huésped o usuario limitado.');
  Reg.WriteString('NO_DISC','Ningún disco en la unidad. Por favor inserta el disco Unreal Tournament 2003 Play Disc para continuar.');
  Reg.WriteString('NO_DRIVE','Ninguna unidad CD-ROM o DVD-ROM detectada.');
  Reg.WriteString('TITLEBAR','Unreal Tournament 2003');
  Reg.WriteString('WRONG_DISC','Disco incorrecto en la unidad. Por favor inserta el disco Unreal Tournament 2003 Play Disc para continuar.');
  Reg.WriteString('YEAR','2003');
  Reg.free;
end;

procedure Tut2kxWin.checkregvalues2003(Sender: TObject);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\Unreal Technology\Installed Apps\UT2003', false);
  if Reg.ReadString('CDKey') <> '' then
  begin
    path2003.text:=Reg.ReadString('Folder');
    cdkey2003.Text:=Reg.ReadString('CDKey');
    path2003.enabled:=false;
    cdkey2003.enabled:=false;
    search2003.enabled:=false;
    pathshow2003.caption:=Reg.ReadString('Folder');
    pathtxt2003.Enabled:=true;
    maininfobox2003.Enabled:=false;
    maininfobox2003.checked:=false;
    langbox2003.enabled:=false;
  end
  else
  begin
    pathtxt2003.Enabled:=true;
    search2003.enabled:=true;
    maininfobox2003.Enabled:=true;
    pathshow2003.caption:='';
    path2003.enabled:=true;
    maininfobox2003.checked:=true;
    langbox2003.enabled:=true;
    cdkey2003.enabled:=true;
  end;
  Reg.free;
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\UT2003', false);
  if Reg.ReadString('DisplayName') <> '' then
  begin
    deinstallbox2003.checked:=false;
    deinstallbox2003.Enabled:=false;
  end
  else
  begin
    deinstallbox2003.Enabled:=true;
    deinstallbox2003.checked:=true;
  end;
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CLASSES_ROOT;
  Reg.OpenKey('\unreal', false);
  if Reg.ReadString('') <> '' then
  begin
    protocolbox2003.checked:=false;
    protocolbox2003.Enabled:=false;
  end
  else
  begin
    protocolbox2003.checked:=true;
    protocolbox2003.Enabled:=true;
  end;
  Reg.free;
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CLASSES_ROOT;
  Reg.OpenKey('\UT2003.Link', false);
  if Reg.ReadString('') <> '' then
  begin
    linkbox2003.checked:=false;
    linkbox2003.Enabled:=false;
  end
  else
  begin
    linkbox2003.checked:=true;
    linkbox2003.Enabled:=true;
  end;
  Reg.free;
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CLASSES_ROOT;
  Reg.OpenKey('\UT2003.Map', false);
  if Reg.ReadString('') <> '' then
  begin
    mapbox2003.checked:=false;
    mapbox2003.Enabled:=false;
  end
  else
  begin
    maininfobox2003.checked:=true;
    mapbox2003.Enabled:=true;
  end;
  Reg.free;
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CLASSES_ROOT;
  Reg.OpenKey('\UT2003.Module', false);
  if Reg.ReadString('') <> '' then
  begin
    modbox2003.checked:=false;
    modbox2003.Enabled:=false;
  end
  else
  begin
    maininfobox2003.checked:=true;
    modbox2003.Enabled:=true;
  end;
  Reg.free;
end;

{
* End of ut2k3
*
* Start of ut2k4
}

procedure Tut2kxWin.insert2004Click(Sender: TObject);
var
  Reg: TRegistry;
  Outputstrings: String;
  check: Integer;
begin
  check:=0;
  if mapbox2004.checked then
  begin
    Reg := TRegistry.Create;

    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2004.Map', true);
    Reg.WriteString('','UT2004 Map');

    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\.ut2', true);
    Reg.WriteString('','UT2004.Map');

    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2004.Map\DefaultIcon', true);
    Outputstrings:=Concat(path2004.Text, '\help\Unreal.ico');
    Reg.WriteString('',Outputstrings);

    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2004.Map\Shell', true);
    Reg.WriteString('','open');
    Reg.OpenKey('open', true);
    Reg.WriteString('','&Play this UT2004 level');
    Reg.OpenKey('command', true);
    Outputstrings:=Concat(path2004.Text, '\System\UT2004.exe "%1"');
    Reg.WriteString('',Outputstrings);
    Reg.free;
    mapbox2004.Enabled:=false;
    mapbox2004.checked:=false;
    check:=1;
  end;
  if modbox2004.checked then
  begin
    Reg := TRegistry.Create;

    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2004.Module', true);
    Reg.WriteString('','UT2004 Module');

    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\.ut4mod', true);
    Reg.WriteString('','UT2004.Module');

    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2004.Module\DefaultIcon', true);
    Outputstrings:=Concat(path2004.Text, '\help\Unreal.ico');
    Reg.WriteString('',Outputstrings);

    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2004.Module\Shell', true);
    Reg.WriteString('','open');
    Reg.OpenKey('open', true);
    Reg.WriteString('','&Install this UT2004 module');
    Reg.OpenKey('command', true);
    Outputstrings:=Concat(path2004.Text, '\System\Setup.exe install "%1"');
    Reg.WriteString('',Outputstrings);
    Reg.free;
    modbox2004.checked:=false;
    modbox2004.Enabled:=false;
    check:=1;
  end;
  if linkbox2004.checked then
  begin
    Reg := TRegistry.Create;

    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2004.Link', true);
    Reg.WriteString('','UT2004 Link');

    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\.ut2link', true);
    Reg.WriteString('','UT2004.Link');

    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2004.Link\DefaultIcon', true);
    Outputstrings:=Concat(path2004.Text, '\help\Unreal.ico');
    Reg.WriteString('',Outputstrings);

    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\UT2004.Link\Shell', true);
    Reg.WriteString('','open');
    Reg.OpenKey('open', true);
    Reg.WriteString('','&Play this UT2004 level');
    Reg.OpenKey('command', true);
    Outputstrings:=Concat(path2004.Text, '\System\UT2004.exe "%1"');
    Reg.WriteString('',Outputstrings);
    linkbox2004.Enabled:=false;
    linkbox2004.checked:=false;
    Reg.free;
    check:=1;
  end;
  if protocolbox2004.checked then
  begin
    Reg := TRegistry.Create;

    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\ut2004', true);
    Reg.WriteString('','URL:Unreal Tournament 2003 Protocol');
    Reg.WriteString('URL protocol','');

    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\ut2004\DefaultIcon', true);
    Outputstrings:=Concat(path2004.Text, '\help\Unreal.ico');
    Reg.WriteString('',Outputstrings);

    Reg.RootKey := HKEY_CLASSES_ROOT;
    Reg.OpenKey('\ut2004\Shell', true);
    Reg.WriteString('','open');
    Reg.OpenKey('open', true);
    Reg.WriteString('','&Play this UT2004 level');
    Reg.OpenKey('command', true);
    Outputstrings:=Concat(path2004.Text, '\System\UT2004.exe "%1"');
    Reg.WriteString('',Outputstrings);
    Reg.free;
    protocolbox2004.Enabled:=false;
    protocolbox2004.checked:=false;
    check:=1;
  end;
  if deinstallbox2004.checked then
  begin
  { this is d0ne }
    Reg := TRegistry.Create;

    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\UT2004', true);
    Reg.WriteString('DisplayName','Unreal Tournament 2004');
    Outputstrings:=Concat(path2004.Text, '\system\setup.exe uninstall UT2004');
    Reg.Writestring('UninstallString',Outputstrings);
    Reg.free;
    deinstallbox2004.Enabled:=false;
    deinstallbox2004.checked:=false;
    check:=1;
  end;
  if maininfobox2004.checked then
  begin
  check:=1;
  { this is d0ne }
  if langbox2004.text = 'German' then
    setgerman2004()
  else if langbox2004.text = 'French' then
    setfrench2004()
  else if langbox2004.text = 'Spanish' then
    setspanish2004()
  else if langbox2004.text = 'Italian' then
    setitalian2004()
  else if langbox2004.Text = 'English' then
    setenglish2004()
  else
    begin
      check:=0;
      showmessage('please chose a language and try again');
    end;
  end;
  if check > 0 then { any changes happend ? }
  begin
    maininfobox2004.Enabled:=false;
    maininfobox2004.checked:=false;
    langbox2004.enabled:=false;
    path2004.enabled:=false;
    cdkey2004.enabled:=false;
    pathshow2004.Caption:=path2004.Text;
    search2004.enabled:=false;
    showmessage('all data inserted - dont forget to reboot your machine');
  end;
end;

procedure Tut2kxWin.search2004Click(Sender: TObject);
var
  St: string;
begin
  St:='c:\';
  if SelectDirectory(St,[],0) then path2004.text:=St;
end;

procedure Tut2kxWin.changes2004Click(Sender: TObject);
begin
  maininfobox2004.Enabled:=true;
  maininfobox2004.checked:=true;

  deinstallbox2004.Enabled:=true;
  deinstallbox2004.checked:=true;

  protocolbox2004.Enabled:=true;
  protocolbox2004.checked:=true;

  linkbox2004.Enabled:=true;
  linkbox2004.checked:=true;

  mapbox2004.Enabled:=true;
  mapbox2004.checked:=true;

  modbox2004.Enabled:=true;
  modbox2004.checked:=true;

  pathtxt2004.Enabled:=true;
  pathtxt2004.enabled:=true;

  path2004.enabled:=true;
  cdkey2004.enabled:=true;
  langbox2004.enabled:=true;
  search2004.enabled:=true;
end;

procedure Tut2kxWin.setenglish2004();
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;

  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\Unreal Technology\Installed Apps\UT2004', true);
  Reg.WriteString('Folder',path2004.Text);
  Reg.WriteString('Version','3186');
  Reg.WriteString('CDKey',cdkey2004.Text);
  Reg.Writestring('ADMIN_RIGHTS','You need to run this program as an administrator, not as a guest or limited user account.');
  Reg.WriteString('NO_DISC','No disc in drive.  Please insert the disc labelled Unreal Tournament 2004 Play Disc to continue.');
  Reg.WriteString('NO_DRIVE','No CD-ROM or DVD-ROM drive detected.');
  Reg.WriteString('TITLEBAR','Unreal Tournament 2004');
  Reg.WriteString('WRONG_DISC','Wrong disc in drive.  Please insert the disc labelled Unreal Tournament 2004 Play Disc to continue.');
  Reg.WriteString('YEAR','2004');
  Reg.free;
end;

procedure Tut2kxWin.setgerman2004();
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\Unreal Technology\Installed Apps\UT2004', true);
  Reg.WriteString('Folder',path2004.Text);
  Reg.WriteString('Version','3186');
  Reg.WriteString('CDKey',cdkey2004.Text);
  Reg.Writestring('ADMIN_RIGHTS','Dieses Programm muss als Administrator betrieben werden, und nicht als Gastbenutzer oder Benutzer mit begrenztem Zugang.');
  Reg.WriteString('NO_DISC','Keine Disc im Laufwerk. Legen Sie bitte die Unreal Tournament 2004 Play Disc ein, um fortzufahren.');
  Reg.WriteString('NO_DRIVE','Keine CD-ROM oder Dvd-ROM im Laufwerk.');
  Reg.WriteString('TITLEBAR','Unreal Tournament 2004');
  Reg.WriteString('WRONG_DISC','Falsche Disc im Laufwerk. Legen Sie bitte die Unreal Tournament 2004 Play Disc ein, um fortzufahren.');
  Reg.WriteString('YEAR','2004');
  Reg.free;
end;

procedure Tut2kxWin.setfrench2004();
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\Unreal Technology\Installed Apps\UT2004', true);
  Reg.WriteString('Folder',path2004.Text);
  Reg.WriteString('Version','3186');
  Reg.WriteString('CDKey',cdkey2004.Text);
  Reg.Writestring('ADMIN_RIGHTS','Vous devez lancer ce programme en tant qu administrateur, pas en tant qu utilisateur limité.');
  Reg.WriteString('NO_DISC','Pas de disque dans le lecteur. Veuillez insérez le disque Unreal Tournament 2004 Play Disc pour continuer.');
  Reg.WriteString('NO_DRIVE','Aucun CD-ROM ou DVD-ROM détecté.');
  Reg.WriteString('TITLEBAR','Unreal Tournament 2004');
  Reg.WriteString('WRONG_DISC','Mauvais disque dans le lecteur. Veuillez insérer le disque Unreal Tournament 2004 Play Disc pour continuer.');
  Reg.WriteString('YEAR','2004');
  Reg.free;
end;

procedure Tut2kxWin.setitalian2004();
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\Unreal Technology\Installed Apps\UT2004', true);
  Reg.WriteString('Folder',path2004.Text);
  Reg.WriteString('Version','3186');
  Reg.WriteString('CDKey',cdkey2004.Text);
  Reg.Writestring('ADMIN_RIGHTS','Devi lanciare questo programma come amministratore, non come utente limitato.');
  Reg.WriteString('NO_DISC','Nessun disco inserito. Inserire il disco Unreal Tournament 2004 Play Disc per continuare.');
  Reg.WriteString('NO_DRIVE','Nessun CD-ROM o Dvd-ROM trovato.');
  Reg.WriteString('TITLEBAR','Unreal Tournament 2004');
  Reg.WriteString('WRONG_DISC','È stato inserito un disco errato. Inserire il disco Unreal Tournament 2004 Play Disc per continuare.');
  Reg.WriteString('YEAR','2004');
  Reg.free;
end;

procedure Tut2kxWin.setspanish2004();
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\Unreal Technology\Installed Apps\UT2004', true);
  Reg.WriteString('Folder',path2004.Text);
  Reg.WriteString('Version','3186');
  Reg.WriteString('CDKey',cdkey2004.Text);
  Reg.Writestring('ADMIN_RIGHTS','Necesitas lanzar este programa como administrador, no como huésped o usuario limitado.');
  Reg.WriteString('NO_DISC','Ningún disco en la unidad. Por favor inserta el disco Unreal Tournament 2004 Play Disc para continuar.');
  Reg.WriteString('NO_DRIVE','Ninguna unidad CD-ROM o DVD-ROM detectada.');
  Reg.WriteString('TITLEBAR','Unreal Tournament 2004');
  Reg.WriteString('WRONG_DISC','Disco incorrecto en la unidad. Por favor inserta el disco Unreal Tournament 2004 Play Disc para continuar.');
  Reg.WriteString('YEAR','2004');
  Reg.free;
end;

procedure Tut2kxWin.checkregvalues2004(Sender: TObject);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('Software\Unreal Technology\Installed Apps\UT2004', false);
  if Reg.ReadString('CDKey') <> '' then
  begin
    path2004.text:=Reg.ReadString('Folder');
    cdkey2004.Text:=Reg.ReadString('CDKey');
    path2004.enabled:=false;
    cdkey2004.enabled:=false;
    search2004.enabled:=false;
    pathshow2004.caption:=Reg.ReadString('Folder');
    pathtxt2004.Enabled:=true;
    maininfobox2004.Enabled:=false;
    maininfobox2004.checked:=false;
    langbox2004.enabled:=false;
  end
  else
  begin
    pathtxt2004.Enabled:=true;
    search2004.enabled:=true;
    maininfobox2004.Enabled:=true;
    pathshow2004.caption:='';
    path2004.enabled:=true;
    maininfobox2004.checked:=true;
    langbox2004.enabled:=true;
    cdkey2004.enabled:=true;
  end;
  Reg.free;
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_LOCAL_MACHINE;
  Reg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\UT2004', false);
  if Reg.ReadString('DisplayName') <> '' then
  begin
    deinstallbox2004.checked:=false;
    deinstallbox2004.Enabled:=false;
  end
  else
  begin
    deinstallbox2004.Enabled:=true;
    deinstallbox2004.checked:=true;
  end;
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CLASSES_ROOT;
  Reg.OpenKey('\unreal', false);
  if Reg.ReadString('') <> '' then
  begin
    protocolbox2004.checked:=false;
    protocolbox2004.Enabled:=false;
  end
  else
  begin
    protocolbox2004.checked:=true;
    protocolbox2004.Enabled:=true;
  end;
  Reg.free;
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CLASSES_ROOT;
  Reg.OpenKey('\UT2004.Link', false);
  if Reg.ReadString('') <> '' then
  begin
    linkbox2004.checked:=false;
    linkbox2004.Enabled:=false;
  end
  else
  begin
    linkbox2004.checked:=true;
    linkbox2004.Enabled:=true;
  end;
  Reg.free;
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CLASSES_ROOT;
  Reg.OpenKey('\UT2004.Map', false);
  if Reg.ReadString('') <> '' then
  begin
    mapbox2004.checked:=false;
    mapbox2004.Enabled:=false;
  end
  else
  begin
    maininfobox2004.checked:=true;
    mapbox2004.Enabled:=true;
  end;
  Reg.free;
  Reg := TRegistry.Create;
  Reg.RootKey := HKEY_CLASSES_ROOT;
  Reg.OpenKey('\UT2004.Module', false);
  if Reg.ReadString('') <> '' then
  begin
    modbox2004.checked:=false;
    modbox2004.Enabled:=false;
  end
  else
  begin
    maininfobox2004.checked:=true;
    modbox2004.Enabled:=true;
  end;
  Reg.free;
end;

procedure Tut2kxWin.checkBoth(Sender: TObject);
begin
  checkregvalues2003(Sender);
  checkregvalues2004(Sender);
end;

procedure Tut2kxWin.mailtomOver(Sender: TObject);
begin

mailto_link.Font.Color:=clred;
mailto_link.Cursor:=crHandpoint;

end;

procedure Tut2kxWin.mailtomOut(Sender: TObject);
begin

mailto_link.Font.color:=clblue;
mailto_link.Cursor:=crDefault;

end;

procedure Tut2kxWin.mailtoclicked(Sender: TObject);
begin

ShellExecute(Application.Handle, 'open', PChar('mailto:head@fof-clan.com'), nil, nil, sw_ShowNormal);

end;

end.

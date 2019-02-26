(*

    Daraja Framework
    Copyright (C) 2016  Michael Justin

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.


    You can be released from the requirements of the license by purchasing
    a commercial license. Buying such a license is mandatory as soon as you
    develop commercial activities involving the Daraja framework without
    disclosing the source code of your own applications. These activities
    include: offering paid services to customers as an ASP, shipping Daraja 
    with a closed source product.

*)

program GoogleAuthBackend;

{$APPTYPE CONSOLE}

uses
  djServer,
  djWebAppContext,
  djInterfaces,
  djNCSALogHandler,
  PublicResource in 'PublicResource.pas',
  // SecuredResource in 'SecuredResource.pas',
  LoginResource in 'LoginResource.pas';
  (* LoginErrorResource in 'LoginErrorResource.pas',
  LogoutResource in 'LogoutResource.pas',
  FormAuthHandler in 'FormAuthHandler.pas',
  FooterTemplate in 'FooterTemplate.pas' *)

procedure Demo;
var
  Server: TdjServer;
  Context: TdjWebAppContext;
  Handler: IHandler;
  LogHandler: IHandler;
begin
  Server := TdjServer.Create(80);
  try
    Context := TdjWebAppContext.Create('', True);
    Context.Add(TPublicResource, '/index.html');
    // Context.Add(TSecuredResource, '/admin');
    Context.Add(TLoginResource, '/signin');
    (* Context.Add(TLoginErrorResource, '/loginError');
    Context.Add(TLogoutResource, '/logout'); *)
    Server.Add(Context);

    // add NCSA logger handler (at the end to log all handlers)
    LogHandler := TdjNCSALogHandler.Create;
    Server.AddHandler(LogHandler);

    Server.Start;
    WriteLn('Server is running, please open http://localhost/index.html');
    WriteLn('Hit any key to terminate.');
    ReadLn;
  finally
    Server.Free;
  end;
end;

begin
  Demo;
end.


(*

    Daraja Framework
    Copyright (C) Michael Justin

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

unit RootResource;

interface

uses
  djWebComponent, djTypes;

type

  { TRootResource }

  TRootResource = class(TdjWebComponent)
  public
    procedure OnGet(Request: TdjRequest; Response: TdjResponse); override;
  end;

implementation

uses
  BindingHelper, OpenIDHelper,
  IdHTTP, SysUtils;

{ TRootResource }

// https://developer.paypal.com/docs/integration/direct/identity/button-js-builder/

procedure TRootResource.OnGet(Request: TdjRequest; Response: TdjResponse);
var
  AuthCode: string;
begin
  AuthCode := Request.Params.Values['code'];

  WriteLn(Request.QueryParams);

  Response.ContentText := BindingHelper.Bind(Config.GetContext.GetContextPath,
    'index.html', OpenIDParams);

  Response.ContentType := 'text/html';
  Response.CharSet := 'utf-8';
end;

end.

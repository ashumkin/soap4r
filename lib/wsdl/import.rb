=begin
WSDL4R - WSDL import definition.
Copyright (C) 2002 NAKAMURA Hiroshi.

This program is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation; either version 2 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PRATICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program; if not, write to the Free Software Foundation, Inc., 675 Mass
Ave, Cambridge, MA 02139, USA.
=end


require 'wsdl/info'


module WSDL


class Import < Info
  attr_reader :namespace
  attr_reader :location

  def initialize
    super
    @namespace = nil
    @location = nil
  end

  def parseElement( element )
    raise WSDLParser::UnknownElementError.new( "Unknown element #{ element }." )
  end

  NamespaceAttrName = Name.new( nil, 'namespace' )
  LocationAttrName = Name.new( nil, 'location' )
  def parseAttr( attr, value )
    case attr
    when NamespaceAttrName
      @namespace = value
    when LocationAttrName
      @location = location
      STDERR.puts "Importing from specified location is not supported now..."
    else
      raise WSDLParser::UnknownAttributeError.new( "Unknown attr #{ attr }." )
    end
  end
end


end

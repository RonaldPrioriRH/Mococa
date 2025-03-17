#include 'totvs.ch'

/*/{Protheus.doc} GridMock
description
@type class
@version 1.0
@author marcio.katsumata
@since 31/08/2024
/*/
class GridMock

    DATA aHeader as array
    DATA aCols as array

    method new() constructor

endClass

/*/{Protheus.doc} GridMock::new
description
@type method
@version 1.0
@author marcio.katsumata
@since 31/08/2024
@param aHeader, array, param_description
@param aCols, array, param_description
@return variant, return_description
/*/
method new(aHeader, aCols) class GridMock

    self:aHeader := aHeader
    self:aCols   := aCols

return

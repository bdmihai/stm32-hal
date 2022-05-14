/*_____________________________________________________________________________
 │                                                                            |
 │ COPYRIGHT (C) 2021 Mihai Baneu                                             |
 │                                                                            |
 | Permission is hereby  granted,  free of charge,  to any person obtaining a |
 | copy of this software and associated documentation files (the "Software"), |
 | to deal in the Software without restriction,  including without limitation |
 | the rights to  use, copy, modify, merge, publish, distribute,  sublicense, |
 | and/or sell copies  of  the Software, and to permit  persons to  whom  the |
 | Software is furnished to do so, subject to the following conditions:       |
 |                                                                            |
 | The above  copyright notice  and this permission notice  shall be included |
 | in all copies or substantial portions of the Software.                     |
 |                                                                            |
 | THE SOFTWARE IS PROVIDED  "AS IS",  WITHOUT WARRANTY OF ANY KIND,  EXPRESS |
 | OR   IMPLIED,   INCLUDING   BUT   NOT   LIMITED   TO   THE  WARRANTIES  OF |
 | MERCHANTABILITY,  FITNESS FOR  A  PARTICULAR  PURPOSE AND NONINFRINGEMENT. |
 | IN NO  EVENT SHALL  THE AUTHORS  OR  COPYRIGHT  HOLDERS  BE LIABLE FOR ANY |
 | CLAIM, DAMAGES OR OTHER LIABILITY,  WHETHER IN AN ACTION OF CONTRACT, TORT |
 | OR OTHERWISE, ARISING FROM,  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR  |
 | THE USE OR OTHER DEALINGS IN THE SOFTWARE.                                 |
 |____________________________________________________________________________|
 |                                                                            |
 |  Author: Mihai Baneu                           Last modified: 02.Jan.2021  |
 |                                                                            |
 |___________________________________________________________________________*/

import qbs.FileInfo

Product {
    name: "hal"
    type: "lib"

    Depends { name: "stm32" }
    Depends { name: "cmsis" }
    Properties {
        condition: stm32.targetSeries == "STM32F1"
        stm32.includePaths: [
            "STM32F1xx/inc"
        ]
    }
    Properties {
        condition: stm32.targetSeries == "STM32F4"
        stm32.includePaths: [
            "STM32F4xx/inc"
        ]
    }

    Group {
        name: "STM32F1xx"
        condition: stm32.targetSeries == "STM32F1"
        files: [
            "STM32F1xx/inc/*.h",
            "STM32F1xx/src/*.c"
        ]
    }
    Group {
        name: "STM32F4xx"
        condition: stm32.targetSeries == "STM32F4"
        files: [
            "STM32F4xx/inc/*.h",
            "STM32F4xx/src/*.c"
        ]
    }

    Export {
        Depends { name: "stm32" }
        stm32.includePaths: exportingProduct.stm32.includePaths
        stm32.libraryPaths: [ exportingProduct.destinationDirectory ]
    }
}

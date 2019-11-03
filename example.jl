#TODO CONVERT TO 1-BASED INDEXING


function readOCR(input_grid::Array{String,1})


    digits = Dict()

    digits[" _ ",
           "| |",
           "|_|",
           "   "] = '0'


    digits["   ",
           "  |",
           "  |",
           "   "], = '1'

    digits[" _ ",
           " _|",
           "|_ ",
           "   "] = '2'



    digits[" _ ",
           " _|",
           " _|",
           "   "] = '3'



    digits["   ",
           "|_|",
           "  |",
           "   "] = '4'



    digits[" _ ",
           "|_ ",
           " _|",
           "   "] = '5'


    digits[" _ ",
           "|_ ",
           "|_|",
           "   "] = '6'



    digits[" _ ",
           "  |",
           "  |",
           "   "] = '7'



    digits[" _ ",
           "|_|",
           "|_|",
           "   "] = '8'



    digits[" _ ",
           "|_|",
           " _|",
           "   "] = '9'


    triosLines = []
    for line in input_grid
        if length(line) % 3 != 0
            throw(ErrorException("The length of each line must be a multiple of three."))
        end
        trios_in_line = []
        trio = ""
        col = 1
        while col ≤ length(line)
            trio *= line[col]
            if col % 3 == 0
                push!(trios_in_line, trio)
                trio = ""
            end

            col += 1
        end
        push!(triosLines, trios_in_line)
    end

    if length(triosLines) % 4 != 0
        throw(ErrorException("The number of lines must be a multiple of three."))
    end
    output = ""
    lineNum = 1
    while lineNum ≤ length(triosLines)-3
        superCol = 1
        while superCol ≤ length(triosLines[lineNum])
            OCR = (triosLines[lineNum][superCol],
                  triosLines[lineNum + 1][superCol],
                  triosLines[lineNum + 2][superCol],
                  triosLines[lineNum + 3][superCol])

            if haskey(digits, OCR)
                output *= digits[OCR]
            else
                output *= '?'
            end
            superCol += 1
        end

        lineNum += 4
        if lineNum ≤ length(triosLines)-3
            output *= ","
        end
    end


    output
end

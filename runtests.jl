"""Tests for the ocr-numbers exercise

Implementation note:
ocr.readOCR should validate its input and
raise ValueErrors with meaningful error messages
if necessary.
"""

using Test

include("ocr_numbers.jl")

# Tests adapted from `problem-specifications//canonical-data.json` @ v1.2.0
println("\n"^2, "-"^60, "\n"^3)

@testset "recognizes 0" begin
    @test readOCR([" _ ",
                   "| |",
                   "|_|",
                   "   "]) == "0"
end
println()

@testset "recognizes 1" begin
    @test readOCR(["   ",
                   "  |",
                   "  |",
                   "   "]) == "1"
end
println()

@testset "unreadable but correctly sized" begin
    @test readOCR(["   ",
                   "  _",
                   "  |",
                   "   "]) == "?"
end
println()

@testset "line number not multiple of four" begin
    @test_throws ErrorException readOCR([" _ ",
                                         "| |",
                                         "   "])
end
println()

@testset "col number not multiple of three" begin
    @test_throws ErrorException readOCR(["    ",
                                         "   |",
                                         "   |",
                                         "    "])
end
println()

@testset "recognizes 110101100" begin
    input_grid = ["       _     _        _  _ ",
                  "  |  || |  || |  |  || || |",
                  "  |  ||_|  ||_|  |  ||_||_|",
                  "                           "]
    @test readOCR(input_grid) == "110101100"
end
println()

@testset "garbled numbers in string" begin
    input_grid = ["       _     _           _ ",
                  "  |  || |  || |     || || |",
                  "  |  | _|  ||_|  |  ||_||_|",
                  "                           "]
    @test readOCR(input_grid) == "11?10?1?0"
end
println()

@testset "recognizes 2" begin
    @test readOCR([" _ ",
                   " _|",
                   "|_ ",
                   "   "]) == "2"
end
println()

@testset "recognizes 3" begin
    @test readOCR([" _ ",
                   " _|",
                   " _|",
                   "   "]) == "3"
end
println()

@testset "recognizes 4" begin
    @test readOCR(["   ",
                   "|_|",
                   "  |",
                   "   "]) == "4"
end
println()

@testset "recognizes 5" begin
    @test readOCR([" _ ",
                   "|_ ",
                   " _|",
                   "   "]) == "5"
end
println()

@testset "recognizes 6" begin
    @test readOCR([" _ ",
                   "|_ ",
                   "|_|",
                   "   "]) == "6"
end
println()

@testset "recognizes 7" begin
    @test readOCR([" _ ",
                   "  |",
                   "  |",
                   "   "]) == "7"
end
println()

@testset "recognizes 8" begin
    @test readOCR([" _ ",
                   "|_|",
                   "|_|",
                   "   "]) == "8"
end
println()

@testset "recognizes 9" begin
    @test readOCR([" _ ",
                   "|_|",
                   " _|",
                   "   "]) == "9"
end
println()

@testset "recognizes string of decimal numbers" begin
    input_grid = ["    _  _     _  _  _  _  _  _ ",
                  "  | _| _||_||_ |_   ||_||_|| |",
                  "  ||_  _|  | _||_|  ||_| _||_|",
                  "                              "]
    @test readOCR(input_grid) == "1234567890"
end
println()

@testset "recognizes numbers separated by empty lines" begin
    input_grid = ["    _  _ ",
                  "  | _| _|",
                  "  ||_  _|",
                  "         ",
                  "    _  _ ",
                  "|_||_ |_ ",
                  "  | _||_|",
                  "         ",
                  " _  _  _ ",
                  "  ||_||_|",
                  "  ||_| _|",
                  "         "]
    @test readOCR(input_grid) == "123,456,789"
end
println()

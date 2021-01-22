import sys


def genData(inputFile, outputFile, label):
    with open(inputFile, 'r') as istr:
        with open(outputFile, 'w') as ostr:
            for line in istr:
                line = line.rstrip('\n') + f',{label}'
                print(line, file=ostr)


if __name__ == "__main__":
    nargs = len(sys.argv)
    if nargs != 4:
        raise ValueError(f"Program requires 3 arguments, {nargs-1} provided.")
    else:
        print(f"Input file: {sys.argv[1]}")
        print(f"Output file: {sys.argv[2]}")
        print(f"Generating classification data from {sys.argv[1]}...")
        genData(sys.argv[1], sys.argv[2], sys.argv[3])
        print("Done.")

    # print(f"Arguments count: {len(sys.argv)}")
    # for i, arg in enumerate(sys.argv):
    #     print(f"Argument {i:>6}: {arg}")


# if __name__ == "__main__":
#     main()

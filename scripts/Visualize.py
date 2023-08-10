# %%
import matplotlib.pyplot as plt

# %%
def generate_points(sequence):
    points = [(i, sequence[i-1]) for i in range(1, len(sequence) + 1)]
    return points

# %%
def plot_lattice(points, shaded_points):
    # Extract the number of dimensions (n) from the first point
    n = len(points[0])

    # Create a figure and axis
    fig, ax = plt.subplots()

    # Draw the axes lines through (0, 0)
    ax.spines['left'].set_position('zero')
    ax.spines['bottom'].set_position('zero')
    ax.spines['right'].set_color('none')
    ax.spines['top'].set_color('none')

    # Remove ticks
    ax.xaxis.set_ticks_position('none')
    ax.yaxis.set_ticks_position('none')

    # Highlight the lattice points
    for index, point in enumerate(points):
        ax.plot(*point, 'bo', markersize=8)  # 'bo' stands for blue circle marker
        ax.annotate(f'({", ".join(str(coord) for coord in point)})', (point[0] + 0.1, point[1] + 0.1))
        
    # Shade the specified points (upper-right region)
    for point in shaded_points:
        square_points = [(point[0], point[1]), (point[0], point[1] + 1), (point[0] + 1, point[1] + 1), (point[0] + 1, point[1])]
        x_coords, y_coords = zip(*square_points)
        ax.fill(x_coords, y_coords, alpha=0.5, color='gray')

    # Set plot limits and aspect ratio for a square lattice
    max_val = max(max(p) for p in points) + 0.5
    ax.set_xlim(-0.5, 4.5)  # Adjust the limits as per your needs
    ax.set_ylim(-0.5, 4.5)
    ax.set_aspect('equal')

    # Remove axis labels
    ax.set_xticklabels([])
    ax.set_yticklabels([])
    
    # Remove the axes lines
    ax.spines['left'].set_color('none')
    ax.spines['bottom'].set_color('none')

    # Show the plot
    plt.grid(True)
    plt.show()
    
    return fig, ax

#%%
def vincularMesh (index, length):
    sequence = []
    for i in range(1,length + 1):
        sequence.append((index,i - 1))
    return sequence

#%%
def biVincularMesh (index, length):
    sequence = []
    for i in range(1,length + 1):
        sequence.append((index,i - 1))
        sequence.append((i - 1, index - 1))
    return sequence

#%%
def visualize (points, indeces):
    points = generate_points(points)
    fig, ax = plot_lattice(points, indeces)
    plt.show()  # To display the final plot

#%%
def readSolutions():
    # Open the solution file and print its contents
    with open("solutions", "r") as solutions:
        contents = solutions.read()
    # markdownFile = "```" + contents + "```"
    # display(Markdown(markdownFile))

    # Split the contents by the "language Essence" line to separate solutions
    solution_blocks = contents.split("language Essence 1.3\n")

    # Initialize a list to store the extracted sequences
    sequences = []

    # Iterate through each solution block
    for solution_block in solution_blocks:
        # Skip empty blocks
        if solution_block.strip():
            # Find the line containing "letting perm be sequence" and extract the sequence
            sequence_line = [line for line in solution_block.splitlines() if "letting perm be sequence" in line]
            if sequence_line:
                sequence = sequence_line[0].split("sequence(")[1].split(")")[0]
                sequence_list = [int(item) for item in sequence.split(", ")]
                sequences.append(sequence_list)
                
    sequences = sorted(sequences)

    print("\nNumber of sequences is: " + str(len(sequences)))
    
    return sequences